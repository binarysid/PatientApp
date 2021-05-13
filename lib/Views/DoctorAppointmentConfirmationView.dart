import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:common_utils/AppColor.dart';
import 'package:common_utils/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class DoctorAppointmentConfirmationView extends StatefulWidget {
  AppointmentInfo info;
  DoctorAppointmentConfirmationView({ Key key, this.info}) : super(key: key);
  @override
  _DoctorAppointmentConfirmationViewState createState() => _DoctorAppointmentConfirmationViewState(info: this.info);
}

class _DoctorAppointmentConfirmationViewState extends State<DoctorAppointmentConfirmationView> {
  AppointmentInfo info;
  _DoctorAppointmentConfirmationViewState({Key key, this.info});

  @override
  Widget build(BuildContext context) {
    var card = Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Serial No. ${this.info.appointmentData.serialNo}',style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(color: Colors.black),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Date: ${this.info.scheduleData.date}',style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
    final sizedBox = Container(
      margin: EdgeInsets.all(20),
      child: SizedBox(
        child: card,
      ),
    );
    return Scaffold(
        backgroundColor: AppColor.appBG,
        appBar: BaseAppBar(title:'Appointment Info',appBar:AppBar()),
        body: sizedBox,//_doctorProfileView(this.info),
        bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }

}
