import 'package:json_annotation/json_annotation.dart';
part 'DoctorScheduleListData.g.dart';

@JsonSerializable()
class DoctorScheduleListData {
  String date;
  int id;
  int isAvailable;

  DoctorScheduleListData(this.date, this.id,this.isAvailable);
  factory DoctorScheduleListData.fromJson(Map<String, dynamic> json) => _$DoctorScheduleListDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorScheduleListDataToJson(this);
}