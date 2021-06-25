import 'package:common_utils/NetworkCode.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorAppointmentData.dart';
import 'package:patientapp/Router/DoctorAppointmentRouter.dart';
import 'package:patientapp/Services/DoctorService.dart';


class DoctorAppointmentInterface{
  void showMessage(String message){}
  void showLoader(){}
  void hideLoader(){}
}
class DoctorAppointmentPresenter{
  DoctorAppointmentInterface delegate;
  BuildContext context;
  AppointmentInfo info;
  var router = DoctorAppointmentRouter();
  var service = DoctorService();
  DoctorAppointmentPresenter({DoctorAppointmentInterface delegate,BuildContext context,AppointmentInfo appointmentInfo}){
    this.delegate = delegate;
    this.info = appointmentInfo;
    this.configRouter(context);
  }
  Future makeAppointment() async{
    this.delegate.showLoader();
    var appointmentData =await service.makeAppointment(this.info);
    this.delegate.hideLoader();
    if(appointmentData.code == NetworkCode.success) {
      this.setData(appointmentData);
      this.navigateToConfirmView();
    }
    else{
      this.delegate.showMessage(appointmentData.message);
    }
  }
  void setData(DoctorAppointmentData appointmentData){
    this.info.appointmentData = appointmentData;
  }
  void configRouter(BuildContext context){
    this.context = context;
  }
  void navigateToConfirmView(){
    this.router.navigateToConfirmationView(context, info);
  }
}
