import 'package:json_annotation/json_annotation.dart';
part 'DoctorAppointmentData.g.dart';

@JsonSerializable()
class DoctorAppointmentData {
  int code;
  @JsonKey(name: 'serial_no')
  int serialNo;
  int userID;

  DoctorAppointmentData(this.code, this.serialNo, this.userID);
  factory DoctorAppointmentData.fromJson(Map<String, dynamic> json) => _$DoctorAppointmentDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorAppointmentDataToJson(this);

}