import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patientapp/Model/HospitalListData.dart';
import 'package:patientapp/Services/HospitalService.dart';
import 'package:patientapp/Views/SearchByView.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';

class HospitalListView extends StatefulWidget {
  AppointmentInfo info;
  // In the constructor, require a Todo.
  HospitalListView({Key key, this.info}) : super(key: key);

  @override
  _HospitalListViewState createState() => _HospitalListViewState(info: this.info);
}

class _HospitalListViewState extends State<HospitalListView> {
  AppointmentInfo info;
  List<HospitalListData> hospitals;
  _HospitalListViewState({Key key, this.info});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: FutureBuilder(
          future: this.getHospitalList(),
          builder: (context,snapshot){
            if (snapshot.hasData){
              this.hospitals = snapshot.data;
              return _hospitalListView(this.hospitals);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      )
    );
  }
  ListView _hospitalListView(List<HospitalListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index], Icons.work);
        });
  }
  ListTile _tile(HospitalListData data, IconData icon) => ListTile(
    title: Text(data.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(data.phone),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
    onTap: (){
        this.info.hospitalID = data.id;
        this.navigateToSearch(this.info);
    },
  );
  void navigateToSearch(AppointmentInfo info) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SearchPageView(info: info),
      ),
    );
  }
  Future<List<HospitalListData>> getHospitalList() async{
    var service = HospitalService();
    var hospitalData =await service.getHospitalList();
    if (hospitalData.code == 200){
      return hospitalData.list;
    }
  }
}



