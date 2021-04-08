import 'package:patientapp/Helper/NetworkCode.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache{

  static const _userID = 'user_id';
  static const _userName = 'user_name';

  static Future<void> addLoginInfoToCache(int id, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_userID, id);
    prefs.setString(_userName, name);
  }
  static Future<void> removeLoginInfoFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userID);
    await prefs.remove(_userName);
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
  static Future<bool> isUserLoggedIn() async{
    return await getUserInfo()!=null;
  }
  static Future<UserData>getUserData() async{
    var getID = await getUserID();
    var getName = await getUserName();
    if (getID == null) return null;
    return UserData(NetworkCode.success, getID, getName, '');
  }
}