import 'package:patientapp/Helper/NetworkCode.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache{

  static const _userID = 'user_id';
  static const _userName = 'user_name';
  static const _userPhone = 'user_phone';

  static Future<void> addLoginInfoToCache(int id, String name,String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_userID, id);
    prefs.setString(_userName, name);
    prefs.setString(_userPhone, phone);
  }
  static Future<void> removeLoginInfoFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userID);
    await prefs.remove(_userName);
    await prefs.remove(_userPhone);
  }
  static Future<int> getUserInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userID);
  }
  static Future<int> getUserID() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userID);
  }
  static Future<String> getUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName);
  }
  static Future<String> getUserPhone() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userPhone);
  }
  static Future<bool> isUserLoggedIn() async{
    return await getUserInfo()!=null;
  }
  static Future<UserData>getUserData() async{
    var getID = await getUserID();
    var getName = await getUserName();
    var getphone = await getUserPhone();
    return UserData(NetworkCode.success, getID, getName, getphone);
  }
}