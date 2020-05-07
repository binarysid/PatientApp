import 'package:http/http.dart';
import 'package:patientapp/Model/DoctorData.dart';
import 'dart:convert';
//import 'package:patientapp/Model/DoctorListData.dart';

class DoctorService{

  Future<DoctorData> getDoctorListBy(int hospitalID,int specializationID, String specialization) async{
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> jsonMap = {'hospital_id':hospitalID, 'specialization_id':specializationID,'specialization':specialization};
      String body = json.encode(jsonMap);
      Response response = await post("http://10.0.2.2:5000/doctorlist", headers: headers, body:body);
      Map data = jsonDecode(response.body);
      return DoctorData.fromJson(data);
    }
    catch(e){
      print(e);
    }
  }
}