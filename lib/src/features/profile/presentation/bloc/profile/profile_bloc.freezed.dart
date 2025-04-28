// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// @nodoc


class Started implements ProfileEvent {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.started()';
}


}




/// @nodoc


class DeleteAccount implements ProfileEvent {
  const DeleteAccount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAccount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.deleteAccount()';
}


}




/// @nodoc


class UpdateProfile implements ProfileEvent {
  const UpdateProfile({required this.name, required this.email});
  

 final  String name;
 final  String email;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileCopyWith<UpdateProfile> get copyWith => _$UpdateProfileCopyWithImpl<UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'ProfileEvent.updateProfile(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfileCopyWith(UpdateProfile value, $Res Function(UpdateProfile) _then) = _$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 String name, String email
});




}
/// @nodoc
class _$UpdateProfileCopyWithImpl<$Res>
    implements $UpdateProfileCopyWith<$Res> {
  _$UpdateProfileCopyWithImpl(this._self, this._then);

  final UpdateProfile _self;
  final $Res Function(UpdateProfile) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,}) {
  return _then(UpdateProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangePassword implements ProfileEvent {
  const ChangePassword({required this.oldPassword, required this.newPassword, required this.passwordConfirmation});
  

 final  String oldPassword;
 final  String newPassword;
 final  String passwordConfirmation;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordCopyWith<ChangePassword> get copyWith => _$ChangePasswordCopyWithImpl<ChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePassword&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation));
}


@override
int get hashCode => Object.hash(runtimeType,oldPassword,newPassword,passwordConfirmation);

@override
String toString() {
  return 'ProfileEvent.changePassword(oldPassword: $oldPassword, newPassword: $newPassword, passwordConfirmation: $passwordConfirmation)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $ChangePasswordCopyWith(ChangePassword value, $Res Function(ChangePassword) _then) = _$ChangePasswordCopyWithImpl;
@useResult
$Res call({
 String oldPassword, String newPassword, String passwordConfirmation
});




}
/// @nodoc
class _$ChangePasswordCopyWithImpl<$Res>
    implements $ChangePasswordCopyWith<$Res> {
  _$ChangePasswordCopyWithImpl(this._self, this._then);

  final ChangePassword _self;
  final $Res Function(ChangePassword) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldPassword = null,Object? newPassword = null,Object? passwordConfirmation = null,}) {
  return _then(ChangePassword(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// @nodoc


class Initial implements ProfileState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class Loading implements ProfileState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class LoadingDeleteAccount implements ProfileState {
  const LoadingDeleteAccount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingDeleteAccount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loadingDeleteAccount()';
}


}




/// @nodoc


class SuccessDeleteAccount implements ProfileState {
  const SuccessDeleteAccount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessDeleteAccount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.successDeleteAccount()';
}


}




/// @nodoc


class SuccessUpdateProfile implements ProfileState {
  const SuccessUpdateProfile(this.userEntity);
  

 final  UserEntity userEntity;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessUpdateProfileCopyWith<SuccessUpdateProfile> get copyWith => _$SuccessUpdateProfileCopyWithImpl<SuccessUpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessUpdateProfile&&(identical(other.userEntity, userEntity) || other.userEntity == userEntity));
}


@override
int get hashCode => Object.hash(runtimeType,userEntity);

@override
String toString() {
  return 'ProfileState.successUpdateProfile(userEntity: $userEntity)';
}


}

