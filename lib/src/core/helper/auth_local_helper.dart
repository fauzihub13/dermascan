import 'package:flutter_dermascan/src/shared/data/models/user_model.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalHelper {
  final storage = FlutterSecureStorage();

  Future<void> saveAuthData(UserEntity userEntity) async {
    final userModel = UserModel.fromEntity(userEntity);
    await storage.write(key: 'auth_data', value: userModel.toJson());
  }
  Future<void> saveAuthToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  Future<void> removeAuthData() async {
    await storage.delete(key: 'auth_data');
  }

  Future<bool> isAuthDataExist() async {
    String? value = await storage.read(key: 'auth_data');
    return value != null;
  }

  Future<UserEntity> getAuthData() async {
    String? value = await storage.read(key: 'auth_data');
    final userModel = UserModel.fromJson(value!);
    return userModel.toEntity();
  }

  Future<String> getAuthToken() async {
    String? value = await storage.read(key: 'auth_token');
    return value!;
  }
}
