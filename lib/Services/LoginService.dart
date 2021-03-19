import 'package:http/http.dart';
import 'dart:convert';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Helper/RestURL.dart';
class LoginService{
  String phone;
  String password;
  String url;
  LoginService({this.phone,this.password, this.url});

  Future<UserData> loginRequest() async{
    try {
      Map<String, dynamic> jsonMap = {'phone': phone, 'password': password};
      var url = Uri.parse(RestURL.login);
      Response response = await post(url, body: jsonMap);
      Map data = jsonDecode(response.body);
      return UserData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
}