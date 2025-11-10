// To parse this JSON data, do
//
//     final globalResponseModel = globalResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'global_response_model.freezed.dart';
part 'global_response_model.g.dart';

GlobalResponseModel globalResponseModelFromJson(String str) =>
    GlobalResponseModel.fromJson(json.decode(str));

String globalResponseModelToJson(GlobalResponseModel data) =>
    json.encode(data.toJson());

@freezed
abstract class GlobalResponseModel with _$GlobalResponseModel {
  const factory GlobalResponseModel({
    required bool success,
    required int code,
    required dynamic data,
    required String message,
  }) = _GlobalResponseModel;

  factory GlobalResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GlobalResponseModelFromJson(json);
}
