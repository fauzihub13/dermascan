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
    if (json.containsKey('user')) {
      Map<String, dynamic> user = json['user'];
      return UserModel(
        id: user['id'],
        name: user['name'],
        email: user['email'],
        emailVerifiedAt: user['emailVerifiedAt'],
        createdAt: DateTime.parse(user["created_at"]),
        updatedAt: DateTime.parse(user["updated_at"]),
        role: user['role'],
        token: json['token'],
      );
    } else {
      return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        role: json['role'],
        token: json['token'],
      );
    }
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      emailVerifiedAt: entity.emailVerifiedAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      role: entity.role,
      token: entity.token,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      emailVerifiedAt: emailVerifiedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      role: role,
      token: token,
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
    "token": token,
  };
}
