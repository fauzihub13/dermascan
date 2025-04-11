import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_detail_entity.dart';

abstract class ClassificationDetailRepository {
  Future<Either<Failure, ClassificationDetailEntity>> getDetailDiagnose({
    required String diagnose,
  });
}
