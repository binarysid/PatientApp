import 'package:json_annotation/json_annotation.dart';
import 'HospitalListData.dart';
part 'HospitalData.g.dart';

@JsonSerializable()
class HospitalData {
  int code;
  String message;
  @JsonKey(name: 'data')
  List<HospitalListData> list;
  HospitalData(this.code, this.message,this.list);
  factory HospitalData.fromJson(Map<String, dynamic> json) => _$HospitalDataFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalDataToJson(this);
}