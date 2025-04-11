import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/domain/repositories/classification_repository.dart';

class SaveClassifyResultUseCase {
  final ClassificationRepository classificationRepository;

  SaveClassifyResultUseCase({required this.classificationRepository});
  Future<Either<Failure, String>> call(
    String imagePath,
    String label,
    String priority,
    List<Map<String, dynamic>> results,
  ) async {
    return await classificationRepository.saveResult(
      imagePath: imagePath,
      label: label,
      priority: priority,
      results: results,
    );
  }
}
