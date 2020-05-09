import 'package:json_annotation/json_annotation.dart';
part 'DoctorListData.g.dart';

@JsonSerializable()
class DoctorListData {
  String address;
  String degrees;
  int id;
  String name;
  String phone;
  String specialization;

  DoctorListData(this.id, this.name,this.phone, this.degrees,this.address,this.specialization);
  factory DoctorListData.fromJson(Map<String, dynamic> json) => _$DoctorListDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorListDataToJson(this);
}