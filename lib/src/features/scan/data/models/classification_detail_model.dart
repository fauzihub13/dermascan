import 'dart:convert';

import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_detail_entity.dart';

class ClassificationDetailModel extends ClassificationDetailEntity {
  const ClassificationDetailModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
    required super.causes,
    required super.symptoms,
    required super.solutions,
  });

  factory ClassificationDetailModel.fromJson(String str) {
    return ClassificationDetailModel.fromMap(jsonDecode(str));
  }

  factory ClassificationDetailModel.fromMap(Map<String, dynamic> json) {
    Map<String, dynamic> classifyDetail = json['classify_detail'];
    return ClassificationDetailModel(
      id: classifyDetail['id'],
      name: classifyDetail['name'],
      slug: classifyDetail['slug'],
      description: classifyDetail['description'],
      causes: classifyDetail['causes'],
      symptoms: classifyDetail['symptoms'],
      solutions: classifyDetail['solutions'],
    );
  }
}
