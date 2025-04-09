import 'package:flutter_dermascan/src/features/auth/data/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalHelper {
  final storage = FlutterSecureStorage();

  Future<void> saveAuthData(UserModel userModel) async {
    await storage.write(key: 'auth_data', value: userModel.toJson());
  }

  Future<void> removeAuthData() async {
    await storage.delete(key: 'auth_data');
  }

  Future<bool> isAuthDataExist() async {
    String? value = await storage.read(key: 'auth_data');
    return value != null;
  }

  Future<UserModel> getAuthData() async {
    String? value = await storage.read(key: 'auth_data');

    return UserModel.fromJson(value!);
  }
}
