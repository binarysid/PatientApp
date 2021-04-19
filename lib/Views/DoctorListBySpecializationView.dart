import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'DoctorProfileView.dart';
import 'package:common_utils/AppColor.dart';
import 'package:common_utils/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class DoctorListBySpecializationView extends StatefulWidget {
  AppointmentInfo info;
  DoctorListBySpecializationView({Key key, this.info}) : super(key: key);
  @override
  _DoctorListBySpecializationViewState createState() => _DoctorListBySpecializationViewState(info: this.info);
}

class _DoctorListBySpecializationViewState extends State<DoctorListBySpecializationView> {
  AppointmentInfo info;
  List<DoctorListData> doctors;
  _DoctorListBySpecializationViewState({Key key, this.info});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBG,
        appBar: BaseAppBar(title:'My Health',backgroundColor:AppColor.appBG,appBar:AppBar()),
        body:Container(
          child: FutureBuilder(
            future: this.getDoctorlListBy(this.info.hospitalData.id, this.info.specializationData.id, this.info.specializationData.name),
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
  ListView _doctorListView(List<DoctorListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return this.makeCard(data[index]);
        });
  }
  ListTile makeListTile(DoctorListData data) => ListTile(
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

  void navigateToDoctorProfile(AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorProfileView(info:info),
      ),
    );
  }
  Future<List<DoctorListData>> getDoctorlListBy(int hospitalID, int specializationID, String specialization) async{
    var service = DoctorService();
    var doctorData =await service.getDoctorListBy(hospitalID, specializationID: specializationID, specialization: specialization);
    if (doctorData.code == 200){
      return doctorData.list;
    }
  }
}
