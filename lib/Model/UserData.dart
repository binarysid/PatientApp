import 'package:json_annotation/json_annotation.dart';
part 'UserData.g.dart';

@JsonSerializable()
class UserData {
  int code;
  int id;
  String name;
  String phone;
  String message;
  String address;
  double lat;
  double lng;
  String email;
  String photo;

  UserData(this.code, this.id, this.name, this.phone,this.message,this.address,
      this.lat,this.lng,this.email,this.photo);
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}