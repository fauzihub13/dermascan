part of 'diagnose_history_bloc.dart';

@freezed
class DiagnoseHistoryEvent with _$DiagnoseHistoryEvent {
  const factory DiagnoseHistoryEvent.started() = Started;
  const factory DiagnoseHistoryEvent.getDiagnoseHistory() = GetDiagnoseHistory;
}