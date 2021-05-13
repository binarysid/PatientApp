import 'package:flutter/material.dart';
import 'package:patientapp/Helper/Cache.dart';
import 'package:common_utils/NetworkCode.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Router/BaseViewRouter.dart';
import 'package:patientapp/Views/SplashScreen.dart';
import 'LoginView.dart';
import 'package:common_utils/AppColor.dart';

class BaseView extends StatelessWidget {
  var router = BaseViewRouter();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        onSplashScreenEnd: (){
          Cache.getUserData().then((value){
            UIComponent.patientTitle = value.name;
            if(value.id==null){
              router.navigateToLogin(context);
            }
            else{
              router.navigateToHospitalList(context, AppointmentInfo(value));
            }
          });
        },
        splashDelay: 3, splashImage: 'assets/splash.jpg',
        backgroundColor: Colors.white);
  }
}