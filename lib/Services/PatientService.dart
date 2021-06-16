import 'package:http/http.dart';
import 'dart:convert';
import 'package:patientapp/Helper/RestURL.dart';
import 'package:patientapp/Model/CommonResponseData.dart';
import 'package:patientapp/Model/UserData.dart';

class PatientService{
  Future<UserData> updateInfo(Map jsonMap) async{
    try {
      var url = Uri.parse(RestURL.updateProfile);
      Response response = await post(url,body:jsonMap);
      Map data = jsonDecode(response.body);
      return UserData.fromJson(data);
    }
    catch(e){
      return null;
    }
  }
}