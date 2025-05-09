import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_dermascan/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
    : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await _authRemoteDataSource.login(
      email: email,
      password: password,
    );
    return result;
  }

  @override
  Future<Either<Failure, String>> logout() async {
    final result = await _authRemoteDataSource.logout();
    return result;
  }

  @override
  Future<Either<Failure, String>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final result = await _authRemoteDataSource.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    return result;
  }
}
