
import 'package:patientapp/Helper/AppDrawer.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Router/HomeRouter.dart';

class Home extends StatefulWidget {
  AppointmentInfo info;
  Home({Key key,this.info}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(info: this.info);
}

class _HomeState extends State<Home> {
  AppointmentInfo info;
  HomeRouter router = HomeRouter();
  _HomeState({Key key, this.info});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title:UIComponent.patientTitle,appBar:AppBar()),
      drawer: AppDrawer(context).getDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _makeAppointment(),
              SizedBox(height: 15),
              _searchByDoctor()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }
  MenuButton _makeAppointment()=>MenuButton(onPressed: (){
    this.router.navigateToHospitalList(context,this.info);
  }, title: "Get an Appointment", icon: Icon(Icons.widgets),width:250);
  MenuButton _searchByDoctor()=>MenuButton(onPressed: (){
    // this.router.navigateToAllDoctorList(context, info);
  }, title: "Profile", icon: Icon(Icons.account_box),width:250);

}
