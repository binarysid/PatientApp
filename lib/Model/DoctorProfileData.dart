import 'package:json_annotation/json_annotation.dart';
part 'DoctorProfileData.g.dart';

@JsonSerializable()
class DoctorProfileData {
  String phone;
  @JsonKey(name: 'room_no')
  String roomNo;
  @JsonKey(name: 'visit_end_day')
  String visitEndDay;
  @JsonKey(name: 'visit_end_time')
  String visitEndTime;
  @JsonKey(name: 'visit_fee')
  String visitFee;
  @JsonKey(name: 'visit_start_day')
  String visitStartDay;
  @JsonKey(name: 'visit_start_time')
  String visitStartTime;

  DoctorProfileData(this.phone, this.roomNo,this.visitEndDay,this.visitEndTime,this.visitFee,this.visitStartDay,this.visitStartTime);
  factory DoctorProfileData.fromJson(Map<String, dynamic> json) => _$DoctorProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorProfileDataToJson(this);
}