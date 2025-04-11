part of 'classify_image_bloc.dart';


@freezed
class ClassifyImageState with _$ClassifyImageState {
  const factory ClassifyImageState.initial() = Initial;
  const factory ClassifyImageState.clasifyImageloading() = ClasifyImageLoading;
  const factory ClassifyImageState.clasifyImageloaded(ClassificationResultEntity classificationResultEntity
  ) = ClasifyImageLoaded;
  const factory ClassifyImageState.clasifyImageerror(Failure failure) = ClasifyImageError;
}
