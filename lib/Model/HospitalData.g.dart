// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HospitalData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalData _$HospitalDataFromJson(Map<String, dynamic> json) {
  return HospitalData(
    json['code'] as int,
    json['message'] as String,
    (json['data'] as List<dynamic>)
        .map((e) => HospitalListData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HospitalDataToJson(HospitalData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.list,
    };
