import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Helper/AppColor.dart';
import 'package:patientapp/Helper/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';
import 'package:patientapp/Helper/AppDrawer.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Presenter/RegisterPresenter.dart';
import 'package:patientapp/Router/RegisterViewRouter.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var phone = '';
  var pass = '';
  var name = "";
  var presenter = RegisterPresenter();
  var router = RegisterViewRouter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.appBG,
      appBar: BaseAppBar(title:'My Health',backgroundColor:AppColor.appBG,appBar:AppBar()),
      drawer: AppDrawer(context).getDrawer(),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: <Widget>[
                  userName(),
                  userPhone(),
                  password(),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        this.presenter.register(this.name,this.phone, this.pass).then((value) =>
                        {
                          if(value!=null){
                            this.router.navigateToHospitalList(context, AppointmentInfo(value))
                          }
                        });

                      }
                    },
                    child: Text('Submit'),
                  ),
                  // Add TextFormFields and RaisedButton here.
                ]
            ),
          )
      ),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }
}

extension on _RegisterViewState{
  TextFormField userName()=>TextFormField(
    style: TextStyle(
      color: Colors.white,
    ),
    initialValue: '',
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      hintText: 'name',
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter name';
      }
      else{
        this.name = value;
      }
      return null;
    },
  );
  TextFormField userPhone()=>TextFormField(
    style: TextStyle(
      color: Colors.white,
    ),
    initialValue: '',
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'phone'
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter phone number';
      }
      else{
        this.phone = value;
      }
      return null;
    },
  );
  TextFormField password()=>TextFormField(
    style: TextStyle(
      color: Colors.white,
    ),
    initialValue: '',
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'password'
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      else{
        this.pass = value;
      }
      return null;
    },
  );

}