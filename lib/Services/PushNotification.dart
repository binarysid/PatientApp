import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:patientapp/Model/AppointmentNotificationData.dart';

class PushNotification{
  FirebaseMessaging messaging;
  FlutterLocalNotificationsPlugin localNotification = FlutterLocalNotificationsPlugin();

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
  initMessaging(){
    messaging = FirebaseMessaging.instance;
  }
  Future init() async{
    await Firebase.initializeApp();
    initMessaging();
    this.notificationPermission();
    this.initSettings();
  }
  initSettings(){
    var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInit = IOSInitializationSettings();
    var initSettings = InitializationSettings(android: androidInit,iOS: iosInit);
    localNotification.initialize(initSettings);
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
