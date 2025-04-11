import 'package:equatable/equatable.dart';

class ClassificationDetailEntity extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String description;
  final String causes;
  final String symptoms;
  final String solutions;

  const ClassificationDetailEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.causes,
    required this.symptoms,
    required this.solutions,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    description,
    causes,
    symptoms,
    solutions,
  ];
}
