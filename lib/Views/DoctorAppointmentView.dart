import 'package:flutter/material.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:common_utils/NetworkCode.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'package:patientapp/Model/DoctorAppointmentData.dart';
import 'DoctorAppointmentConfirmationView.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class DoctorAppointmentView extends StatefulWidget {
  AppointmentInfo info;
  DoctorAppointmentView({Key key, this.info}) : super(key: key);
  @override
  _DoctorAppointmentViewState createState() => _DoctorAppointmentViewState(info: this.info);
}

class _DoctorAppointmentViewState extends State<DoctorAppointmentView> {
  AppointmentInfo info;
  _DoctorAppointmentViewState({Key key, this.info});
  Loader loader = Loader(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title:'Appointment Info',appBar:AppBar()),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Doctor: ${this.info.doctorData.name}',style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text('${this.info.doctorData.degrees}'),
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('${this.info.hospitalData.name}',style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text('phone: ${this.info.hospitalData.phone}'),
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Room No: ${this.info.doctorProfileData.roomNo}',style: TextStyle(color: Colors.black),
                  ),
                ),
                if(this.loader.isVisible()) loader,
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Fee: ${this.info.doctorProfileData.visitFee} bdt',style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Date: ${this.info.scheduleData.date}',style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(color: Colors.black,height: 30,),
                ActionButton(onPressed: () async {
                  loader.showLoader();
                  setState(() {

                  });
                  var appointMentData = await this.makeAppointment(this.info);
                  loader.hideLoader();
                  setState(() {

                  });
                  if(appointMentData.code == NetworkCode.success) {
                    this.info.appointmentData = appointMentData;
                    this.navigateToAppointmentConfirm(this.info);
                  }
                  else{
                    CommonToast.showToastForAsyncRequest(appointMentData.message,duration: ToastLength.LONG);
                  }
                },
                    title:  "Confirm appointment"
                ),
            ],
          ),
          ]
        ),
      ),//_doctorProfileView(this.info),
    );
  }
  void navigateToAppointmentConfirm(AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorAppointmentConfirmationView(info:info),
      ),
    );
  }
  Future<DoctorAppointmentData> makeAppointment(AppointmentInfo info) async{
    var service = DoctorService();
    var appointmentData =await service.makeAppointment(info);
    return appointmentData;
  }
}
