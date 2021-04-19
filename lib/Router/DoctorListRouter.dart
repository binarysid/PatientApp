import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Views/DoctorProfileView.dart';

class DoctorListRouter{
  void navigateToDoctorProfile(BuildContext context,AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorProfileView(info:info),
      ),
    );
  }
}