import 'package:json_annotation/json_annotation.dart';
import 'DoctorListData.dart';
part 'DoctorData.g.dart';

@JsonSerializable()
class DoctorData {
  int code;
  String message;
  @JsonKey(name: 'data')
  List<DoctorListData> list;
  DoctorData(this.code, this.message,this.list);
  factory DoctorData.fromJson(Map<String, dynamic> json) => _$DoctorDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);
}