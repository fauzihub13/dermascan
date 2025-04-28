import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/profile/domain/repositories/profile_repository.dart';

class DeleteAccountUseCase {
  final ProfileRepository profileRepository;

  DeleteAccountUseCase({required this.profileRepository});

  Future<Either<Failure, bool>> call() async {
    return await profileRepository.deleteAccount();
  }
}