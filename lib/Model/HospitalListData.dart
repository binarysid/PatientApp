import 'package:json_annotation/json_annotation.dart';
part 'HospitalListData.g.dart';

@JsonSerializable()
class HospitalListData {
  String email;
  int id;
  String name;
  String phone;

  HospitalListData(this.id, this.name,this.phone,this.email);

  factory HospitalListData.fromJson(Map<String, dynamic> json) =>
      _$HospitalListDataFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalListDataToJson(this);
}