import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/data/datasources/diagnose_history_data_source.dart';
import 'package:flutter_dermascan/src/shared/data/models/diagnose_history_model.dart';
import 'package:flutter_dermascan/src/shared/domain/repositories/diagnose_history_repository.dart';

class DiagnoseHistoryRepositoryImpl extends DiagnoseHistoryRepository {
  final DiagnoseHistoryDataSource diagnoseHistoryDataSource;

  DiagnoseHistoryRepositoryImpl({required this.diagnoseHistoryDataSource});

  @override
  Future<Either<Failure, DiagnoseHistoryResponseModel>>
  getDiagnoseHistory() async {
    return await diagnoseHistoryDataSource.getDetailDiagnose();
  }
}
