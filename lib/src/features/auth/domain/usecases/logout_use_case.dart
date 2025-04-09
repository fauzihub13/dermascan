import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  Future<Either<Failure, String>> call() async {
    return await authRepository.logout();
  }
}
