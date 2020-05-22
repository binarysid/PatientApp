import 'package:json_annotation/json_annotation.dart';
part 'DoctorScheduleListData.g.dart';

@JsonSerializable()
class DoctorScheduleListData {
  String date;
  String day;


  DoctorScheduleListData(this.date, this.day);
  factory DoctorScheduleListData.fromJson(Map<String, dynamic> json) => _$DoctorScheduleListDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorScheduleListDataToJson(this);
}