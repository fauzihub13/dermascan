part of 'local_auth_bloc.dart';

@freezed
class LocalAuthEvent with _$LocalAuthEvent {
  const factory LocalAuthEvent.started() = Started;
  const factory LocalAuthEvent.getLocalAuth() = GetLocalAuth;
  const factory LocalAuthEvent.saveLocalAuth(UserEntity userEntity) = SaveLocalAuth;
}