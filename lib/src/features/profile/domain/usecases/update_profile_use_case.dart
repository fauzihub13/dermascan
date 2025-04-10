import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';

class UpdateProfileUseCase {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

    Future<Either<Failure, UserEntity>> call (name, email) async {
      return await _profileRepository.updateProfile(name: name, email: email);
    }
}
