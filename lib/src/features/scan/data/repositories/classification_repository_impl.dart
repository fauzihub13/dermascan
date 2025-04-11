import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/data/datasources/classification_data_source.dart';
import 'package:flutter_dermascan/src/features/scan/data/datasources/classification_image_data_source.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_result_entity.dart';
import 'package:flutter_dermascan/src/features/scan/domain/repositories/classification_repository.dart';

class ClassificationRepositoryImpl implements ClassificationRepository {
  final ClassificationImageDataSource dataSource;
  final ClassificationDataSource classificationDataSource;
  bool _isInitialized = false;

  ClassificationRepositoryImpl(this.dataSource, this.classificationDataSource);

  @override
  Future<Either<Failure, void>> init() async {
    if (_isInitialized) {
      return Right(null); // Jika sudah inisialisasi, langsung return success
    }

    final loadModelResult = await dataSource.loadModel();
    if (loadModelResult.isLeft()) return loadModelResult;

    final loadLabelsResult = await dataSource.loadLabels();
    if (loadLabelsResult.isLeft()) return loadLabelsResult;

    _isInitialized = true; // Tandai bahwa model dan label sudah dimuat
    return Right(null);
  }

  @override
  Future<Either<Failure, ClassificationResultEntity>> classifyImage({
    required String imagePath,
  }) async {
    // Pastikan model & label sudah di-load sebelum klasifikasi
    if (!_isInitialized) {
      final initResult = await init();
      if (initResult.isLeft()) {
        return Left(Failure(message: "Failed to initialize model and labels"));
      }
    }
    final result = await dataSource.classifyImage(imagePath: imagePath);
    return result.fold((failure) => Left(failure), (model) => Right(model));
  }

  @override
  Future<Either<Failure, void>> loadModel() => dataSource.loadModel();

  @override
  Future<Either<Failure, void>> loadLabels() => dataSource.loadLabels();
  @override
  Future<Either<Failure, String>> saveResult({
    required String imagePath,
    required String label,
    required String priority,
    required List<Map<String, dynamic>> results,
  }) async {
    return await classificationDataSource.saveResult(
      imagePath: imagePath,
      label: label,
      priority: priority,
      results: results,
    );
  }
}
