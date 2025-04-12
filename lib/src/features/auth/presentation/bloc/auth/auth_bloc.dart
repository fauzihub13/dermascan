import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/core/helper/auth_local_helper.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/shared/data/models/user_model.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/logout_use_case.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/register_use_case.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;
  AuthBloc(this.loginUseCase, this.logoutUseCase, this.registerUseCase)
    : super(AuthState.initial()) {
      
    on<Login>((event, emit) async {
      emit(LoadingLogin());
      final result = await loginUseCase.call(event.email, event.password);
      await result.fold((error) async => emit(LoginError(error)), (success) async {
        final userModel = UserModel.fromEntity(success);
        await AuthLocalHelper().saveAuthData(userModel);
        emit(SuccessLogin(success));
      });
    });

    on<Register>((event, emit) async {
      emit(LoadingRegister());
      final result = await registerUseCase.call(
        event.name,
        event.email,
        event.password,
        event.passwordConfirmation,
      );
      result.fold(
        (error) {
          emit(RegisterError(error));
        },
        (success) {
          emit(SuccessRegister());
        },
      );
    });

    on<Logout>((event, emit) async {
      emit(LoadingLogout());
      final result = await logoutUseCase.call();
      await result.fold((error) async => emit(LogoutError(error)), (success) async {
        await AuthLocalHelper().removeAuthData();
        emit(SuccessLogout());
      });
    });
  }
}
