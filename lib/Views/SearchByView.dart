import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'SpecializationListView.dart';
import 'package:patientapp/Helper/AppColor.dart';
import 'package:patientapp/Helper/BaseAppBar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBG,
      appBar: BaseAppBar(title:'Doctor',backgroundColor:AppColor.appBG,appBar:AppBar()),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ButtonTheme(
                minWidth: double.infinity,
                height: 50.0,
                child: FlatButton(
                  shape: this.getButtonShape(),
                  color: AppColor.appBG,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    this.navigateToSpecialization(this.info);
                  },
                  child: Text(
                    "Search By Specialization",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ButtonTheme(
                minWidth: double.infinity,
                height: 50.0,
                child: FlatButton(
                  shape: this.getButtonShape(),
                  color: AppColor.appBG,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Search By Doctor name",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }
  RoundedRectangleBorder getButtonShape(){
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.white)
    );
  }
  void navigateToSpecialization(AppointmentInfo info) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SpecializationListView(info: info),
      ),
    );
  }
}
