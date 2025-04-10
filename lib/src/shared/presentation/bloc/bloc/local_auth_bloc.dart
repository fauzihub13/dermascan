import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';
import 'package:flutter_dermascan/src/shared/domain/usecases/get_local_auth_use_case.dart';
import 'package:flutter_dermascan/src/shared/domain/usecases/save_local_auth_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_auth_bloc.freezed.dart';
part 'local_auth_event.dart';
part 'local_auth_state.dart';

class LocalAuthBloc extends Bloc<LocalAuthEvent, LocalAuthState> {
  final GetLocalAuthUseCase _getLocalAuthUseCase;
  final SaveLocalAuthUseCase _saveLocalAuthUseCase;
  LocalAuthBloc(this._getLocalAuthUseCase, this._saveLocalAuthUseCase)
    : super(LocalAuthState.initial()) {
    on<SaveLocalAuth>((event, emit) async {
      emit(LocalAuthState.loading());
      await _saveLocalAuthUseCase.call(event.userEntity);
      emit(SuccesSaveLocalAuth());
    });

    on<GetLocalAuth>((event, emit) async {
      emit(LocalAuthState.loading());
      final result = await _getLocalAuthUseCase.call();
      emit(SuccesGetLocalAuth(result));
    });
  }
}
