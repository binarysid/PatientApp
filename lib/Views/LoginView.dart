import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common_utils/NetworkCode.dart';
import 'package:patientapp/Helper/CommonUtils.dart';
import 'package:patientapp/Presenter/LoginPresenter.dart';
import 'package:patientapp/Router/LoginViewRouter.dart';
import 'package:patientapp/Services/AuthService.dart';
import 'package:patientapp/Views/HospitalListView.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:common_utils/AppColor.dart';
import 'package:common_utils/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';
import 'package:patientapp/Helper/AppDrawer.dart';
import 'package:patientapp/Helper/CommonViews.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  var phone = '';
  var pass = '';
  var presenter = LoginPresenter();
  var router = LoginViewRouter();
  Loader loader = Loader(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title:UIComponent.hospitalAppName,appBar:AppBar(),hasBackButton: false,),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: <Widget>[
                  phoneNumberField(),
                  SizedBox(height: 10),
                  passwdField(),
                  loader,
                  SizedBox(height: 10),
                  submitOption(),
                  registerLink()
                  // Add TextFormFields and RaisedButton here.
                ]
            ),
          )
      ),
    );
  }
  Padding registerLink()=> Padding(
    padding: const EdgeInsets.all(25.0),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have account? Register here",
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
  ActionButton submitOption()=>ActionButton(onPressed: (){
    if (_formKey.currentState.validate()) {
      loader.showLoader();
      this.presenter.userLoginRequest(this.phone, this.pass).then((value) =>
      {
        loader.hideLoader(),
        if(value.code==NetworkCode.success && value.id !=null){
          this.router.navigateToHome(context, AppointmentInfo(value))
        }
        else{
          CommonToast.showToastForAsyncRequest(value.message)
        }
      });
    }
  },title: 'Login');
  TextFormEditable phoneNumberField()=> TextFormEditable(hintText: 'phone', validator: (value){
    if (value.isEmpty) {
      return 'Please enter phone number';
    }
    else{
      this.phone = value;
    }
    return null;
  },initialText: '',borderColor: AppColor.appBG,textColor: AppColor.appBG);
  TextFormEditable passwdField()=> TextFormEditable(hintText: 'password', validator: (value){
    if (value.isEmpty) {
      return 'Please enter password';
    }
    else{
      this.pass = value;
    }
    return null;
  },initialText: '',borderColor: AppColor.appBG,textColor: AppColor.appBG);


}
