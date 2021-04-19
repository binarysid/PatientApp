import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common_utils/NetworkCode.dart';
import 'package:patientapp/Presenter/LoginPresenter.dart';
import 'package:patientapp/Router/LoginViewRouter.dart';
import 'package:patientapp/Services/AuthService.dart';
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:common_utils/AppColor.dart';
import 'package:common_utils/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';
import 'package:patientapp/Helper/AppDrawer.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var phone = '';
  var pass = '';
  var presenter = LoginPresenter();
  var router = LoginViewRouter();
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
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        this.presenter.userLoginRequest(this.phone, this.pass).then((value) =>
                        {
                          if(value!=null){
                            this.router.navigateToHospitalList(context, AppointmentInfo(value))
                          }
                        });
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
//                        _displaySnackBar(context);
                      }
                    },
                    child: Text('Submit'),
                  ),
                  registerLink()
                  // Add TextFormFields and RaisedButton here.
                ]
            ),
          )
      ),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }
  Padding registerLink()=> Padding(
    padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: new TextStyle(color: Colors.white),
            ),
            TextSpan(
              text: 'Register here',
              style: new TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                    router.navigateToRegister(context);
                },
            ),
          ],
        ),
      ),
  );

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Processing Data...'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}
