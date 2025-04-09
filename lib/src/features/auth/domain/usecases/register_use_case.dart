import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Either<Failure, String>> call(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    return await _authRepository.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
