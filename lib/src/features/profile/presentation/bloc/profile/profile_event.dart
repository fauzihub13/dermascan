part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = Started;
  const factory ProfileEvent.updateProfile({required String name, required String email}) = UpdateProfile;
  const factory ProfileEvent.changePassword({required String oldPassword, required String newPassword, required String passwordConfirmation}) = ChangePassword;
}