/// @nodoc
abstract mixin class $SuccessUpdateProfileCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $SuccessUpdateProfileCopyWith(SuccessUpdateProfile value, $Res Function(SuccessUpdateProfile) _then) = _$SuccessUpdateProfileCopyWithImpl;
@useResult
$Res call({
 UserEntity userEntity
});




}
/// @nodoc
class _$SuccessUpdateProfileCopyWithImpl<$Res>
    implements $SuccessUpdateProfileCopyWith<$Res> {
  _$SuccessUpdateProfileCopyWithImpl(this._self, this._then);

  final SuccessUpdateProfile _self;
  final $Res Function(SuccessUpdateProfile) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userEntity = null,}) {
  return _then(SuccessUpdateProfile(
null == userEntity ? _self.userEntity : userEntity // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc


class SuccessChangePassword implements ProfileState {
  const SuccessChangePassword(this.message);
  

 final  String message;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessChangePasswordCopyWith<SuccessChangePassword> get copyWith => _$SuccessChangePasswordCopyWithImpl<SuccessChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessChangePassword&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileState.successChangePassword(message: $message)';
}


}

/// @nodoc
abstract mixin class $SuccessChangePasswordCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $SuccessChangePasswordCopyWith(SuccessChangePassword value, $Res Function(SuccessChangePassword) _then) = _$SuccessChangePasswordCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SuccessChangePasswordCopyWithImpl<$Res>
    implements $SuccessChangePasswordCopyWith<$Res> {
  _$SuccessChangePasswordCopyWithImpl(this._self, this._then);

  final SuccessChangePassword _self;
  final $Res Function(SuccessChangePassword) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SuccessChangePassword(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorUpdateProfile implements ProfileState {
  const ErrorUpdateProfile(this.failure);
  

 final  Failure failure;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorUpdateProfileCopyWith<ErrorUpdateProfile> get copyWith => _$ErrorUpdateProfileCopyWithImpl<ErrorUpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorUpdateProfile&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ProfileState.errorUpdateProfile(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ErrorUpdateProfileCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ErrorUpdateProfileCopyWith(ErrorUpdateProfile value, $Res Function(ErrorUpdateProfile) _then) = _$ErrorUpdateProfileCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ErrorUpdateProfileCopyWithImpl<$Res>
    implements $ErrorUpdateProfileCopyWith<$Res> {
  _$ErrorUpdateProfileCopyWithImpl(this._self, this._then);

  final ErrorUpdateProfile _self;
  final $Res Function(ErrorUpdateProfile) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ErrorUpdateProfile(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class ErrorChangePassword implements ProfileState {
  const ErrorChangePassword(this.failure);
  

 final  Failure failure;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorChangePasswordCopyWith<ErrorChangePassword> get copyWith => _$ErrorChangePasswordCopyWithImpl<ErrorChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorChangePassword&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ProfileState.errorChangePassword(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ErrorChangePasswordCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ErrorChangePasswordCopyWith(ErrorChangePassword value, $Res Function(ErrorChangePassword) _then) = _$ErrorChangePasswordCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ErrorChangePasswordCopyWithImpl<$Res>
    implements $ErrorChangePasswordCopyWith<$Res> {
  _$ErrorChangePasswordCopyWithImpl(this._self, this._then);

  final ErrorChangePassword _self;
  final $Res Function(ErrorChangePassword) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ErrorChangePassword(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class ErrorDeleteAccount implements ProfileState {
  const ErrorDeleteAccount(this.failur);
  

 final  Failure failur;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorDeleteAccountCopyWith<ErrorDeleteAccount> get copyWith => _$ErrorDeleteAccountCopyWithImpl<ErrorDeleteAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorDeleteAccount&&(identical(other.failur, failur) || other.failur == failur));
}


@override
int get hashCode => Object.hash(runtimeType,failur);

@override
String toString() {
  return 'ProfileState.errorDeleteAccount(failur: $failur)';
}


}

/// @nodoc
abstract mixin class $ErrorDeleteAccountCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ErrorDeleteAccountCopyWith(ErrorDeleteAccount value, $Res Function(ErrorDeleteAccount) _then) = _$ErrorDeleteAccountCopyWithImpl;
@useResult
$Res call({
 Failure failur
});




}
/// @nodoc
class _$ErrorDeleteAccountCopyWithImpl<$Res>
    implements $ErrorDeleteAccountCopyWith<$Res> {
  _$ErrorDeleteAccountCopyWithImpl(this._self, this._then);

  final ErrorDeleteAccount _self;
  final $Res Function(ErrorDeleteAccount) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failur = null,}) {
  return _then(ErrorDeleteAccount(
null == failur ? _self.failur : failur // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
