
import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Views/AppointmentListView.dart';
import 'package:patientapp/Views/HospitalListView.dart';

class HomeRouter{
  navigateToHospitalList(BuildContext context,AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HospitalListView(info: info),
      ),
    );
  }
  navigateToAppointmentList(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentListView(),
      ),
    );
  }
}