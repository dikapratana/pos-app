// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GlobalResponseModel {

 bool get success; int get code; dynamic get data; String get message;
/// Create a copy of GlobalResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalResponseModelCopyWith<GlobalResponseModel> get copyWith => _$GlobalResponseModelCopyWithImpl<GlobalResponseModel>(this as GlobalResponseModel, _$identity);

  /// Serializes this GlobalResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,code,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'GlobalResponseModel(success: $success, code: $code, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $GlobalResponseModelCopyWith<$Res>  {
  factory $GlobalResponseModelCopyWith(GlobalResponseModel value, $Res Function(GlobalResponseModel) _then) = _$GlobalResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, int code, dynamic data, String message
});




}
/// @nodoc
class _$GlobalResponseModelCopyWithImpl<$Res>
    implements $GlobalResponseModelCopyWith<$Res> {
  _$GlobalResponseModelCopyWithImpl(this._self, this._then);

  final GlobalResponseModel _self;
  final $Res Function(GlobalResponseModel) _then;

/// Create a copy of GlobalResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? code = null,Object? data = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GlobalResponseModel].
extension GlobalResponseModelPatterns on GlobalResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GlobalResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GlobalResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GlobalResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _GlobalResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GlobalResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _GlobalResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int code,  dynamic data,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GlobalResponseModel() when $default != null:
return $default(_that.success,_that.code,_that.data,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int code,  dynamic data,  String message)  $default,) {final _that = this;
switch (_that) {
case _GlobalResponseModel():
return $default(_that.success,_that.code,_that.data,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int code,  dynamic data,  String message)?  $default,) {final _that = this;
switch (_that) {
case _GlobalResponseModel() when $default != null:
return $default(_that.success,_that.code,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GlobalResponseModel implements GlobalResponseModel {
  const _GlobalResponseModel({required this.success, required this.code, required this.data, required this.message});
  factory _GlobalResponseModel.fromJson(Map<String, dynamic> json) => _$GlobalResponseModelFromJson(json);

@override final  bool success;
@override final  int code;
@override final  dynamic data;
@override final  String message;

/// Create a copy of GlobalResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalResponseModelCopyWith<_GlobalResponseModel> get copyWith => __$GlobalResponseModelCopyWithImpl<_GlobalResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GlobalResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,code,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'GlobalResponseModel(success: $success, code: $code, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$GlobalResponseModelCopyWith<$Res> implements $GlobalResponseModelCopyWith<$Res> {
  factory _$GlobalResponseModelCopyWith(_GlobalResponseModel value, $Res Function(_GlobalResponseModel) _then) = __$GlobalResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, int code, dynamic data, String message
});




}
/// @nodoc
class __$GlobalResponseModelCopyWithImpl<$Res>
    implements _$GlobalResponseModelCopyWith<$Res> {
  __$GlobalResponseModelCopyWithImpl(this._self, this._then);

  final _GlobalResponseModel _self;
  final $Res Function(_GlobalResponseModel) _then;

/// Create a copy of GlobalResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? code = null,Object? data = freezed,Object? message = null,}) {
  return _then(_GlobalResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
