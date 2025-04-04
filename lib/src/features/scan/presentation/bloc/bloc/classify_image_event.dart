part of 'classify_image_bloc.dart';

@freezed
class ClassifyImageEvent with _$ClassifyImageEvent {
  const factory ClassifyImageEvent.started() = Started;
  const factory ClassifyImageEvent.classifyImage({required String imagePath}) =
      ClassifyImage;
}
