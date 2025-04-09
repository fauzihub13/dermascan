part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = Started;
  const factory AuthEvent.login({
    required String email,
    required String password
  }) = Login;
  const factory AuthEvent.register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation
  }) = Register;
  const factory AuthEvent.logout() = Logout;
}