// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppointmentData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentData _$AppointmentDataFromJson(Map<String, dynamic> json) {
  return AppointmentData(
    json['code'] as int,
    json['message'] as String,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : AppointmentListData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppointmentDataToJson(AppointmentData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
