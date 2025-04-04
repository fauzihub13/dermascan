import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_result_entity.dart';
import 'package:flutter_dermascan/src/features/scan/domain/repositories/classification_repository.dart';

class ClassifyImageUseCase {
  final ClassificationRepository classificationRepository;

  const ClassifyImageUseCase(this.classificationRepository);

  Future<Either<Failure, ClassificationResultEntity>> call(String imagePath) async {

    return await classificationRepository.classifyImage(imagePath: imagePath);
  }
}
