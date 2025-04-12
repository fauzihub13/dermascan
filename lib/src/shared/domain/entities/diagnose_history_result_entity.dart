import 'package:equatable/equatable.dart';

class DiagnoseHistoryResultEntity extends Equatable {
  final String id;
  final String classifyImageId;
  final String label;
  final double confidence;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DiagnoseHistoryResultEntity({
    required this.id,
    required this.classifyImageId,
    required this.label,
    required this.confidence,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    classifyImageId,
    label,
    confidence,
    createdAt,
    updatedAt,
  ];
}
