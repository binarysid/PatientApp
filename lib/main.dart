import 'package:flutter/material.dart';
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Views/LoginView.dart';
import 'Views/BaseView.dart';
import 'package:patientapp/Helper/Cache.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        home: BaseView(),
        routes: {
          '/login': (context) => LoginView(),
          '/hospitallist': (context) => HospitalListView(),
        }
    );
  }
}