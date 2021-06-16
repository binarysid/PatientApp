// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonResponseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseData _$CommonResponseDataFromJson(Map<String, dynamic> json) {
  return CommonResponseData(
    json['code'] as int,
    json['id'] as int,
    json['message'] as String,
  );
}

Map<String, dynamic> _$CommonResponseDataToJson(CommonResponseData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'message': instance.message,
    };
