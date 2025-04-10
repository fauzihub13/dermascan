import 'package:flutter_dermascan/src/core/helper/auth_local_helper.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';
import 'package:flutter_dermascan/src/shared/domain/repositories/local_auth_repository.dart';

class LocalAuthRepositoryImpl extends LocalAuthRepository {
  final AuthLocalHelper _authLocalHelper;

  LocalAuthRepositoryImpl({required AuthLocalHelper authLocalHelper})
    : _authLocalHelper = authLocalHelper;
  @override
  Future<UserEntity> getLocalAuth() async {
    return await _authLocalHelper.getAuthData();
  }

  @override
  Future<void> saveLocalAuth({required UserEntity userEntity}) async {
    return await _authLocalHelper.saveAuthData(userEntity);
  }
}
