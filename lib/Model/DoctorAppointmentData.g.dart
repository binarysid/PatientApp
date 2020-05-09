// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DoctorAppointmentData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAppointmentData _$DoctorAppointmentDataFromJson(
    Map<String, dynamic> json) {
  return DoctorAppointmentData(
    json['code'] as int,
    json['serial_no'] as int,
    json['userID'] as int,
  );
}

Map<String, dynamic> _$DoctorAppointmentDataToJson(
        DoctorAppointmentData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'serial_no': instance.serialNo,
      'userID': instance.userID,
    };
