part of 'classify_image_bloc.dart';


@freezed
class ClassifyImageState with _$ClassifyImageState {
  const factory ClassifyImageState.initial() = Initial;
  const factory ClassifyImageState.loading() = Loading;
  const factory ClassifyImageState.loaded(ClassificationResultEntity classificationResultEntity
  ) = Loaded;
  const factory ClassifyImageState.error(Failure failure) = Error;
}
