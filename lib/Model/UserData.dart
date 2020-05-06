import 'package:json_annotation/json_annotation.dart';
part 'UserData.g.dart';

@JsonSerializable()
class UserData {
  int code;
  int id;
  String name;

  UserData(this.code, this.id, this.name);
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}