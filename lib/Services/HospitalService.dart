import 'package:http/http.dart';
import 'package:patientapp/Model/AppointmentData.dart';
import 'package:patientapp/Model/HospitalData.dart';
import 'dart:convert';
import 'package:patientapp/Model/HospitalListData.dart';
import 'package:patientapp/Model/SpecializationData.dart';
import 'package:patientapp/Helper/RestURL.dart';

class HospitalService{

  Future<AppointmentData> getAppointments(Map<String, dynamic> jsonMap) async{
    try {
      var url = Uri.parse(RestURL.appointmentList);
      Response response = await post(url, body:jsonMap);
      Map data = jsonDecode(response.body);
      return AppointmentData.fromJson(data);
    }
    catch(e){
      return null;
    }
  }
  Future<HospitalData> getHospitalList() async{
    try {
      var url = Uri.parse(RestURL.hospitalList);
      Response response = await post(url, headers: RestURL.commonHeader);
      Map data = jsonDecode(response.body);
      return HospitalData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
  Future<SpecializationData> getSpecializationListBy(int hospitalID) async{
    try {
      Map<String, dynamic> jsonMap = {'hospital_id':'${hospitalID}'};
//      String body = json.encode(jsonMap);
      var url = Uri.parse(RestURL.specializationList);
      Response response = await post(url,body:jsonMap);
      Map data = jsonDecode(response.body);
      return SpecializationData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
}