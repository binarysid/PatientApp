import 'package:json_annotation/json_annotation.dart';
import 'DoctorScheduleListData.dart';
part 'DoctorScheduleData.g.dart';

@JsonSerializable()
class DoctorScheduleData {
  int code;
  String message;
  @JsonKey(name: 'dates')
  List<DoctorScheduleListData> data;
  DoctorScheduleData(this.code, this.message,this.data);

  factory DoctorScheduleData.fromJson(Map<String, dynamic> json) => _$DoctorScheduleDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorScheduleDataToJson(this);
}