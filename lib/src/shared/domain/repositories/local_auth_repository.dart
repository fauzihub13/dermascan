import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';

abstract class LocalAuthRepository {
  Future<UserEntity> getLocalAuth();
  Future<void> saveLocalAuth({required UserEntity userEntity});
}
