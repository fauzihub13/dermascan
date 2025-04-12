import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/diagnose_history_entity.dart';
import 'package:flutter_dermascan/src/shared/domain/usecases/get_diagnose_history_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnose_history_event.dart';
part 'diagnose_history_state.dart';
part 'diagnose_history_bloc.freezed.dart';

class DiagnoseHistoryBloc extends Bloc<DiagnoseHistoryEvent, DiagnoseHistoryState> {
  final GetDiagnoseHistoryUseCase getDiagnoseHistoryUseCase;
  DiagnoseHistoryBloc(this.getDiagnoseHistoryUseCase) : super(Initial()) {

    on<GetDiagnoseHistory>((event, emit) async {
      emit(LoadingGetDiagnoseHistory());
      final result = await getDiagnoseHistoryUseCase.call();
      result.fold((error) {
        emit(ErrorGetDiagnoseHistory(error));
      }, (success) {
        emit(SuccessGetDiagnoseHistory(success.classifyImageHistory));
      });
    });

  }
}
