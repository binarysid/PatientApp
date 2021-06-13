import 'package:json_annotation/json_annotation.dart';
part 'UserData.g.dart';

@JsonSerializable()
class UserData {
  int code;
  int id;
  String name;
  String phone;
  String message;

  UserData(this.code, this.id, this.name, this.phone,this.message);
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}