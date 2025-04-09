import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/core/helper/auth_local_helper.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/auth/data/models/user_model.dart';
import 'package:flutter_dermascan/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_dermascan/src/features/auth/domain/usecases/logout_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  AuthBloc(this.loginUseCase, this.logoutUseCase) : super(AuthState.initial()) {
    on<Login>((event, emit) async {
      emit(Loading());
      final result = await loginUseCase.call(event.email, event.password);
      await result.fold((error) async => emit(Error(error)), (success) async {
        final userModel = UserModel.fromEntity(success);
        await AuthLocalHelper().saveAuthData(userModel);
        emit(SuccessLogin(success));
      });
    });

    on<Logout>((event, emit) async {
      emit(Loading());
      final result = await logoutUseCase.call();
      await result.fold((error) async => emit(Error(error)), (success) async {
        await AuthLocalHelper().removeAuthData();
        emit(SuccessLogout());
      });
    });
  }
}
