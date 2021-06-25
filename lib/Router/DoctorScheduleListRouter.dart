import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Views/DoctorAppointment.dart';

class DoctorScheduleListRouter{
  void navigateToDoctorAppointment(BuildContext context, AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorAppointment(info:info),
      ),
    );
  }
}