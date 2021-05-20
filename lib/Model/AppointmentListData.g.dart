// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppointmentListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentListData _$AppointmentListDataFromJson(Map<String, dynamic> json) {
  return AppointmentListData(
    json['id'] as int,
    json['serial'] as int,
    json['status'] as int,
    json['hospital'] as String,
    json['doctor'] as String,
    json['start_time'] as String,
    json['end_time'] as String,
    json['doctor_contact'] as String,
    json['hospital_contact'] as String,
    json['date'] as String,
  );
}

Map<String, dynamic> _$AppointmentListDataToJson(
        AppointmentListData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serial': instance.serial,
      'status': instance.status,
      'hospital': instance.hospital,
      'doctor': instance.doctor,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'doctor_contact': instance.doctorContact,
      'hospital_contact': instance.hospitalContact,
      'date': instance.date,
    };
