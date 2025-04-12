part of 'diagnose_history_bloc.dart';

@freezed
class DiagnoseHistoryState with _$DiagnoseHistoryState {
  const factory DiagnoseHistoryState.initial() = Initial;
  const factory DiagnoseHistoryState.loadingGetDiagnoseHistory() =
      LoadingGetDiagnoseHistory;
  const factory DiagnoseHistoryState.successGetDiagnoseHistory(
    List<DiagnoseHistoryEntity> listDiagnoseHistoryEntity,
  ) = SuccessGetDiagnoseHistory;
  const factory DiagnoseHistoryState.errorGetDiagnoseHistory(Failure failure) =
      ErrorGetDiagnoseHistory;
}
