// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecializationData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) {
  return SpecializationData(
    json['code'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SpecializationListData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.list,
    };
