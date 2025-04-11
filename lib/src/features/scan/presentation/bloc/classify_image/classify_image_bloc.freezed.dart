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


class ClasifyImageLoading implements ClassifyImageState {
  const ClasifyImageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClasifyImageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyImageState.clasifyImageloading()';
}


}




/// @nodoc


class ClasifyImageLoaded implements ClassifyImageState {
  const ClasifyImageLoaded(this.classificationResultEntity);
  

 final  ClassificationResultEntity classificationResultEntity;

/// Create a copy of ClassifyImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClasifyImageLoadedCopyWith<ClasifyImageLoaded> get copyWith => _$ClasifyImageLoadedCopyWithImpl<ClasifyImageLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClasifyImageLoaded&&(identical(other.classificationResultEntity, classificationResultEntity) || other.classificationResultEntity == classificationResultEntity));
}


@override
int get hashCode => Object.hash(runtimeType,classificationResultEntity);

@override
String toString() {
  return 'ClassifyImageState.clasifyImageloaded(classificationResultEntity: $classificationResultEntity)';
}


}

/// @nodoc
abstract mixin class $ClasifyImageLoadedCopyWith<$Res> implements $ClassifyImageStateCopyWith<$Res> {
  factory $ClasifyImageLoadedCopyWith(ClasifyImageLoaded value, $Res Function(ClasifyImageLoaded) _then) = _$ClasifyImageLoadedCopyWithImpl;
@useResult
$Res call({
 ClassificationResultEntity classificationResultEntity
});




}
/// @nodoc
class _$ClasifyImageLoadedCopyWithImpl<$Res>
    implements $ClasifyImageLoadedCopyWith<$Res> {
  _$ClasifyImageLoadedCopyWithImpl(this._self, this._then);

  final ClasifyImageLoaded _self;
  final $Res Function(ClasifyImageLoaded) _then;

/// Create a copy of ClassifyImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? classificationResultEntity = null,}) {
  return _then(ClasifyImageLoaded(
null == classificationResultEntity ? _self.classificationResultEntity : classificationResultEntity // ignore: cast_nullable_to_non_nullable
as ClassificationResultEntity,
  ));
}


}

/// @nodoc


class ClasifyImageError implements ClassifyImageState {
  const ClasifyImageError(this.failure);
  

 final  Failure failure;

/// Create a copy of ClassifyImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClasifyImageErrorCopyWith<ClasifyImageError> get copyWith => _$ClasifyImageErrorCopyWithImpl<ClasifyImageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClasifyImageError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ClassifyImageState.clasifyImageerror(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ClasifyImageErrorCopyWith<$Res> implements $ClassifyImageStateCopyWith<$Res> {
  factory $ClasifyImageErrorCopyWith(ClasifyImageError value, $Res Function(ClasifyImageError) _then) = _$ClasifyImageErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ClasifyImageErrorCopyWithImpl<$Res>
    implements $ClasifyImageErrorCopyWith<$Res> {
  _$ClasifyImageErrorCopyWithImpl(this._self, this._then);

  final ClasifyImageError _self;
  final $Res Function(ClasifyImageError) _then;

/// Create a copy of ClassifyImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ClasifyImageError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
