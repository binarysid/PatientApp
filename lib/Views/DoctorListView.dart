import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'DoctorProfileView.dart';

class DoctorListView extends StatefulWidget {
  AppointmentInfo info;
  DoctorListView({Key key, this.info}) : super(key: key);
  @override
  _DoctorListViewState createState() => _DoctorListViewState(info: this.info);
}

class _DoctorListViewState extends State<DoctorListView> {
  AppointmentInfo info;
  List<DoctorListData> doctors;
  _DoctorListViewState({Key key, this.info});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        )
    );
  }
  ListView _doctorListView(List<DoctorListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index], Icons.work);
        });
  }
  ListTile _tile(DoctorListData data, IconData icon) => ListTile(
    title: Text(data.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(data.degrees),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
    onTap: (){
      this.info.doctorData = data;
      navigateToDoctorProfile(this.info);
    },
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
    var doctorData =await service.getDoctorListBy(hospitalID, specializationID, specialization);
    if (doctorData.code == 200){
      return doctorData.list;
    }
  }
}
