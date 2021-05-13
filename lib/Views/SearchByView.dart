import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Router/SearchByViewRouter.dart';
import 'SpecializationListView.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class SearchPageView extends StatefulWidget {
  AppointmentInfo info;
  SearchPageView({Key key,this.info}) : super(key: key);

  @override
  _SearchPageViewState createState() => _SearchPageViewState(info:this.info);
}

class _SearchPageViewState extends State<SearchPageView> {
  AppointmentInfo info;
  _SearchPageViewState({Key key, @required this.info});
  var router =SearchByViewRouter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title:info.hospitalData.name,appBar:AppBar()),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _searchBySpecialization(),
              SizedBox(height: 15),
              _searchByDoctor()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }
  MenuButton _searchBySpecialization()=>MenuButton(onPressed: (){
    this.router.navigateToSpecialization(context,this.info);
  }, title: "Search by Specialization", icon: Icon(Icons.search),width:250);
  MenuButton _searchByDoctor()=>MenuButton(onPressed: (){
    this.router.navigateToAllDoctorList(context, info);
  }, title: "Search by Doctor name", icon: Icon(Icons.search),width:250);

}
