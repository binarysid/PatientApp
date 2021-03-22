// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DoctorScheduleData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorScheduleData _$DoctorScheduleDataFromJson(Map<String, dynamic> json) {
  return DoctorScheduleData(
    json['code'] as int,
    json['message'] as String,
    (json['schedule'] as List<dynamic>)
        .map((e) => DoctorScheduleListData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DoctorScheduleDataToJson(DoctorScheduleData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'schedule': instance.data,
    };
