import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'package:patientapp/Model/DoctorScheduleListData.dart';
import 'DoctorAppointmentView.dart';
import 'package:common_utils/AppColor.dart';
import 'package:common_utils/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class DoctorScheduleListView extends StatefulWidget {
  AppointmentInfo info;
  DoctorScheduleListView({Key key, this.info}) : super(key: key);
  @override
  _DoctorScheduleListViewState createState() => _DoctorScheduleListViewState(info: this.info);
}

class _DoctorScheduleListViewState extends State<DoctorScheduleListView> {
  AppointmentInfo info;
  List<DoctorScheduleListData> doctors;
  _DoctorScheduleListViewState({Key key, this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBG,
        appBar: BaseAppBar(title:'My Health',backgroundColor:AppColor.appBG,appBar:AppBar()),
        body:Container(
          child: FutureBuilder(
            future: this.getDoctorlScheduleBy(this.info.hospitalData.id, this.info.doctorData.id),
            builder: (context,snapshot){
              if (snapshot.hasData){
                this.doctors = snapshot.data;
                return _doctorListView(this.doctors);
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
  ListView _doctorListView(List<DoctorScheduleListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return makeCard(data[index]);
        });
  }

  ListTile makeListTile(DoctorScheduleListData data) => ListTile(
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
      data.day,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(data.date,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
    onTap: () {
      this.info.scheduleData = data;
      navigateToDoctorAppointment(this.info);
    },
  );

  Card makeCard(DoctorScheduleListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: makeListTile(data),
    ),
  );

  void navigateToDoctorAppointment(AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorAppointmentView(info:info),
      ),
    );
  }
  Future<List<DoctorScheduleListData>> getDoctorlScheduleBy(int hospitalID, int doctorID) async{
    var service = DoctorService();
    var scheduleData =await service.getDoctorSchedule(hospitalID, doctorID);
    if (scheduleData.code == 200){
      return scheduleData.data;
    }
  }
}
