import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_utils/AppColor.dart';
import 'package:common_utils/BaseAppBar.dart';
import 'package:patientapp/Helper/BottomBar.dart';
import 'package:patientapp/Helper/AppDrawer.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Presenter/RegisterPresenter.dart';
import 'package:patientapp/Router/RegisterViewRouter.dart';
import 'package:patientapp/Helper/CommonViews.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  var phone = '';
  var pass = '';
  var name = "";
  var presenter = RegisterPresenter();
  var router = RegisterViewRouter();
  Loader loader = Loader(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title:UIComponent.hospitalAppName,appBar:AppBar()),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                children: <Widget>[
                  userName(),
                  SizedBox(height: 10),
                  userPhone(),
                  SizedBox(height: 10),
                  password(),
                  loader,
                  SizedBox(height: 10),
                  submitOption(),
                  // Add TextFormFields and RaisedButton here.
                ]
            ),
          )
      ),
    );
  }
}

extension on _RegisterViewState{
  ActionButton submitOption()=>ActionButton(onPressed: (){
    if (_formKey.currentState.validate()) {
      loader.showLoader();
      this.presenter.register(this.name,this.phone, this.pass).then((value) =>
      {
        loader.hideLoader(),
        if(value!=null && value.id !=null){
          this.router.navigateToHome(context, AppointmentInfo(value))
        }
        else{
          CommonToast.showToastForAsyncRequest(value.message)
        }
      });

    }
  },title: 'Register');
  TextFormEditable userName()=> TextFormEditable(hintText: 'name', validator: (value){
    if (value.isEmpty) {
      return 'Please enter name';
    }
    else{
      this.name = value;
    }
    return null;
  },initialText: '',borderColor: AppColor.appBG,textColor: AppColor.appBG);
  TextFormEditable userPhone()=> TextFormEditable(hintText: 'phone', validator: (value){
    if (value.isEmpty) {
      return 'Please enter phone number';
    }
    else{
      this.phone = value;
    }
    return null;
  },initialText: '',borderColor: AppColor.appBG,textColor: AppColor.appBG);
  TextFormEditable password()=> TextFormEditable(hintText: 'password', validator: (value){
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    else{
      this.pass = value;
    }
    return null;
  },initialText: '',borderColor: AppColor.appBG,textColor: AppColor.appBG);

}