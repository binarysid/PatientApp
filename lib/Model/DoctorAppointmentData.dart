import 'package:json_annotation/json_annotation.dart';
part 'DoctorAppointmentData.g.dart';

@JsonSerializable()
class DoctorAppointmentData {
  int code;
  int serialNo;
  String message;
  DoctorAppointmentData(this.code, this.serialNo,this.message);
  factory DoctorAppointmentData.fromJson(Map<String, dynamic> json) => _$DoctorAppointmentDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorAppointmentDataToJson(this);

}