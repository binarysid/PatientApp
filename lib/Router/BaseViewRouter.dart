import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Views/Home.dart';
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Views/LoginView.dart';

class BaseViewRouter{
  navigateToLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, '/login');
  }
  navigateToHospitalList(BuildContext context,AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HospitalListView(info: info),
      ),
    );
  }
  navigateToHome(BuildContext context,AppointmentInfo info){
    // Navigator.pushNamed(
    //   context,
    //   '/home',
    //   arguments: info,
    // );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(info: info),
      ),
    );
  }
}