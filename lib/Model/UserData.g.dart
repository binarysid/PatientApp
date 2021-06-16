// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    json['code'] as int,
    json['id'] as int,
    json['name'] as String,
    json['phone'] as String,
    json['message'] as String,
    json['address'] as String,
    json['lat'] as String,
    json['lng'] as String,
    json['email'] as String,
    json['photo'] as String,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'message': instance.message,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'email': instance.email,
      'photo': instance.photo,
    };
