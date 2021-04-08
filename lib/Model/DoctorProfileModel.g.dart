// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DoctorProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorProfileModel _$DoctorProfileModelFromJson(Map<String, dynamic> json) {
  return DoctorProfileModel(
    json['code'] as int,
    json['message'] as String,
    json['data'] == null
        ? null
        : DoctorProfileData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DoctorProfileModelToJson(DoctorProfileModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
