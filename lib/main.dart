import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Views/LoginView.dart';
import 'Views/BaseView.dart';
import 'package:patientapp/Helper/Cache.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
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