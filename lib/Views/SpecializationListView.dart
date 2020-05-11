import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patientapp/Model/HospitalListData.dart';
import 'package:patientapp/Services/HospitalService.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/SpecializationData.dart';
import 'package:patientapp/Model/SpecializationListData.dart';
import 'DoctorListView.dart';
import 'package:patientapp/Helper/AppColor.dart';
import 'package:patientapp/Helper/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class SpecializationListView extends StatefulWidget {
  AppointmentInfo info;
  SpecializationListView({Key key, this.info}) : super(key: key);

  @override
  _SpecializationListViewState createState() => _SpecializationListViewState(info:this.info);
}

class _SpecializationListViewState extends State<SpecializationListView> {
  AppointmentInfo info;
  List<SpecializationListData> specializations;
  _SpecializationListViewState({Key key, this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBG,
        body:Container(
          child: FutureBuilder(
            future: this.getSpecializationList(this.info.hospitalData.id),
            builder: (context,snapshot){
              if (snapshot.hasData){
                this.specializations = snapshot.data;
                return _specListView(this.specializations);
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
  ListView _specListView(List<SpecializationListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return this.makeCard(data[index]);
        });
  }
  ListTile makeListTile(SpecializationListData data) => ListTile(
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
    trailing:
    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
    onTap: () {
      this.info.specializationData = data;
      this.navigateToDoctorList(this.info);
    },
  );

  Card makeCard(SpecializationListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: makeListTile(data),
    ),
  );
  void navigateToDoctorList(AppointmentInfo info) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DoctorListView(info: info),
      ),
    );
  }
  Future<List<SpecializationListData>> getSpecializationList(hospitalID) async{
    var service = HospitalService();
    var specData =await service.getSpecializationListBy(hospitalID);
    if (specData.code == 200){
      return specData.list;
    }
  }
}
