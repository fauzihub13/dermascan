import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/save_classify_result_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'classify_bloc.freezed.dart';
part 'classify_event.dart';
part 'classify_state.dart';

class ClassifyBloc extends Bloc<ClassifyEvent, ClassifyState> {
  final SaveClassifyResultUseCase saveClassifyResultUseCase;
  ClassifyBloc(this.saveClassifyResultUseCase) : super(ClassifyState.initial()) {
    on<SaveResult>((event, emit) async {
      emit(Loading());
       final result = await saveClassifyResultUseCase.call(
          event.imagePath,
          event.label,
          event.priority,
          event.reuslts,
        );
        result.fold(
          (error) {
            emit(errorSaveResult(error));
          },
          (success) {
            emit(successSaveResult());
          },
        );
    });
  }
}
