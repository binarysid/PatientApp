import 'package:common_utils/NetworkCode.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:common_utils/NetworkCode.dart';
import 'dart:convert';

class Cache{
  static const _notificationRegToken = 'notification_reg_token';
  static const _user = 'user';

  static Future<void> addLoginInfoToCache(UserData data,
      String notificationRegToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = jsonEncode(data);
    prefs.setString(_user, user);
    prefs.setString(_notificationRegToken, notificationRegToken);
  }
  static Future<void> updateUserInfo(UserData data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = jsonEncode(data);
    prefs.setString(_user, user);
  }
  static Future<void> removeLoginInfoFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_user);
  }
  static Future<String> getNotificationRegToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_notificationRegToken);
  }

  static Future<bool> isUserLoggedIn() async{
    return await getUserData()!=null;
  }
  static Future<UserData>getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString(_user);
    if(user!=null) {
      Map userMap = jsonDecode(user);
      return UserData.fromJson(userMap);
    }
    return null;
  }

}