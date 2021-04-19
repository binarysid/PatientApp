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

  @override
  Widget build(BuildContext context) {
    var card = Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Doctor: ${this.info.doctorData.name}',style: TextStyle(color: Colors.black),
            ),
            subtitle: Text('${this.info.doctorData.degrees}'),
          ),
          Divider(color: Colors.black),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Chamber: ${this.info.hospitalData.name}',style: TextStyle(color: Colors.black),
            ),
            subtitle: Text('${this.info.hospitalData.phone}'),
          ),
          Divider(color: Colors.black),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Room No: ${this.info.doctorProfileData.roomNo}',style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(color: Colors.black),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Fee: ${this.info.doctorProfileData.visitFee}',style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(color: Colors.black),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Date: ${this.info.scheduleData.date}',style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(color: Colors.black,height: 30,),
          FlatButton(
            color: AppColor.appBG,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () async{
              var appointMentData = await this.makeAppointment(this.info);
              if(appointMentData.code == NetworkCode.success) {
                this.info.appointmentData = appointMentData;
                this.navigateToAppointmentConfirm(this.info);
              }
              else{
                CommonToast.showToastForAsyncRequest(appointMentData.message,duration: ToastLength.LONG);
              }
            },
            child: Text(
              "Confirm appointment",
              style: TextStyle(fontSize: 20.0),
            ),
          )
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
      appBar: BaseAppBar(title:'Appointment Info',backgroundColor:AppColor.appBG,appBar:AppBar()),
      body: sizedBox,//_doctorProfileView(this.info),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
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
