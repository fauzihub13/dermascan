part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loadingDeleteAccount() = LoadingDeleteAccount;
  const factory ProfileState.successDeleteAccount() = SuccessDeleteAccount;
  const factory ProfileState.successUpdateProfile(UserEntity userEntity) =
      SuccessUpdateProfile;
  const factory ProfileState.successChangePassword(String message) =
      SuccessChangePassword;
  const factory ProfileState.errorUpdateProfile(Failure failure) =
      ErrorUpdateProfile;
  const factory ProfileState.errorChangePassword(Failure failure) =
      ErrorChangePassword;
  const factory ProfileState.errorDeleteAccount(Failure failur) =
      ErrorDeleteAccount;
}
