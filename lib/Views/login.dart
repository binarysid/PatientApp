import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///Volumes/DeepMind/Project/HealthProject/MobileApp/patient_app/lib/Services/LoginService.dart';
import 'file:///Volumes/DeepMind/Project/HealthProject/MobileApp/patient_app/lib/Views/HospitalListView.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Login'),
        ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: '+8801917079684',
                    keyboardType: TextInputType.number,
//                    inputFormatters: <TextInputFormatter>[
//                      WhitelistingTextInputFormatter.digitsOnly
//                    ],
                    decoration: InputDecoration(
                      hintText: 'phone'
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
                    initialValue: '01917079684',
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
                        _displaySnackBar(context);
                      }
                    },
                    child: Text('Submit'),
                  )
                  // Add TextFormFields and RaisedButton here.
                ]
            ),
          )
      ),
    );
  }
  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Processing Data...'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  void userLoginRequest(String phone, String password) async{
    var service = LoginService(phone: phone,password: password, url: '127.0.0.1:5000');
    var userData =await service.loginRequest();
    try {
      this.navigateToHospitalList(userData.id, userData.name);
    }
    catch(e){
      print(e);
    }
    Widget loadingView() => Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.red,
      ),
    );
  }
  void navigateToHospitalList(int id, String name){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HospitalListView(userID: id, name: name),
      ),
    );
  }
}
