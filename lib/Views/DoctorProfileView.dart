import 'dart:ffi';

import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorProfileData.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'package:flutter/material.dart';
import 'DoctorScheduleListView.dart';
import 'package:patientapp/Helper/AppColor.dart';
import 'package:patientapp/Helper/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';

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
  final textFontSize = 17.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBG,
      appBar: BaseAppBar(title:'Doctor',backgroundColor:AppColor.appBG,appBar:AppBar()),
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
      ),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),

    );
  }
  TextStyle getTextStyle(){
    return TextStyle(
      color: Colors.white,
      letterSpacing: 2.0,
      fontSize: this.textFontSize,
    );
  }
  Padding _doctorProfileView(DoctorProfileData data) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child:ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('assets/linkon.jpg')
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  this.info.doctorData.name + "\n" + this.info.doctorData.degrees,
                  style: this.getTextStyle(),
                ),
                SizedBox(height: 16),
                Center(
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    height: 50.0,
                    child: FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          this.info.doctorProfileData = data;
                          this.navigateToDoctorSchedule(this.info);
                        },
                        child: Text(
                          "Book Now",
                          style: TextStyle(fontSize: 20.0),
                        )
                    ),
                  ),
                ),
                Divider(
                  height: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Specialization: '+ this.info.specializationData.name,
                  style: this.getTextStyle(),
                ),
                SizedBox(height: 16.0,),
                Text(
                  'Chamber: '+ this.info.hospitalData.name,
                  style: this.getTextStyle(),
                ),
                SizedBox(height: 16.0,),
                Text(
                  'Visit Fee: '+ data.visitFee,
                  style: this.getTextStyle(),
                ),
                SizedBox(height: 16.0,),
                Text(
                  'Visit Time: '+data.visitStartTime+'-'+data.visitEndTime,
                  style: this.getTextStyle(),
                ),
                SizedBox(height: 16.0,),
                Text(
                  'Room No. '+ data.roomNo,
                  style: this.getTextStyle(),
                ),
              ],
            ),
          ]),
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
