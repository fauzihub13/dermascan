import 'dart:convert';

import 'package:flutter_dermascan/src/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.role,
    required super.token,
  });

  factory UserModel.fromJson(String str) {
    return UserModel.fromMap(json.decode(str));
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    Map<String, dynamic> user = json['user'];
    return UserModel(
      id: user['id'],
      name: user['name'],
      email: user['email'],
      emailVerifiedAt: user['emailVerifiedAt'],
      createdAt:  DateTime.parse(user["created_at"]),
      updatedAt: DateTime.parse(user["updated_at"]),
      role: user['role'],
      token: json['token'],
      
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "role": role,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
