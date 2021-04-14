// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DoctorAppointmentData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAppointmentData _$DoctorAppointmentDataFromJson(
    Map<String, dynamic> json) {
  return DoctorAppointmentData(
    json['code'] as int,
    json['serialNo'] as int,
    json['message'] as String,
  );
}

Map<String, dynamic> _$DoctorAppointmentDataToJson(
        DoctorAppointmentData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'serialNo': instance.serialNo,
      'message': instance.message,
    };
