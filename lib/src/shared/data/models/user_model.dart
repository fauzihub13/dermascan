import 'dart:convert';

import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.role,
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
