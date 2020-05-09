import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'package:patientapp/Model/DoctorScheduleListData.dart';
import 'DoctorAppointmentView.dart';

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
        body:Container(
          child: FutureBuilder(
            future: this.getDoctorlScheduleBy(this.info.doctorData.id, this.info.hospitalData.id),
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
        )
    );
  }
  ListView _doctorListView(List<DoctorScheduleListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index], Icons.work);
        });
  }
  ListTile _tile(DoctorScheduleListData data, IconData icon) => ListTile(
    title: Text(data.date,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
    onTap: (){
      this.info.scheduleData = data;
      navigateToDoctorAppointment(this.info);
    },
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
