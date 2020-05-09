import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorProfileData.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'package:flutter/material.dart';
import 'DoctorScheduleListView.dart';

class DoctorProfileView extends StatefulWidget {
  AppointmentInfo info;
  DoctorProfileView({Key key, this.info}) : super(key: key);
  @override
  _DoctorProfileViewState createState() => _DoctorProfileViewState(info: this.info);
}

class _DoctorProfileViewState extends State<DoctorProfileView> {
  AppointmentInfo info;
  DoctorProfileData profile;
  _DoctorProfileViewState({Key key, this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('ninja header start')),
        backgroundColor: Colors.grey[600],
        elevation: 0.0,
      ),
      body: Container(
        child: FutureBuilder(
          future: this.getDoctorProfileBy(this.info.hospitalData.id, this.info.doctorData.id),
          builder: (context,snapshot){
            if (snapshot.hasData){
              this.profile = snapshot.data;
              return _doctorProfileView(this.profile);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      )
    );
  }
  Column _doctorProfileView(DoctorProfileData data) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/linkon.jpg'),
            ),
          ),
          Divider(
            height: 100,
            color: Colors.white,
          ),
          Text(
            this.info.doctorData.name + "\n" + this.info.doctorData.degrees,
            style: TextStyle(
              color: Colors.lightGreen,
              letterSpacing: 2.0,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10.0,),
          Text(
            'Visit Fee: '+ data.visitFee,
            style: TextStyle(
              color: Colors.yellowAccent,
              letterSpacing: 2.0,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10.0,),
          Text(
            'Visit Time: '+data.visitStartTime+'-'+data.visitEndTime,
            style: TextStyle(
              color: Colors.yellow,
              letterSpacing: 2.0,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 10.0,),
          Text(
            'Room No. '+ data.roomNo,
            style: TextStyle(
              color: Colors.yellow,
              letterSpacing: 2.0,
              fontSize: 30,
            ),
          ),
          FlatButton(color: Colors.red,
            onPressed: () {
              this.info.doctorProfileData = data;
              this.navigateToDoctorSchedule(this.info);
            },
            child: Text(
              "Make Appointment",
              style: TextStyle(fontSize: 20.0),
            ),
          ),

        ],
      );

  }
  void navigateToDoctorSchedule(AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorScheduleListView(info:info),
      ),
    );
  }
  Future<DoctorProfileData> getDoctorProfileBy(int hospitalID, int doctorID) async{
    var service = DoctorService();
    var profile =await service.getDoctorProfileBy(hospitalID, doctorID);
    if (profile.code == 200){
      return profile.data;
    }
  }
}
