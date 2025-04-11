import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_result_entity.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/classify_image_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'classify_image_bloc.freezed.dart';
part 'classify_image_event.dart';
part 'classify_image_state.dart';

class ClassifyImageBloc extends Bloc<ClassifyImageEvent, ClassifyImageState> {
  final ClassifyImageUseCase classifyImageUseCase;
  ClassifyImageBloc(this.classifyImageUseCase)
    : super(const ClassifyImageState.initial()) {
    on<ClassifyImage>((event, emit) async {
      emit(Loading());

      final result = await classifyImageUseCase.call(event.imagePath);

      result.fold(
        (failure) {
          return emit(Error(failure));
        },
        (classificationResultEntity) {
          return emit(Loaded(classificationResultEntity));
        },
      );
    });
  }
}
