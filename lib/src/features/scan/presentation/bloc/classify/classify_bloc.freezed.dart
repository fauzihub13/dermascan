// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classify_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClassifyEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifyEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyEvent()';
}


}

/// @nodoc
class $ClassifyEventCopyWith<$Res>  {
$ClassifyEventCopyWith(ClassifyEvent _, $Res Function(ClassifyEvent) __);
}


/// @nodoc


class Started implements ClassifyEvent {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyEvent.started()';
}


}




/// @nodoc


class SaveResult implements ClassifyEvent {
  const SaveResult({required this.imagePath, required this.label, required this.priority, required final  List<Map<String, dynamic>> reuslts}): _reuslts = reuslts;
  

 final  String imagePath;
 final  String label;
 final  String priority;
 final  List<Map<String, dynamic>> _reuslts;
 List<Map<String, dynamic>> get reuslts {
  if (_reuslts is EqualUnmodifiableListView) return _reuslts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reuslts);
}


/// Create a copy of ClassifyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveResultCopyWith<SaveResult> get copyWith => _$SaveResultCopyWithImpl<SaveResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveResult&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.label, label) || other.label == label)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other._reuslts, _reuslts));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath,label,priority,const DeepCollectionEquality().hash(_reuslts));

@override
String toString() {
  return 'ClassifyEvent.saveResult(imagePath: $imagePath, label: $label, priority: $priority, reuslts: $reuslts)';
}


}

/// @nodoc
abstract mixin class $SaveResultCopyWith<$Res> implements $ClassifyEventCopyWith<$Res> {
  factory $SaveResultCopyWith(SaveResult value, $Res Function(SaveResult) _then) = _$SaveResultCopyWithImpl;
@useResult
$Res call({
 String imagePath, String label, String priority, List<Map<String, dynamic>> reuslts
});




}
/// @nodoc
class _$SaveResultCopyWithImpl<$Res>
    implements $SaveResultCopyWith<$Res> {
  _$SaveResultCopyWithImpl(this._self, this._then);

  final SaveResult _self;
  final $Res Function(SaveResult) _then;

/// Create a copy of ClassifyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? label = null,Object? priority = null,Object? reuslts = null,}) {
  return _then(SaveResult(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,reuslts: null == reuslts ? _self._reuslts : reuslts // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc
mixin _$ClassifyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState()';
}


}

/// @nodoc
class $ClassifyStateCopyWith<$Res>  {
$ClassifyStateCopyWith(ClassifyState _, $Res Function(ClassifyState) __);
}


/// @nodoc


class Initial implements ClassifyState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState.initial()';
}


}




/// @nodoc


class Loading implements ClassifyState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState.loading()';
}


}




/// @nodoc


class successSaveResult implements ClassifyState {
  const successSaveResult();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is successSaveResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState.successSaveResult()';
}


}




/// @nodoc


class errorSaveResult implements ClassifyState {
  const errorSaveResult(this.failure);
  

 final  Failure failure;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$errorSaveResultCopyWith<errorSaveResult> get copyWith => _$errorSaveResultCopyWithImpl<errorSaveResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is errorSaveResult&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ClassifyState.errorSaveResult(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $errorSaveResultCopyWith<$Res> implements $ClassifyStateCopyWith<$Res> {
  factory $errorSaveResultCopyWith(errorSaveResult value, $Res Function(errorSaveResult) _then) = _$errorSaveResultCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$errorSaveResultCopyWithImpl<$Res>
    implements $errorSaveResultCopyWith<$Res> {
  _$errorSaveResultCopyWithImpl(this._self, this._then);

  final errorSaveResult _self;
  final $Res Function(errorSaveResult) _then;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(errorSaveResult(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
