import 'package:equatable/equatable.dart';

class ClassificationResultEntity extends Equatable {
  final List<Map<String, dynamic>> results;

  const ClassificationResultEntity({required this.results});

  @override
  List<Object?> get props => [results];
}
