import 'package:json_annotation/json_annotation.dart';
part 'AppointmentListData.g.dart';

@JsonSerializable()
class AppointmentListData{
  int id;
  int serial;
  int status;
  String hospital;
  String doctor;
  @JsonKey(name: 'start_time')
  String startTime;
  @JsonKey(name: 'end_time')
  String endTime;
  @JsonKey(name: 'doctor_contact')
  String doctorContact;
  @JsonKey(name: 'hospital_contact')
  String hospitalContact;
  String date;
  String specialization;
  AppointmentListData(this.id, this.serial,this.status, this.hospital,
      this.doctor,this.startTime,this.endTime,this.doctorContact,
      this.hospitalContact,this.date,this.specialization
      );
  factory AppointmentListData.fromJson(Map<String, dynamic> json) => _$AppointmentListDataFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentListDataToJson(this);
}