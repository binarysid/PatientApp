import 'package:common_utils/NetworkCode.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorScheduleListData.dart';
import 'package:patientapp/Router/DoctorScheduleListRouter.dart';
import 'package:patientapp/Services/DoctorService.dart';

class DoctorScheduleListPresenter{
  BuildContext context;
  AppointmentInfo info;
  var router = DoctorScheduleListRouter();
  var service = DoctorService();
  DoctorScheduleListPresenter({BuildContext context,AppointmentInfo appointmentInfo}){
    this.info = appointmentInfo;
    this.configRouter(context);
  }
  Future<List<DoctorScheduleListData>> getDoctorlScheduleBy() async{
    var scheduleData =await service.getDoctorSchedule(this.info.hospitalData.id, this.info.doctorData.id);
    if (scheduleData.code == 200){
      return scheduleData.data;
    }
    return null;
  }
  void configRouter(BuildContext context){
    this.context = context;
  }
  onSelectItem(DoctorScheduleListData data){
    this.info.scheduleData = data;
    this.router.navigateToDoctorAppointment(context, info);
  }
}