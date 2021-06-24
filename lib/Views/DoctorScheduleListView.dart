import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'package:patientapp/Model/DoctorScheduleListData.dart';
import 'DoctorAppointmentView.dart';
import 'package:patientapp/Helper/CommonViews.dart';
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
  Loader loader = Loader(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title:info.doctorData.name,appBar:AppBar()),
        body:Container(
          child: FutureBuilder(
            future: this.getDoctorlScheduleBy(this.info.hospitalData.id, this.info.doctorData.id),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.done){
                loader.hideLoader();
                this.doctors = snapshot.data;
                return _doctorListView(this.doctors);
              } else{
                return loader;
              }

            },
          ),
        ),
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
              right: new BorderSide(width: 1.0, color: AppColor.appBG))),
      child: Icon(Icons.calendar_today_sharp, color: UIComponent.list.leadingIconColor),
    ),
    title: Text(
      data.day,
      style: UIComponent.list.titleTextStyle
    ),
    subtitle: Text(data.date,
      style: UIComponent.list.subtitleTextStyle,
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: UIComponent.list.trailingIconColor, size: 30.0),
    onTap: () {
      this.info.scheduleData = data;
      navigateToDoctorAppointment(this.info);
    },
  );

  Card makeCard(DoctorScheduleListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: UIComponent.list.boxDecoration,
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
