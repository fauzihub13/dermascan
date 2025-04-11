part of 'classify_bloc.dart';

@freezed
class ClassifyEvent with _$ClassifyEvent {
  const factory ClassifyEvent.started() = Started;
  const factory ClassifyEvent.saveResult({
    required String imagePath,
    required String label,
    required String priority,
    required List<Map<String, dynamic>> reuslts,
  }) = SaveResult;
}
