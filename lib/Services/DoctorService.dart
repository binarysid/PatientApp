import 'package:http/http.dart';
import 'dart:convert';
import 'package:patientapp/Model/DoctorData.dart';
import 'package:patientapp/Model/DoctorProfileModel.dart';
import 'package:patientapp/Model/DoctorScheduleData.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Model/DoctorAppointmentData.dart';
import 'package:patientapp/Helper/AppColor.dart';
import 'package:patientapp/Helper/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class DoctorService{

  Future<DoctorData> getDoctorListBy(int hospitalID,int specializationID, String specialization) async{
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> jsonMap = {'hospital_id':hospitalID, 'specialization_id':specializationID,'specialization':specialization};
      String body = json.encode(jsonMap);
      Response response = await post("http://10.0.2.2:5000/doctorlist", headers: headers, body:body);
      Map data = jsonDecode(response.body);
      return DoctorData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
  Future<DoctorProfileModel> getDoctorProfileBy(int hospitalID,int doctorID) async{
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> jsonMap = {'hospital_id':hospitalID, 'doctor_id':doctorID};
      String body = json.encode(jsonMap);
      Response response = await post("http://10.0.2.2:5000/doctorProfileBy", headers: headers, body:body);
      Map data = jsonDecode(response.body);
      return DoctorProfileModel.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
  Future<DoctorScheduleData> getDoctorSchedule(int hospitalID,int doctorID) async{
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> jsonMap = {'hospital_id':hospitalID, 'doctor_id':doctorID};
      String body = json.encode(jsonMap);
      Response response = await post("http://10.0.2.2:5000/doctorschedules", headers: headers, body:body);
      Map data = jsonDecode(response.body);
      return DoctorScheduleData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
  Future<DoctorAppointmentData> makeAppointment(AppointmentInfo info) async{
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> jsonMap = {'hospital_id':info.hospitalData.id, 'doctor_id':info.doctorData.id,'visit_time':info.doctorProfileData.visitStartTime,'visit_date':info.scheduleData.date,'patient_name':info.userData.name,'patient_phone':info.userData.phone,'patient_id':info.userData.id};
      String body = json.encode(jsonMap);
      Response response = await post("http://10.0.2.2:5000/doctorappointment", headers: headers, body:body);
      Map data = jsonDecode(response.body);
      return DoctorAppointmentData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
}