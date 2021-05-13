import 'package:json_annotation/json_annotation.dart';
part 'HospitalListData.g.dart';

@JsonSerializable()
class HospitalListData {
  String email;
  int id;
  String name;
  String phone;
  String address;
  double lat;
  double lng;
  String icon;
  HospitalListData(this.id, this.name,this.phone,this.email,this.address,
  this.lat,this.lng,this.icon);

  factory HospitalListData.fromJson(Map<String, dynamic> json) =>
      _$HospitalListDataFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalListDataToJson(this);
}