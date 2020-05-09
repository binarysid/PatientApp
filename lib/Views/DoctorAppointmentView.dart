import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'package:patientapp/Model/DoctorAppointmentData.dart';
import 'DoctorAppointmentConfirmationView.dart';

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

    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Doctor: '+this.info.doctorData.name+'\n'+this.info.specializationData.name),
            Text('Hospital: '+this.info.hospitalData.name),
            Text('Date: '+this.info.scheduleData.date),
            Text('Time: '+this.info.doctorProfileData.visitStartTime),
            Text('Fee: '+this.info.doctorProfileData.visitFee),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () async{
                var appointMentData = await this.makeAppointment(this.info);
                this.info.appointmentData = appointMentData;
                this.navigateToAppointmentConfirm(this.info);
              },
              child: Text(
                "Confirm appointment",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
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
    if (appointmentData.code == 200){
      return appointmentData;
    }
  }
}
