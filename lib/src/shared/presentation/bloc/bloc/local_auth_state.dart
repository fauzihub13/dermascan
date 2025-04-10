part of 'local_auth_bloc.dart';

@freezed
class LocalAuthState with _$LocalAuthState {
  const factory LocalAuthState.initial() = Initial;
  const factory LocalAuthState.loading() = Loading;
  const factory LocalAuthState.succesGetLocalAuth(UserEntity userEntity) = SuccesGetLocalAuth;
  const factory LocalAuthState.succesSaveLocalAuth() = SuccesSaveLocalAuth;
}
