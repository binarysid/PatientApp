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
  ListTile makeListTile(String title, String name) => ListTile(
    contentPadding:
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),
    title: Text(
      data.name,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(data.phone,
                  style: TextStyle(color: Colors.white))),
        )
      ],
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
    onTap: () {
      this.info.doctorData = data;
      navigateToDoctorProfile(this.info);
    },
  );

  Card makeCard(DoctorListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: makeListTile(data),
    ),
  );

}
