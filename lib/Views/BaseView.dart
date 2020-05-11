import 'package:flutter/material.dart';
import 'LoginView.dart';
import 'package:patientapp/Helper/AppColor.dart';

class BaseView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Health',
      theme: new ThemeData(primaryColor: AppColor.appBG),
      home: LoginView(),
    );
  }
}