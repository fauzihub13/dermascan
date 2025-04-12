import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/data/models/diagnose_history_model.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_entity.dart';

abstract class DiagnoseHistoryRepository {
  Future<Either<Failure, DiagnoseHistoryResponseModel>> getDiagnoseHistory();
}