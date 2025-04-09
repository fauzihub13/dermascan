import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/api_service.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/auth/data/models/user_model.dart';
import 'package:flutter_dermascan/src/features/auth/domain/entities/user_entity.dart';

class AuthRemoteDataSource {
  final ApiService _apiService = ApiService.instance;

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.request(
      endpoint: '/login',
      method: DioMethod.post,
      param: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      return Right(UserModel.fromMap(response.data));
    } else {
      return Left(Failure(message: response.data['message']));
    }
  }

  Future<Either<Failure, String>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await _apiService.request(
      endpoint: '/register',
      method: DioMethod.post,
      param: {
        'name': name,
        'email': email,
        'password': password,
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

  Future<Either<Failure, String>> logout() async {
    final response = await _apiService.request(
      endpoint: '/logout',
      method: DioMethod.post,
    );
    if (response.statusCode == 200) {
      return Right(response.data['message']);
    } else {
      return Left(Failure(message: response.data['message']));
    }
  }
}
