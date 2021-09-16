import 'package:http/http.dart';
import 'dart:convert';
import 'package:patientapp/Model/DoctorData.dart';
import 'package:patientapp/Model/DoctorProfileModel.dart';
import 'package:patientapp/Model/DoctorScheduleData.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Model/DoctorAppointmentData.dart';
import 'package:patientapp/Helper/RestURL.dart';
import 'package:common_utils/Services/AsyncNet.dart';

class DoctorService{

  Future<DoctorData> getDoctorListBy(int hospitalID,{int specializationID, String specialization} ) async{
    try {
      Map<String, String> jsonMap = {'hospital_id':'$hospitalID'};
      if(specializationID != null){
        jsonMap['specialization_id'] = '$specializationID';
      }
      else if(specialization != null){
        jsonMap['specialization'] = '$specialization';
      }
      var response = await AsyncNet.request(requestURL: RestURL.doctorList, method: 'GET',body: jsonMap,header: RestURL.getCommonHeader());
      Map data = jsonDecode(response.body);
      return DoctorData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
  Future<DoctorProfileModel> getDoctorProfileBy(int hospitalID,int doctorID) async{
    try {
      Map<String, String> jsonMap = {'hospital_id':'${hospitalID}', 'doctor_id':'${doctorID}'};
      var response = await AsyncNet.request(requestURL: RestURL.doctorProfile, method: 'POST',body: jsonMap,header: RestURL.getCommonHeader());
      Map data = jsonDecode(response.body);
      return DoctorProfileModel.fromJson(data);
    }
    catch(e){
      return null;
    }
  }
  Future<DoctorScheduleData> getDoctorSchedule(int hospitalID,int doctorID) async{
    try {
      Map<String, String> jsonMap = {'hospital_id':'${hospitalID}', 'doctor_id':'${doctorID}'};
      var response = await AsyncNet.request(requestURL: RestURL.doctorSchedules, method: 'POST',body: jsonMap,header: RestURL.getCommonHeader());
      Map data = jsonDecode(response.body);
      return DoctorScheduleData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
  Future<DoctorAppointmentData> makeAppointment(AppointmentInfo info) async{
    try {
      Map<String, String> jsonMap = {'hospital_id':'${info.hospitalData.id}', 'doctor_id':'${info.doctorData.id}','visit_time':info.doctorProfileData.visitStartTime,'visit_date':info.scheduleData.date,'patient_name':info.userData.name,'patient_phone':info.userData.phone,'patient_id':'${info.userData.id}'};
      var response = await AsyncNet.request(requestURL: RestURL.doctorAppointment, method: 'POST',body: jsonMap,header: RestURL.getCommonHeader());
      Map data = jsonDecode(response.body);
      return DoctorAppointmentData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
}