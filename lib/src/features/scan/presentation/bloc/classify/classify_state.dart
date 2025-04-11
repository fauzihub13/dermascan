part of 'classify_bloc.dart';

@freezed
class ClassifyState with _$ClassifyState {
  const factory ClassifyState.initial() = Initial;
  const factory ClassifyState.loading() = Loading;
  const factory ClassifyState.successSaveResult() = successSaveResult;
  const factory ClassifyState.errorSaveResult(Failure failure) = errorSaveResult;
}
