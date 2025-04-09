part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.successLogin(UserEntity userEntity) = SuccessLogin;
  const factory AuthState.successRegister() = SuccessRegister;
  const factory AuthState.successLogout() = SuccessLogout;
  const factory AuthState.error(Failure failure) = Error;
}
