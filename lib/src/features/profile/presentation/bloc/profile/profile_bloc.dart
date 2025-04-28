import 'package:bloc/bloc.dart';
import 'package:flutter_dermascan/src/core/helper/auth_local_helper.dart';
import 'package:flutter_dermascan/src/core/network/failure.dart';
import 'package:flutter_dermascan/src/features/profile/domain/usecases/change_password_use_case.dart';
import 'package:flutter_dermascan/src/features/profile/domain/usecases/delete_account_use_case.dart';
import 'package:flutter_dermascan/src/features/profile/domain/usecases/update_profile_use_case.dart';
import 'package:flutter_dermascan/src/shared/data/models/user_model.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;
  ProfileBloc(
    this.updateProfileUseCase,
    this.changePasswordUseCase,
    this.deleteAccountUseCase,
  ) : super(ProfileState.initial()) {
    on<UpdateProfile>((event, emit) async {
      emit(Loading());
      final result = await updateProfileUseCase.call(event.name, event.email);
      await result.fold(
        (error) async {
          emit(ErrorUpdateProfile(error));
        },
        (success) async {
          final userModel = UserModel.fromEntity(success);
          await AuthLocalHelper().saveAuthData(userModel);
          emit(SuccessUpdateProfile(success));
        },
      );
    });

    on<ChangePassword>((event, emit) async {
      emit(Loading());
      final result = await changePasswordUseCase.call(
        event.oldPassword,
        event.newPassword,
        event.passwordConfirmation,
      );
      result.fold(
        (error) {
          emit(ErrorChangePassword(error));
        },
        (success) {
          emit(SuccessChangePassword(success));
        },
      );
    });

    on<DeleteAccount>((event, emit) async {
      emit(LoadingDeleteAccount());
      final result = await deleteAccountUseCase.call();
      await result.fold((error) async => emit(ErrorDeleteAccount(error)), (
        success,
      ) async {
        await AuthLocalHelper().removeAuthData();
        emit(SuccessDeleteAccount());
      });
    });
  }
}
