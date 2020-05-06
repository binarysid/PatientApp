import 'package:json_annotation/json_annotation.dart';
part 'SpecializationListData.g.dart';

@JsonSerializable()
class SpecializationListData {
  int id;
  @JsonKey(name: 'specialization')
  String name;

  SpecializationListData(this.id, this.name);
  factory SpecializationListData.fromJson(Map<String, dynamic> json) => _$SpecializationListDataFromJson(json);
  Map<String, dynamic> toJson() => _$SpecializationListDataToJson(this);
}