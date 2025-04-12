import 'dart:convert';

import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_result_entity.dart';

class DiagnoseHistoryResultModel extends DiagnoseHistoryResultEntity {
  const DiagnoseHistoryResultModel({
    required super.id,
    required super.classifyImageId,
    required super.label,
    required super.confidence,
    required super.createdAt,
    required super.updatedAt,
  });

  factory DiagnoseHistoryResultModel.fromJson(String str) {
    return DiagnoseHistoryResultModel.fromMap(jsonDecode(str));
  }

  factory DiagnoseHistoryResultModel.fromMap(Map<String, dynamic> json) {
    return DiagnoseHistoryResultModel(
      id: json['id'],
      classifyImageId: json['classify_image_id'],
      label: json['label'],
      confidence: json['confidence'],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}
