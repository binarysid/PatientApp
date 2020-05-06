import 'package:http/http.dart';
import 'package:patientapp/Model/HospitalData.dart';
import 'dart:convert';
import 'package:patientapp/Model/HospitalListData.dart';
import 'package:patientapp/Model/SpecializationData.dart';
class HospitalService{

  Future<HospitalData> getHospitalList() async{
    try {

      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> jsonMap = {};
      String body = json.encode(jsonMap);
      Response response = await post("http://10.0.2.2:5000/hospitals", headers: headers);
      Map data = jsonDecode(response.body);
      return HospitalData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
  Future<SpecializationData> getSpecializationListBy(int hospitalID) async{
    try {

      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> jsonMap = {'hospital_id':hospitalID};
      String body = json.encode(jsonMap);
      Response response = await post("http://10.0.2.2:5000/specializationlist", headers: headers, body:body);
      Map data = jsonDecode(response.body);
      return SpecializationData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
}