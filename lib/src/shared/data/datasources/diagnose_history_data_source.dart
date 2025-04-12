import 'package:dartz/dartz.dart';
import 'package:flutter_dermascan/src/core/network/api_service.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/data/models/diagnose_history_model.dart';

class DiagnoseHistoryDataSource {
  final ApiService _apiService = ApiService.instance;

  Future<Either<Failure, DiagnoseHistoryResponseModel>>
  getDetailDiagnose() async {
    final response = await _apiService.request(
      endpoint: '/diagnose/history',
      method: DioMethod.get,
    );

    if (response.statusCode == 200) {
      return Right(DiagnoseHistoryResponseModel.fromMap(response.data));
    } else if (response.statusCode == 422) {
      String errorMessages = response.data['message'];
      if (response.data.containsKey('errors')) {
        final errors = response.data['errors'];
        final errorDetails = errors.entries
            .map((entry) => '${entry.value.join(", ")}')
            .join("\n");
        errorMessages += '. $errorDetails';
      }
      return Left(Failure(message: errorMessages));
    } else {
      return Left(Failure(message: response.data['message']));
    }
  }
}
