import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Views/LoginView.dart';
import 'Model/AppointmentNotificationData.dart';
import 'Services/PushNotification.dart';
import 'Views/BaseView.dart';
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Helper/CommonViews.dart';

import 'Views/Home.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var notification = PushNotification();
  await notification.init();
  notification.foregroundNotification();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
         theme: ThemeData(primarySwatch: AppColor.appBg,
           visualDensity: VisualDensity.adaptivePlatformDensity,
         ),
          home: BaseView(),
          routes: {
            '/login': (context) => LoginView(),
            '/hospitallist': (context) => HospitalListView(),
          }
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  var notification = PushNotification();
  await notification.init();
  // print('message id........ ${message.data}');
  notification.showNotification(AppointmentNotificationData.fromJson(message.data));
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // this.showNotification(AppointmentNotificationData.fromJson(message.data));
}