import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patientapp/Model/HospitalListData.dart';
import 'package:patientapp/Services/HospitalService.dart';
import 'package:patientapp/Views/SearchByView.dart';

class HospitalListView extends StatefulWidget {
  int userID;
  String name;

  // In the constructor, require a Todo.
  HospitalListView({Key key, @required this.userID, @required this.name}) : super(key: key);

  @override
  _HospitalListViewState createState() => _HospitalListViewState(userID: this.userID, userName: this.name);
}

class _HospitalListViewState extends State<HospitalListView> {
  int userID;
  String userName;
  List<HospitalListData> hospitals;
  _HospitalListViewState({Key key, @required this.userID, @required this.userName});
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
              return _jobsListView(this.hospitals);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      )
    );
  }
  ListView _jobsListView(List<HospitalListData> data) {
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
        this.navigateToSearch(this.userID, this.userName, data.id);
    },
  );
  void navigateToSearch(int userID, String userName, int hospitalID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SearchPageView(
                userID: userID, userName: userName, hospitalID: hospitalID),
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



