import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Presenter/DoctorScheduleListPresenter.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'package:patientapp/Model/DoctorScheduleListData.dart';
import 'DoctorAppointment.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class DoctorScheduleList extends StatefulWidget {
  AppointmentInfo info;
  DoctorScheduleList({Key key, this.info}) : super(key: key);
  @override
  _DoctorScheduleListState createState() => _DoctorScheduleListState(info: this.info);
}

class _DoctorScheduleListState extends State<DoctorScheduleList>{
  AppointmentInfo info;
  List<DoctorScheduleListData> doctors;
  _DoctorScheduleListState({Key key, this.info});
  Loader loader = Loader(true);
  DoctorScheduleListPresenter presenter;
  @override
  void initState() {
    // TODO: implement initState
    presenter = DoctorScheduleListPresenter(context: context,appointmentInfo: this.info);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title:info.doctorData.name,appBar:AppBar()),
        body:Container(
          child: FutureBuilder(
            future: this.presenter.getDoctorlScheduleBy(),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.done){
                loader.hideLoader();
                if(snapshot.data != null) {
                  this.doctors = snapshot.data;
                  return _scheduleListView(this.doctors);
                }
                else{
                  return emptyListView();
                }
              } else{
                return loader;
              }

            },
          ),
        ),
    );
  }
  Widget emptyListView()=>Center(child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text('No schedule found',style: TextStyle(fontWeight: FontWeight.bold),),
  ));
  ListView _scheduleListView(List<DoctorScheduleListData> data) {
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
      this.presenter.onSelectItem(data);
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

}
