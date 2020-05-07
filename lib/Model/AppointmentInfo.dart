import 'package:flutter/cupertino.dart';

class AppointmentInfo{
  int userID;
  String userName;
  int hospitalID;
  int doctorID;
  int specializationID;
  String specialization;
  AppointmentInfo(this.userID,this.userName,this.hospitalID,this.doctorID,this.specializationID,this.specialization);
}