part of 'classify_bloc.dart';

@freezed
class ClassifyState with _$ClassifyState {
  const factory ClassifyState.initial() = Initial;
  const factory ClassifyState.loadingSaveResult() = LoadingSaveResult;
  const factory ClassifyState.loadingGetDetailDiagnose() = LoadingGetDetailDiagnose;
  const factory ClassifyState.successSaveResult() = SuccessSaveResult;
  const factory ClassifyState.successGetDetailDiagnose(
    ClassificationDetailEntity classificationDetailEntity,
  ) = SuccessGetDetailDiagnose;
  const factory ClassifyState.errorSaveResult(Failure failure) =
      ErrorSaveResult;
  const factory ClassifyState.errorGetDetailDiagnose(Failure failure) =
      ErrorGetDetailDiagnose;
}
