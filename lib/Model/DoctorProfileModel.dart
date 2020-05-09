import 'package:json_annotation/json_annotation.dart';
import 'DoctorProfileData.dart';
part 'DoctorProfileModel.g.dart';

@JsonSerializable()
class DoctorProfileModel {
  int code;
  String message;
  DoctorProfileData data;

  DoctorProfileModel(this.code, this.message,this.data);
  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) => _$DoctorProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorProfileModelToJson(this);
}