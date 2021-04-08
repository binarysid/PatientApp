import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Views/RegisterView.dart';


class LoginViewRouter{
  void navigateToHospitalList(BuildContext context,AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HospitalListView(info:info),
      ),
    );
  }
  void navigateToRegister(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterView(),
      ),
    );
  }
}