import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/data/datasources/classification_data_source.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_detail_entity.dart';
import 'package:flutter_dermascan/src/features/scan/domain/repositories/classification_detail_repository.dart';

class ClassificationDetailRepositoryImpl
    extends ClassificationDetailRepository {
  final ClassificationDataSource classificationDataSource;

  ClassificationDetailRepositoryImpl({required this.classificationDataSource});

  @override
  Future<Either<Failure, ClassificationDetailEntity>> getDetailDiagnose({
    required String diagnose,
  }) async {
    return await classificationDataSource.getDetailDiagnose(
      diagnose: diagnose,
    );
  }
}
