import 'package:json_annotation/json_annotation.dart';
import 'package:patientapp/Model/AppointmentListData.dart';
part 'AppointmentData.g.dart';

@JsonSerializable()
class AppointmentData{
    int code;
    String message;
    List<AppointmentListData> data;
    AppointmentData(this.code,this.message,this.data);
    factory AppointmentData.fromJson(Map<String, dynamic> json) => _$AppointmentDataFromJson(json);
    Map<String, dynamic> toJson() => _$AppointmentDataToJson(this);

}