import 'package:json_annotation/json_annotation.dart';
part 'AppointmentNotificationData.g.dart';

@JsonSerializable()
class AppointmentNotificationData{
  String id;
  String message;
  AppointmentNotificationData(this.id, this.message);

  factory AppointmentNotificationData.fromJson(Map<String, dynamic> json) =>
      _$AppointmentNotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentNotificationDataToJson(this);

}