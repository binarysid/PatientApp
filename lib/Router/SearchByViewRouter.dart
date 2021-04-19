import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Views/DoctorList.dart';
import 'package:patientapp/Views/SpecializationListView.dart';

class SearchByViewRouter{
  void navigateToSpecialization(BuildContext context, AppointmentInfo info) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SpecializationListView(info: info),
      ),
    );
  }
  navigateToAllDoctorList(BuildContext context, AppointmentInfo info) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DoctorList(info: info),
      ),
    );
  }
}
