import 'package:http/http.dart';
import 'package:patientapp/Helper/Cache.dart';
import 'dart:convert';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Helper/RestURL.dart';
class AuthService{
  String phone;
  String password;
  String url;

  Future<UserData> loginRequest(String phone,String password) async{
    try {
      Map<String, dynamic> jsonMap = {'phone': phone, 'password': password};
      var url = Uri.parse(RestURL.login);
      Response response = await post(url, body: jsonMap);
      Map data = jsonDecode(response.body);
      return UserData.fromJson(data);
    }
    catch(e){
      return null;
    }
  }
  Future<UserData> register(String name,String phone,String password) async{
    try {
      Map<String, dynamic> jsonMap = {'name':name, 'phone': phone, 'password': password};
      var url = Uri.parse(RestURL.register);
      Response response = await post(url, body: jsonMap);
      Map data = jsonDecode(response.body);
      return UserData.fromJson(data);
    }
    catch(e){
      return null;
    }
  }
  static Future<void> logout() async{
    Cache.removeLoginInfoFromCache();
  }
}