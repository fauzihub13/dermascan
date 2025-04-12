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


class GetDetailDiagnose implements ClassifyEvent {
  const GetDetailDiagnose({required this.diganose});
  

 final  String diganose;

/// Create a copy of ClassifyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetDetailDiagnoseCopyWith<GetDetailDiagnose> get copyWith => _$GetDetailDiagnoseCopyWithImpl<GetDetailDiagnose>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetDetailDiagnose&&(identical(other.diganose, diganose) || other.diganose == diganose));
}


@override
int get hashCode => Object.hash(runtimeType,diganose);

@override
String toString() {
  return 'ClassifyEvent.getDetailDiagnose(diganose: $diganose)';
}


}

/// @nodoc
abstract mixin class $GetDetailDiagnoseCopyWith<$Res> implements $ClassifyEventCopyWith<$Res> {
  factory $GetDetailDiagnoseCopyWith(GetDetailDiagnose value, $Res Function(GetDetailDiagnose) _then) = _$GetDetailDiagnoseCopyWithImpl;
@useResult
$Res call({
 String diganose
});




}
/// @nodoc
class _$GetDetailDiagnoseCopyWithImpl<$Res>
    implements $GetDetailDiagnoseCopyWith<$Res> {
  _$GetDetailDiagnoseCopyWithImpl(this._self, this._then);

  final GetDetailDiagnose _self;
  final $Res Function(GetDetailDiagnose) _then;

/// Create a copy of ClassifyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diganose = null,}) {
  return _then(GetDetailDiagnose(
diganose: null == diganose ? _self.diganose : diganose // ignore: cast_nullable_to_non_nullable
as String,
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


class LoadingSaveResult implements ClassifyState {
  const LoadingSaveResult();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingSaveResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState.loadingSaveResult()';
}


}




/// @nodoc


class LoadingGetDetailDiagnose implements ClassifyState {
  const LoadingGetDetailDiagnose();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingGetDetailDiagnose);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState.loadingGetDetailDiagnose()';
}


}




/// @nodoc


class SuccessSaveResult implements ClassifyState {
  const SuccessSaveResult();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessSaveResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClassifyState.successSaveResult()';
}


}




/// @nodoc


class SuccessGetDetailDiagnose implements ClassifyState {
  const SuccessGetDetailDiagnose(this.classificationDetailEntity);
  

 final  ClassificationDetailEntity classificationDetailEntity;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessGetDetailDiagnoseCopyWith<SuccessGetDetailDiagnose> get copyWith => _$SuccessGetDetailDiagnoseCopyWithImpl<SuccessGetDetailDiagnose>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetDetailDiagnose&&(identical(other.classificationDetailEntity, classificationDetailEntity) || other.classificationDetailEntity == classificationDetailEntity));
}


@override
int get hashCode => Object.hash(runtimeType,classificationDetailEntity);

@override
String toString() {
  return 'ClassifyState.successGetDetailDiagnose(classificationDetailEntity: $classificationDetailEntity)';
}


}

/// @nodoc
abstract mixin class $SuccessGetDetailDiagnoseCopyWith<$Res> implements $ClassifyStateCopyWith<$Res> {
  factory $SuccessGetDetailDiagnoseCopyWith(SuccessGetDetailDiagnose value, $Res Function(SuccessGetDetailDiagnose) _then) = _$SuccessGetDetailDiagnoseCopyWithImpl;
@useResult
$Res call({
 ClassificationDetailEntity classificationDetailEntity
});




}
/// @nodoc
class _$SuccessGetDetailDiagnoseCopyWithImpl<$Res>
    implements $SuccessGetDetailDiagnoseCopyWith<$Res> {
  _$SuccessGetDetailDiagnoseCopyWithImpl(this._self, this._then);

  final SuccessGetDetailDiagnose _self;
  final $Res Function(SuccessGetDetailDiagnose) _then;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? classificationDetailEntity = null,}) {
  return _then(SuccessGetDetailDiagnose(
null == classificationDetailEntity ? _self.classificationDetailEntity : classificationDetailEntity // ignore: cast_nullable_to_non_nullable
as ClassificationDetailEntity,
  ));
}


}

/// @nodoc


class ErrorSaveResult implements ClassifyState {
  const ErrorSaveResult(this.failure);
  

 final  Failure failure;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorSaveResultCopyWith<ErrorSaveResult> get copyWith => _$ErrorSaveResultCopyWithImpl<ErrorSaveResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorSaveResult&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ClassifyState.errorSaveResult(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ErrorSaveResultCopyWith<$Res> implements $ClassifyStateCopyWith<$Res> {
  factory $ErrorSaveResultCopyWith(ErrorSaveResult value, $Res Function(ErrorSaveResult) _then) = _$ErrorSaveResultCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ErrorSaveResultCopyWithImpl<$Res>
    implements $ErrorSaveResultCopyWith<$Res> {
  _$ErrorSaveResultCopyWithImpl(this._self, this._then);

  final ErrorSaveResult _self;
  final $Res Function(ErrorSaveResult) _then;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ErrorSaveResult(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class ErrorGetDetailDiagnose implements ClassifyState {
  const ErrorGetDetailDiagnose(this.failure);
  

 final  Failure failure;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorGetDetailDiagnoseCopyWith<ErrorGetDetailDiagnose> get copyWith => _$ErrorGetDetailDiagnoseCopyWithImpl<ErrorGetDetailDiagnose>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorGetDetailDiagnose&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ClassifyState.errorGetDetailDiagnose(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ErrorGetDetailDiagnoseCopyWith<$Res> implements $ClassifyStateCopyWith<$Res> {
  factory $ErrorGetDetailDiagnoseCopyWith(ErrorGetDetailDiagnose value, $Res Function(ErrorGetDetailDiagnose) _then) = _$ErrorGetDetailDiagnoseCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ErrorGetDetailDiagnoseCopyWithImpl<$Res>
    implements $ErrorGetDetailDiagnoseCopyWith<$Res> {
  _$ErrorGetDetailDiagnoseCopyWithImpl(this._self, this._then);

  final ErrorGetDetailDiagnose _self;
  final $Res Function(ErrorGetDetailDiagnose) _then;

/// Create a copy of ClassifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ErrorGetDetailDiagnose(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
