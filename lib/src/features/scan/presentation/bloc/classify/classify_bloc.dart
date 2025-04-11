import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/scan/domain/entities/classification_detail_entity.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/get_detail_diagnose_use_case.dart';
import 'package:flutter_dermascan/src/features/scan/domain/usecases/save_classify_result_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'classify_bloc.freezed.dart';
part 'classify_event.dart';
part 'classify_state.dart';

class ClassifyBloc extends Bloc<ClassifyEvent, ClassifyState> {
  final SaveClassifyResultUseCase saveClassifyResultUseCase;
  final GetDetailDiagnoseUseCase getDetailDiagnoseUseCase;
  
  ClassifyBloc(this.saveClassifyResultUseCase, this.getDetailDiagnoseUseCase) : super(ClassifyState.initial()) {

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
            emit(ErrorSaveResult(error));
          },
          (success) {
            emit(SuccessSaveResult());
          },
        );
    });

    on<GetDetailDiagnose>((event, emit) async {
      emit(Loading());
       final result = await getDetailDiagnoseUseCase.call(
          event.diganose,
        );
        result.fold(
          (error) {
            emit(ErrorGetDetailDiagnose(error));
          },
          (success) {
            emit(SuccessGetDetailDiagnose(success));
          },
        );
    });

  }
}
