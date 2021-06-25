import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Views/DoctorAppointmentConfirmationView.dart';

class DoctorAppointmentRouter{
  void navigateToConfirmationView(BuildContext context,  AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorAppointmentConfirmationView(info:info),
      ),
    );
  }
}