part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.successLogin(UserEntity userEntity) = SuccessLogin;
  const factory AuthState.successRegister() = SuccessRegister;
  const factory AuthState.successLogout() = SuccessLogout;
  const factory AuthState.loginError(Failure failure) = LoginError;
  const factory AuthState.registerError(Failure failure) = RegisterError;
  const factory AuthState.logoutError(Failure failure) = LogoutError;
}
