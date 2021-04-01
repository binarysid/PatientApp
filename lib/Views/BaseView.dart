import 'package:flutter/material.dart';
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Helper/NetworkCode.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Router/BaseViewRouter.dart';
import 'LoginView.dart';
import 'package:patientapp/Helper/AppColor.dart';

class BaseView extends StatelessWidget {
  var router = BaseViewRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Cache.getUserData().then((value){
      if(value==null){
        router.navigateToLogin(context);
      }
      else{
        router.navigateToHospitalList(context, AppointmentInfo(value));
      }
    });
    return new MaterialApp(
      title: 'My Health',
      theme: new ThemeData(primaryColor: AppColor.appBG),
    );
  }
}