import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patientapp/Services/LoginService.dart';
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Helper/AppColor.dart';
import 'package:patientapp/Helper/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var phone = '';
  var pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.appBG,
      appBar: BaseAppBar(title:'My Health',backgroundColor:AppColor.appBG,appBar:AppBar()),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    initialValue: '7079684',
                    keyboardType: TextInputType.number,
//                    inputFormatters: <TextInputFormatter>[
//                      WhitelistingTextInputFormatter.digitsOnly
//                    ],
                    decoration: InputDecoration(
                      hintText: 'phone',


                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      else{
                        this.phone = value;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    initialValue: '7079684',
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
                  ),
                  RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        this.userLoginRequest(this.phone, this.pass);
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
//                        _displaySnackBar(context);
                      }
                    },
                    child: Text('Submit'),
                  )
                  // Add TextFormFields and RaisedButton here.
                ]
            ),
          )
      ),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }
  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Processing Data...'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  void userLoginRequest(String phone, String password) async{
    var service = LoginService(phone: phone,password: password, url: '127.0.0.1:5000');
    var userData =await service.loginRequest();
    if (userData != null && userData.id != null) {
      userData.phone = phone;
      try {
        this.navigateToHospitalList(AppointmentInfo(userData));
      }
      catch (e) {
        print(e);
      }
    }
    Widget loadingView() => Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.red,
      ),
    );
  }
  void navigateToHospitalList(AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HospitalListView(info:info),
      ),
    );
  }
}
