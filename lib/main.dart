import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Views/LoginView.dart';
import 'Services/PushNotification.dart';
import 'Views/BaseView.dart';
import 'package:patientapp/Helper/Cache.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotification().initMessaging();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
          home: BaseView(),
          routes: {
            '/login': (context) => LoginView(),
            '/hospitallist': (context) => HospitalListView(),
          }
    );
  }
}

