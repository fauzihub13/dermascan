import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/data/models/diagnose_history_model.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_entity.dart';
import 'package:flutter_dermascan/src/shared/domain/repositories/diagnose_history_repository.dart';

class GetDiagnoseHistoryUseCase {
  final DiagnoseHistoryRepository diagnoseHistoryRepository;

  GetDiagnoseHistoryUseCase({required this.diagnoseHistoryRepository});

  Future<Either<Failure, DiagnoseHistoryResponseModel>> call() async {
    return await diagnoseHistoryRepository.getDiagnoseHistory();
  }
}
