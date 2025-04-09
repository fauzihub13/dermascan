import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  AuthBloc(this.loginUseCase) : super(AuthState.initial()) {
    on<Login>((event, emit) async {
      emit(Loading());
      final result = await loginUseCase.call(event.email, event.password);
      result.fold(
        (error) => emit(Error(error)),
        (success) => emit(SuccessLogin(success)),
      );
    });
  }
}
