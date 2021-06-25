import 'package:flutter/material.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:common_utils/NetworkCode.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Presenter/DoctorAppointmentPresenter.dart';
import 'package:patientapp/Model/DoctorAppointmentData.dart';
import 'package:patientapp/Helper/BottomBar.dart';

class DoctorAppointment extends StatefulWidget {
  AppointmentInfo info;
  DoctorAppointment({Key key, this.info}) : super(key: key);
  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState(info: this.info);
}

class _DoctorAppointmentState extends State<DoctorAppointment> implements DoctorAppointmentInterface {
  AppointmentInfo info;
  _DoctorAppointmentState({Key key, this.info});
  Loader loader = Loader(false);
  DoctorAppointmentPresenter presenter;
  @override
  void initState() {
    // TODO: implement initState
    presenter = DoctorAppointmentPresenter(delegate: this,context: context,appointmentInfo: this.info);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title:'Appointment Info',appBar:AppBar()),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Doctor: ${this.info.doctorData.name}',style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text('${this.info.doctorData.degrees}'),
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('${this.info.hospitalData.name}',style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text('phone: ${this.info.hospitalData.phone}'),
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Room No: ${this.info.doctorProfileData.roomNo}',style: TextStyle(color: Colors.black),
                  ),
                ),
                if(this.loader.isVisible()) loader,
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Fee: ${this.info.doctorProfileData.visitFee} bdt',style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Date: ${this.info.scheduleData.date}',style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(color: Colors.black,height: 30,),
                ActionButton(onPressed: () async {
                  await this.presenter.makeAppointment();
                }, title:  "Confirm appointment"
                ),
            ],
          ),
          ]
        ),
      ),//_doctorProfileView(this.info),
    );
  }

  @override
  void showMessage(String message) {
    CommonToast.showToastForAsyncRequest(message,duration: ToastLength.LONG);
  }

  @override
  void showLoader() {
    loader.showLoader();
    setState(() {});
  }

  @override
  void hideLoader() {
    loader.hideLoader();
    setState(() {});
  }
}
