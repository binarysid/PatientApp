import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'DoctorProfileView.dart';
import 'package:patientapp/Helper/CommonViews.dart';
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
      //const Icon(Icons.search)
        appBar: BaseAppBar(title:info.specializationData.name,appBar:AppBar(),
        icon: Icon(Icons.search),),
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
    leading: CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.grey,
      backgroundImage: (data.photo != null) ? NetworkImage(data.photo):UIComponent.defaultAvatar,
    ),
    title: Text(
      data.name,
      style: UIComponent.list.titleTextStyle,
    ),
    subtitle: Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(data.phone,
                  style: UIComponent.list.subtitleTextStyle)),
        )
      ],
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: UIComponent.list.trailingIconColor, size: 30.0),
    onTap: () {
      this.info.doctorData = data;
      navigateToDoctorProfile(this.info);
    },
  );

  Card makeCard(DoctorListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: UIComponent.list.boxDecoration,
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
