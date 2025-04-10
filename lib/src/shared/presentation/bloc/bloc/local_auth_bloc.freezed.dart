// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalAuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalAuthEvent()';
}


}

/// @nodoc
class $LocalAuthEventCopyWith<$Res>  {
$LocalAuthEventCopyWith(LocalAuthEvent _, $Res Function(LocalAuthEvent) __);
}


/// @nodoc


class Started implements LocalAuthEvent {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalAuthEvent.started()';
}


}




/// @nodoc


class GetLocalAuth implements LocalAuthEvent {
  const GetLocalAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLocalAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalAuthEvent.getLocalAuth()';
}


}




/// @nodoc


class SaveLocalAuth implements LocalAuthEvent {
  const SaveLocalAuth(this.userEntity);
  

 final  UserEntity userEntity;

/// Create a copy of LocalAuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveLocalAuthCopyWith<SaveLocalAuth> get copyWith => _$SaveLocalAuthCopyWithImpl<SaveLocalAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveLocalAuth&&(identical(other.userEntity, userEntity) || other.userEntity == userEntity));
}


@override
int get hashCode => Object.hash(runtimeType,userEntity);

@override
String toString() {
  return 'LocalAuthEvent.saveLocalAuth(userEntity: $userEntity)';
}


}

/// @nodoc
abstract mixin class $SaveLocalAuthCopyWith<$Res> implements $LocalAuthEventCopyWith<$Res> {
  factory $SaveLocalAuthCopyWith(SaveLocalAuth value, $Res Function(SaveLocalAuth) _then) = _$SaveLocalAuthCopyWithImpl;
@useResult
$Res call({
 UserEntity userEntity
});




}
/// @nodoc
class _$SaveLocalAuthCopyWithImpl<$Res>
    implements $SaveLocalAuthCopyWith<$Res> {
  _$SaveLocalAuthCopyWithImpl(this._self, this._then);

  final SaveLocalAuth _self;
  final $Res Function(SaveLocalAuth) _then;

/// Create a copy of LocalAuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userEntity = null,}) {
  return _then(SaveLocalAuth(
null == userEntity ? _self.userEntity : userEntity // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc
mixin _$LocalAuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalAuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalAuthState()';
}


}

/// @nodoc
class $LocalAuthStateCopyWith<$Res>  {
$LocalAuthStateCopyWith(LocalAuthState _, $Res Function(LocalAuthState) __);
}


/// @nodoc


class Initial implements LocalAuthState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalAuthState.initial()';
}


}




/// @nodoc


class Loading implements LocalAuthState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalAuthState.loading()';
}


}




/// @nodoc


class SuccesGetLocalAuth implements LocalAuthState {
  const SuccesGetLocalAuth(this.userEntity);
  

 final  UserEntity userEntity;

/// Create a copy of LocalAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccesGetLocalAuthCopyWith<SuccesGetLocalAuth> get copyWith => _$SuccesGetLocalAuthCopyWithImpl<SuccesGetLocalAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccesGetLocalAuth&&(identical(other.userEntity, userEntity) || other.userEntity == userEntity));
}


@override
int get hashCode => Object.hash(runtimeType,userEntity);

@override
String toString() {
  return 'LocalAuthState.succesGetLocalAuth(userEntity: $userEntity)';
}


}

/// @nodoc
abstract mixin class $SuccesGetLocalAuthCopyWith<$Res> implements $LocalAuthStateCopyWith<$Res> {
  factory $SuccesGetLocalAuthCopyWith(SuccesGetLocalAuth value, $Res Function(SuccesGetLocalAuth) _then) = _$SuccesGetLocalAuthCopyWithImpl;
@useResult
$Res call({
 UserEntity userEntity
});




}
/// @nodoc
class _$SuccesGetLocalAuthCopyWithImpl<$Res>
    implements $SuccesGetLocalAuthCopyWith<$Res> {
  _$SuccesGetLocalAuthCopyWithImpl(this._self, this._then);

  final SuccesGetLocalAuth _self;
  final $Res Function(SuccesGetLocalAuth) _then;

/// Create a copy of LocalAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userEntity = null,}) {
  return _then(SuccesGetLocalAuth(
null == userEntity ? _self.userEntity : userEntity // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc


class SuccesSaveLocalAuth implements LocalAuthState {
  const SuccesSaveLocalAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccesSaveLocalAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocalAuthState.succesSaveLocalAuth()';
}


}




// dart format on
