// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnose_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiagnoseHistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnoseHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiagnoseHistoryEvent()';
}


}

/// @nodoc
class $DiagnoseHistoryEventCopyWith<$Res>  {
$DiagnoseHistoryEventCopyWith(DiagnoseHistoryEvent _, $Res Function(DiagnoseHistoryEvent) __);
}


/// @nodoc


class Started implements DiagnoseHistoryEvent {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiagnoseHistoryEvent.started()';
}


}




/// @nodoc


class GetDiagnoseHistory implements DiagnoseHistoryEvent {
  const GetDiagnoseHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetDiagnoseHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiagnoseHistoryEvent.getDiagnoseHistory()';
}


}




/// @nodoc
mixin _$DiagnoseHistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnoseHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiagnoseHistoryState()';
}


}

/// @nodoc
class $DiagnoseHistoryStateCopyWith<$Res>  {
$DiagnoseHistoryStateCopyWith(DiagnoseHistoryState _, $Res Function(DiagnoseHistoryState) __);
}


/// @nodoc


class Initial implements DiagnoseHistoryState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiagnoseHistoryState.initial()';
}


}




/// @nodoc


class LoadingGetDiagnoseHistory implements DiagnoseHistoryState {
  const LoadingGetDiagnoseHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingGetDiagnoseHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiagnoseHistoryState.loadingGetDiagnoseHistory()';
}


}




/// @nodoc


class SuccessGetDiagnoseHistory implements DiagnoseHistoryState {
  const SuccessGetDiagnoseHistory(final  List<DiagnoseHistoryEntity> listDiagnoseHistoryEntity): _listDiagnoseHistoryEntity = listDiagnoseHistoryEntity;
  

 final  List<DiagnoseHistoryEntity> _listDiagnoseHistoryEntity;
 List<DiagnoseHistoryEntity> get listDiagnoseHistoryEntity {
  if (_listDiagnoseHistoryEntity is EqualUnmodifiableListView) return _listDiagnoseHistoryEntity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listDiagnoseHistoryEntity);
}


/// Create a copy of DiagnoseHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessGetDiagnoseHistoryCopyWith<SuccessGetDiagnoseHistory> get copyWith => _$SuccessGetDiagnoseHistoryCopyWithImpl<SuccessGetDiagnoseHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetDiagnoseHistory&&const DeepCollectionEquality().equals(other._listDiagnoseHistoryEntity, _listDiagnoseHistoryEntity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_listDiagnoseHistoryEntity));

@override
String toString() {
  return 'DiagnoseHistoryState.successGetDiagnoseHistory(listDiagnoseHistoryEntity: $listDiagnoseHistoryEntity)';
}


}

/// @nodoc
abstract mixin class $SuccessGetDiagnoseHistoryCopyWith<$Res> implements $DiagnoseHistoryStateCopyWith<$Res> {
  factory $SuccessGetDiagnoseHistoryCopyWith(SuccessGetDiagnoseHistory value, $Res Function(SuccessGetDiagnoseHistory) _then) = _$SuccessGetDiagnoseHistoryCopyWithImpl;
@useResult
$Res call({
 List<DiagnoseHistoryEntity> listDiagnoseHistoryEntity
});




}
/// @nodoc
class _$SuccessGetDiagnoseHistoryCopyWithImpl<$Res>
    implements $SuccessGetDiagnoseHistoryCopyWith<$Res> {
  _$SuccessGetDiagnoseHistoryCopyWithImpl(this._self, this._then);

  final SuccessGetDiagnoseHistory _self;
  final $Res Function(SuccessGetDiagnoseHistory) _then;

/// Create a copy of DiagnoseHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? listDiagnoseHistoryEntity = null,}) {
  return _then(SuccessGetDiagnoseHistory(
null == listDiagnoseHistoryEntity ? _self._listDiagnoseHistoryEntity : listDiagnoseHistoryEntity // ignore: cast_nullable_to_non_nullable
as List<DiagnoseHistoryEntity>,
  ));
}


}

/// @nodoc


class ErrorGetDiagnoseHistory implements DiagnoseHistoryState {
  const ErrorGetDiagnoseHistory(this.failure);
  

 final  Failure failure;

/// Create a copy of DiagnoseHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorGetDiagnoseHistoryCopyWith<ErrorGetDiagnoseHistory> get copyWith => _$ErrorGetDiagnoseHistoryCopyWithImpl<ErrorGetDiagnoseHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorGetDiagnoseHistory&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DiagnoseHistoryState.errorGetDiagnoseHistory(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ErrorGetDiagnoseHistoryCopyWith<$Res> implements $DiagnoseHistoryStateCopyWith<$Res> {
  factory $ErrorGetDiagnoseHistoryCopyWith(ErrorGetDiagnoseHistory value, $Res Function(ErrorGetDiagnoseHistory) _then) = _$ErrorGetDiagnoseHistoryCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ErrorGetDiagnoseHistoryCopyWithImpl<$Res>
    implements $ErrorGetDiagnoseHistoryCopyWith<$Res> {
  _$ErrorGetDiagnoseHistoryCopyWithImpl(this._self, this._then);

  final ErrorGetDiagnoseHistory _self;
  final $Res Function(ErrorGetDiagnoseHistory) _then;

/// Create a copy of DiagnoseHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ErrorGetDiagnoseHistory(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
