import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/api_service.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/data/models/user_model.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';

class ProfileDatasources {
  final ApiService _apiService = ApiService.instance;

  Future<Either<Failure, UserEntity>> updateProfile({
    required String name,
    required String email,
  }) async {
    final response = await _apiService.request(
      endpoint: '/profile',
      method: DioMethod.post,
      param: {'name': name, 'email': email},
    );
    if (response.statusCode == 200) {
      return Right(UserModel.fromMap(response.data));
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

  Future<Either<Failure, String>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    final response = await _apiService.request(
      endpoint: '/password',
      method: DioMethod.post,
      param: {
        'old_password': oldPassword,  
        'password': newPassword,
        'password_confirmation': passwordConfirmation,
      },
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
