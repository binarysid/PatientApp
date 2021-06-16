// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DoctorListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorListData _$DoctorListDataFromJson(Map<String, dynamic> json) {
  return DoctorListData(
    json['id'] as int,
    json['name'] as String,
    json['phone'] as String,
    json['degrees'] as String,
    json['address'] as String,
    json['specialization'] as String,
    json['photo'] as String,
    json['profile_completion_percentage'] as int,
  );
}

Map<String, dynamic> _$DoctorListDataToJson(DoctorListData instance) =>
    <String, dynamic>{
      'address': instance.address,
      'degrees': instance.degrees,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'specialization': instance.specialization,
      'photo': instance.photo,
      'profile_completion_percentage': instance.profileCompletionPercentage,
    };
