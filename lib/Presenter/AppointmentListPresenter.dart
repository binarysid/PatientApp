
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Helper/CommonUtils.dart';
import 'package:patientapp/Model/AppointmentListData.dart';
import 'package:patientapp/Services/HospitalService.dart';

class AppointmentListPresenter{
  List<AppointmentListData> data;
  var service = HospitalService();
  Future<List<AppointmentListData>> getAppointments() async{
      var user = await Cache.getUserData();
      Map<String, dynamic> jsonMap = {'id':'${user.id}'};
      var data = await service.getAppointments(jsonMap);
      if(data != null && data.code == NetworkCode.success){
        return data.data;
      }
      return null;
  }
}