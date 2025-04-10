import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/profile/domain/repositories/profile_repository.dart';

class ChangePasswordUseCase {
  final ProfileRepository _profileRepository;

  ChangePasswordUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  Future<Either<Failure, String>> call(
    oldPassword,
    newPassword,
    passwordConfirmation,
  ) async {
    return await _profileRepository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
