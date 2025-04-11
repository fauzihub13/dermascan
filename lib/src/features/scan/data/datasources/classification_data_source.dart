import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dermascan/src/core/network/api_service.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:image_cropper/image_cropper.dart';

class ClassificationDataSource {
  final ApiService _apiService = ApiService.instance;

  Future<Either<Failure, String>> saveResult({
    required String imagePath,
    required String label,
    required String priority,
    required List<Map<String, dynamic>> results,
  }) async {
    CroppedFile croppedFile = CroppedFile(imagePath);
    File file = File(croppedFile.path);
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(file.path, filename: 'image.png'),
      'label': label,
      'priority': priority,
      'results': results,
    });
    final response = await _apiService.request(
      endpoint: '/diagnose',
      method: DioMethod.post,
      formData: formData,
    );
    if (response.statusCode == 200) {
      return Right(response.data['message']);
    } else if (response.statusCode == 422) {
      final errors = response.data['errors'];
      final errorMessages = errors.entries
          .map((entry) => '${entry.value.join(", ")}')
          .join("\n");
      return Left(Failure(message: errorMessages));
    } else {
      return Left(Failure(message: response.data['message']));
    }
  }
}
