import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:patientapp/Model/AppointmentNotificationData.dart';

class PushNotification{
  FirebaseMessaging messaging;
  FlutterLocalNotificationsPlugin localNotification;

  static Future<String> getRegToken() async{
    var token = await FirebaseMessaging.instance.getToken();
    return token;
  }
  Future<void> notificationUnSubscribeTo(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
  }
  Future<void> notificationSubscribeTo(String topic) async {
    await messaging.subscribeToTopic(topic);
  }
  void showNotification(AppointmentNotificationData data) async{
    var androidDetails = AndroidNotificationDetails('channelId', 'channelName', 'channelDescription');
    var iOSDetails = IOSNotificationDetails();
    var generalNotificationDetails = NotificationDetails(android: androidDetails,iOS: iOSDetails);
    await localNotification.show(0, 'appointment ${data.id}', data.message, generalNotificationDetails);
  }
  Future initMessaging() async{
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    this.notificationPermission();
    var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInit = IOSInitializationSettings();
    var initSettings = InitializationSettings(android: androidInit,iOS: iosInit);
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification.initialize(initSettings);
    foregroundNotification();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  void foregroundNotification(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      this.showNotification(AppointmentNotificationData.fromJson(message.data));
    });
  }
  void notificationPermission() async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // print('message id........ ${message.data}');
  notificationPermission();
  showNotification(AppointmentNotificationData.fromJson(message.data));
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // this.showNotification(AppointmentNotificationData.fromJson(message.data));
}
void showNotification(AppointmentNotificationData data) async{
  var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  var iosInit = IOSInitializationSettings();
  var initSettings = InitializationSettings(android: androidInit,iOS: iosInit);
  var localNotification = FlutterLocalNotificationsPlugin();
  localNotification.initialize(initSettings);
  var androidDetails = AndroidNotificationDetails('channelId', 'channelName', 'channelDescription');
  var iOSDetails = IOSNotificationDetails();
  var generalNotificationDetails = NotificationDetails(android: androidDetails,iOS: iOSDetails);
  await localNotification.show(0, 'appointment ${data.id}', data.message, generalNotificationDetails);
}
void notificationPermission() async{
  var messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
