import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';
import 'package:flutter_dermascan/src/shared/domain/repositories/local_auth_repository.dart';

class GetLocalAuthUseCase {
  final LocalAuthRepository _localAuthRepository;

  GetLocalAuthUseCase({required LocalAuthRepository localAuthRepository})
    : _localAuthRepository = localAuthRepository;
  Future<UserEntity> call() async {
    return await _localAuthRepository.getLocalAuth();
  }
}
