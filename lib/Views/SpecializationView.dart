import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patientapp/Model/HospitalListData.dart';
import 'package:patientapp/Services/HospitalService.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/SpecializationData.dart';
import 'package:patientapp/Model/SpecializationListData.dart';

class SpecializationView extends StatefulWidget {
  AppointmentInfo info;
  SpecializationView({Key key, this.info}) : super(key: key);

  @override
  _SpecializationViewState createState() => _SpecializationViewState(info:this.info);
}

class _SpecializationViewState extends State<SpecializationView> {
  AppointmentInfo info;
  List<SpecializationListData> specializations;
  _SpecializationViewState({Key key, this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          child: FutureBuilder(
            future: this.getSpecializationList(this.info.hospitalID),
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
        )
    );
  }
  ListView _specListView(List<SpecializationListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index], Icons.work);
        });
  }
  ListTile _tile(SpecializationListData data, IconData icon) => ListTile(
    title: Text(data.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
    onTap: (){
      this.info.hospitalID = data.id;
    },
  );

  Future<List<SpecializationListData>> getSpecializationList(hospitalID) async{
    var service = HospitalService();
    var specData =await service.getSpecializationListBy(hospitalID);
    if (specData.code == 200){
      return specData.list;
    }
  }
}
