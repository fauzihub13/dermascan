import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';

abstract class ProfileRepository{

  Future<Either<Failure, UserEntity>> updateProfile({
    required String name,
    required String email,
  });
  Future<Either<Failure, String>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String passwordConfirmation,
  });
  Future<Either<Failure, bool>> deleteAccount();
}