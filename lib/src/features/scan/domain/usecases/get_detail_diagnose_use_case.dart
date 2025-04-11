import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_detail_entity.dart';
import 'package:flutter_dermascan/src/features/scan/domain/repositories/classification_detail_repository.dart';

class GetDetailDiagnoseUseCase {
  final ClassificationDetailRepository classificationDetailRepository;

  GetDetailDiagnoseUseCase({required this.classificationDetailRepository});

  Future<Either<Failure, ClassificationDetailEntity>> call(
    String diagnose,
  ) async {
    return await classificationDetailRepository.getDetailDiagnose(
      diagnose: diagnose,
    );
  }
}
