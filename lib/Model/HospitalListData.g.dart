// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HospitalListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalListData _$HospitalListDataFromJson(Map<String, dynamic> json) {
  return HospitalListData(
    json['id'] as int,
    json['name'] as String,
    json['phone'] as String,
    json['email'] as String,
    json['address'] as String,
    (json['lat'] as num)?.toDouble(),
    (json['lng'] as num)?.toDouble(),
    json['icon'] as String,
  );
}

Map<String, dynamic> _$HospitalListDataToJson(HospitalListData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'icon': instance.icon,
    };
