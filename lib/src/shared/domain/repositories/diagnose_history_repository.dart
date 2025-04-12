import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/data/models/diagnose_history_model.dart';

abstract class DiagnoseHistoryRepository {
  Future<Either<Failure, DiagnoseHistoryResponseModel>> getDiagnoseHistory();
}
