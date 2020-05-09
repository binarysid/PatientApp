import 'package:flutter/cupertino.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Model/HospitalListData.dart';
import 'package:patientapp/Model/SpecializationListData.dart';
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Model/DoctorProfileData.dart';
import 'package:patientapp/Model/DoctorScheduleListData.dart';
import 'package:patientapp/Model/DoctorAppointmentData.dart';
class AppointmentInfo{
  UserData userData;
  HospitalListData hospitalData;
  SpecializationListData specializationData;
  DoctorListData doctorData;
  DoctorProfileData doctorProfileData;
  DoctorScheduleListData scheduleData;
  DoctorAppointmentData appointmentData;
  AppointmentInfo([this.userData,this.hospitalData,this.specializationData,this.doctorData,this.doctorProfileData,this.scheduleData, this.appointmentData]);
}
