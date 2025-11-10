// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GlobalResponseModel _$GlobalResponseModelFromJson(Map<String, dynamic> json) =>
    _GlobalResponseModel(
      success: json['success'] as bool,
      code: (json['code'] as num).toInt(),
      data: json['data'],
      message: json['message'] as String,
    );

Map<String, dynamic> _$GlobalResponseModelToJson(
  _GlobalResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'data': instance.data,
  'message': instance.message,
};
