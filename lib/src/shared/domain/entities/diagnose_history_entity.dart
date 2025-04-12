import 'package:equatable/equatable.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_result_entity.dart';

class DiagnoseHistoryEntity extends Equatable {
  final String id;
  final String userId;
  final String code;
  final String imagePath;
  final String label;
  final String priority;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<DiagnoseHistoryResultEntity> classifyImageResults;

  const DiagnoseHistoryEntity({
    required this.id,
    required this.userId,
    required this.code,
    required this.imagePath,
    required this.label,
    required this.priority,
    required this.createdAt,
    required this.updatedAt,
    required this.classifyImageResults,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    code,
    imagePath,
    label,
    priority,
    createdAt,
    updatedAt,
    classifyImageResults,
  ];
}
