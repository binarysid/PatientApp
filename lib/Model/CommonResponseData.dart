import 'package:json_annotation/json_annotation.dart';
part 'CommonResponseData.g.dart';

@JsonSerializable()
class CommonResponseData {
  int code;
  int id;
  String message;

  CommonResponseData(this.code, this.id,this.message);
  factory CommonResponseData.fromJson(Map<String, dynamic> json) => _$CommonResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$CommonResponseDataToJson(this);

}