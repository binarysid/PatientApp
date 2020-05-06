import 'package:json_annotation/json_annotation.dart';
import 'SpecializationListData.dart';
part 'SpecializationData.g.dart';

@JsonSerializable()
class SpecializationData {
  int code;
  String message;
  @JsonKey(name: 'data')
  List<SpecializationListData> list;
  SpecializationData(this.code, this.message,this.list);
  factory SpecializationData.fromJson(Map<String, dynamic> json) => _$SpecializationDataFromJson(json);
  Map<String, dynamic> toJson() => _$SpecializationDataToJson(this);
}