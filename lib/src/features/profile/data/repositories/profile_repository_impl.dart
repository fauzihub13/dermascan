import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/profile/data/datasources/profile_datasources.dart';
import 'package:flutter_dermascan/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDatasources _profileDatasources;

  ProfileRepositoryImpl({required ProfileDatasources profileDatasources})
    : _profileDatasources = profileDatasources;

  @override
  Future<Either<Failure, String>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    return await _profileDatasources.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      passwordConfirmation: passwordConfirmation,
    );
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String name,
    required String email,
  }) async {
    return await _profileDatasources.updateProfile(name: name, email: email);
  }

  @override
  Future<Either<Failure, bool>> deleteAccount() async {
    return await _profileDatasources.deleteAccount();
  }
}
