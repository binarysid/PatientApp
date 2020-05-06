import 'package:http/http.dart';
import 'dart:convert';
import 'package:patientapp/Model/UserData.dart';

class LoginService{
  String phone;
  String password;
  String url;
  LoginService({this.phone,this.password, this.url});

  Future<UserData> loginRequest() async{
    try {

      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> jsonMap = {"phone": phone, "password": password};
      String body = json.encode(jsonMap);
      Response response = await post("http://10.0.2.2:5000/login", headers: headers, body: body);
      Map data = jsonDecode(response.body);
      return UserData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
}