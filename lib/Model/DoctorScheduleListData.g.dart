// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DoctorScheduleListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorScheduleListData _$DoctorScheduleListDataFromJson(
    Map<String, dynamic> json) {
  return DoctorScheduleListData(
    json['date'] as String,
    json['id'] as int,
    json['isAvailable'] as int,
  );
}

Map<String, dynamic> _$DoctorScheduleListDataToJson(
        DoctorScheduleListData instance) =>
    <String, dynamic>{
      'date': instance.date,
      'id': instance.id,
      'isAvailable': instance.isAvailable,
    };
