import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';

class DoctorAppointmentConfirmationView extends StatefulWidget {
  AppointmentInfo info;
  DoctorAppointmentConfirmationView({Key key, this.info}) : super(key: key);
  @override
  _DoctorAppointmentConfirmationViewState createState() => _DoctorAppointmentConfirmationViewState(info: this.info);
}

class _DoctorAppointmentConfirmationViewState extends State<DoctorAppointmentConfirmationView> {
  AppointmentInfo info;
  _DoctorAppointmentConfirmationViewState({Key key, this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _doctorProfileView(this.info),
    );
  }
  Column _doctorProfileView(AppointmentInfo info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          this.info.doctorData.name + "\n" + this.info.doctorData.degrees,
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          'Serial No.: '+ '${this.info.appointmentData.serialNo}',
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          'Visit Fee: '+ this.info.doctorProfileData.visitFee,
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          'Visit Time: '+this.info.doctorProfileData.visitStartTime+'-'+this.info.doctorProfileData.visitEndTime,
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          'Room No. '+ this.info.doctorProfileData.roomNo,
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 30,
          ),
        ),

      ],
    );

  }
}
