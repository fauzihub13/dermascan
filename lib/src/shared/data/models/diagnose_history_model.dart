import 'dart:convert';

import 'package:flutter_dermascan/src/shared/data/models/diagnose_history_result_model.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_entity.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_result_entity.dart';

class DiagnoseHistoryModel extends DiagnoseHistoryEntity {
  const DiagnoseHistoryModel({
    required super.id,
    required super.userId,
    required super.code,
    required super.imagePath,
    required super.label,
    required super.priority,
    required super.createdAt,
    required super.updatedAt,
    required super.classifyImageResults,
  });

  factory DiagnoseHistoryModel.fromJson(String str) {
    return DiagnoseHistoryModel.fromMap(jsonDecode(str));
  }

  factory DiagnoseHistoryModel.fromMap(Map<String, dynamic> json) {
    return DiagnoseHistoryModel(
      id: json['id'],
      userId: json['user_id'],
      code: json['code'],
      imagePath: json['image_path'],
      label: json['label'],
      priority: json['priority'],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      classifyImageResults: List<DiagnoseHistoryResultEntity>.from(
        json['classify_image_results'].map(
          (x) => DiagnoseHistoryResultModel.fromMap(x),
        ),
      ),
    );
  }
}

class DiagnoseHistoryResponseModel {
  final String status;
  final String message;
  final List<DiagnoseHistoryEntity> classifyImageHistory;

  DiagnoseHistoryResponseModel({
    required this.status,
    required this.message,
    required this.classifyImageHistory,
  });

  factory DiagnoseHistoryResponseModel.fromMap(Map<String, dynamic> json) {
    return DiagnoseHistoryResponseModel(
      status: json['status'],
      message: json['message'],
      classifyImageHistory: List<DiagnoseHistoryEntity>.from(
        json['classify_image_history'].map(
          (x) => DiagnoseHistoryModel.fromMap(x),
        ),
      ),
    );
  }
}
