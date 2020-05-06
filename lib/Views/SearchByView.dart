import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'SpecializationView.dart';

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
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
            FlatButton(
              color: Colors.blue,
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
            )
          ],
        ),
      ),
    );
  }
  void navigateToSpecialization(AppointmentInfo info) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SpecializationView(info: info),
      ),
    );
  }
}
