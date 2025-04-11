// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classify_image_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClassifyImageEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifyImageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyImageEvent()';
}


}

/// @nodoc
class $ClassifyImageEventCopyWith<$Res>  {
$ClassifyImageEventCopyWith(ClassifyImageEvent _, $Res Function(ClassifyImageEvent) __);
}


/// @nodoc


class Started implements ClassifyImageEvent {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyImageEvent.started()';
}


}




/// @nodoc


class ClassifyImage implements ClassifyImageEvent {
  const ClassifyImage({required this.imagePath});
  

 final  String imagePath;

/// Create a copy of ClassifyImageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassifyImageCopyWith<ClassifyImage> get copyWith => _$ClassifyImageCopyWithImpl<ClassifyImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifyImage&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath);

@override
String toString() {
  return 'ClassifyImageEvent.classifyImage(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $ClassifyImageCopyWith<$Res> implements $ClassifyImageEventCopyWith<$Res> {
  factory $ClassifyImageCopyWith(ClassifyImage value, $Res Function(ClassifyImage) _then) = _$ClassifyImageCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class _$ClassifyImageCopyWithImpl<$Res>
    implements $ClassifyImageCopyWith<$Res> {
  _$ClassifyImageCopyWithImpl(this._self, this._then);

  final ClassifyImage _self;
  final $Res Function(ClassifyImage) _then;

/// Create a copy of ClassifyImageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(ClassifyImage(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ClassifyImageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifyImageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyImageState()';
}


}

/// @nodoc
class $ClassifyImageStateCopyWith<$Res>  {
$ClassifyImageStateCopyWith(ClassifyImageState _, $Res Function(ClassifyImageState) __);
}


/// @nodoc


class Initial implements ClassifyImageState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyImageState.initial()';
}


}




/// @nodoc


class Loading implements ClassifyImageState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyImageState.loading()';
}


}




/// @nodoc


class Loaded implements ClassifyImageState {
  const Loaded(this.classificationResultEntity);
  

 final  ClassificationResultEntity classificationResultEntity;

/// Create a copy of ClassifyImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.classificationResultEntity, classificationResultEntity) || other.classificationResultEntity == classificationResultEntity));
}


@override
int get hashCode => Object.hash(runtimeType,classificationResultEntity);

@override
String toString() {
  return 'ClassifyImageState.loaded(classificationResultEntity: $classificationResultEntity)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ClassifyImageStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 ClassificationResultEntity classificationResultEntity
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ClassifyImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? classificationResultEntity = null,}) {
  return _then(Loaded(
null == classificationResultEntity ? _self.classificationResultEntity : classificationResultEntity // ignore: cast_nullable_to_non_nullable
as ClassificationResultEntity,
  ));
}


}

/// @nodoc


class Error implements ClassifyImageState {
  const Error(this.failure);
  

 final  Failure failure;

/// Create a copy of ClassifyImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ClassifyImageState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $ClassifyImageStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of ClassifyImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
