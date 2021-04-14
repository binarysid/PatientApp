// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DoctorProfileData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorProfileData _$DoctorProfileDataFromJson(Map<String, dynamic> json) {
  return DoctorProfileData(
    json['phone'] as String,
    json['room_no'] as String,
    json['visit_end_day'] as String,
    json['visit_end_time'] as String,
    json['visit_fee'] as String,
    json['visit_start_day'] as String,
    json['visit_start_time'] as String,
    json['days'] as String,
    json['degrees'] as String,
  );
}

Map<String, dynamic> _$DoctorProfileDataToJson(DoctorProfileData instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'room_no': instance.roomNo,
      'visit_end_day': instance.visitEndDay,
      'visit_end_time': instance.visitEndTime,
      'visit_fee': instance.visitFee,
      'visit_start_day': instance.visitStartDay,
      'visit_start_time': instance.visitStartTime,
      'days': instance.days,
      'degrees': instance.degrees,
    };
