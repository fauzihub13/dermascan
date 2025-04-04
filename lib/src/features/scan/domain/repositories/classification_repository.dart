import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_result_entity.dart';

abstract class ClassificationRepository {
  Future<Either<Failure, void>> init();
  Future<Either<Failure, void>> loadModel();
  Future<Either<Failure, void>> loadLabels();
  Future<Either<Failure, ClassificationResultEntity>> classifyImage({required String imagePath});
}
