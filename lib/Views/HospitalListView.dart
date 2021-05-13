import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patientapp/Helper/AppDrawer.dart';
import 'package:patientapp/Model/HospitalListData.dart';
import 'package:patientapp/Services/HospitalService.dart';
import 'package:patientapp/Views/SearchByView.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Helper/BottomBar.dart';
import 'package:patientapp/Helper/CommonViews.dart';

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
  Loader loader = Loader(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title:UIComponent.patientTitle,appBar:AppBar()),
        drawer: AppDrawer(context).getDrawer(),
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
              return loader;
            },
          ),
        ),
        bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }
  ListView _hospitalListView(List<HospitalListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return this.makeCard(data[index]);
        });
  }

  ListTile makeListTile(HospitalListData data) => ListTile(
    contentPadding:
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.grey,
      backgroundImage: data.icon != null ? NetworkImage(data.icon):UIComponent.defaultAvatar,
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
      this.info.hospitalData = data;
      this.navigateToSearch(this.info);
    },
  );

  Card makeCard(HospitalListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: UIComponent.list.boxDecoration,
      child: makeListTile(data),
    ),
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



