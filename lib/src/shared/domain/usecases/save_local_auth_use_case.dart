import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';
import 'package:flutter_dermascan/src/shared/domain/repositories/local_auth_repository.dart';

class SaveLocalAuthUseCase {
  final LocalAuthRepository _localAuthRepository;

  SaveLocalAuthUseCase({required LocalAuthRepository localAuthRepository})
    : _localAuthRepository = localAuthRepository;

  Future<void> call(UserEntity userEntity) async {
    return await _localAuthRepository.saveLocalAuth(userEntity: userEntity);
  }
}
