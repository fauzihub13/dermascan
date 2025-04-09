import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_dermascan/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
  ) async {
    return await authRepository.login(email: email, password: password);
  }
}
