// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DoctorData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) {
  return DoctorData(
    json['code'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : DoctorListData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.list,
    };
