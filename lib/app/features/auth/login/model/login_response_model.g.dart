// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    _LoginResponseModel(
      success: json['success'] as bool,
      code: (json['code'] as num).toInt(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

_Data _$DataFromJson(Map<String, dynamic> json) =>
    _Data(accessToken: json['accessToken'] as String);

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
};
