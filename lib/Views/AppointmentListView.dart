import 'package:common_utils/BaseAppBar.dart';
import 'package:common_utils/UIComponent.dart';
import 'package:common_utils/Utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:patientapp/Model/AppointmentListData.dart';
import 'package:patientapp/Presenter/AppointmentListPresenter.dart';

class AppointmentListView extends StatefulWidget {
  AppointmentListView({Key key }) : super(key: key);
  @override
  _AppointmentListViewState createState() => _AppointmentListViewState();
}

class _AppointmentListViewState extends State<AppointmentListView> {
  var presenter = AppointmentListPresenter();
  _AppointmentListViewState({Key key});
  var loader = Loader(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title:UIComponent.patientTitle,appBar:AppBar()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          initialData: null,
          future: this.presenter.getAppointments(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done && snapshot.data != null){
              loader.hideLoader();
              return _listView(snapshot.data);
            }
            return loader;
          },
        )
      ),
      bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
    );
  }
}

extension on _AppointmentListViewState{
  ListView _listView(List<AppointmentListData> appointments) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return makeCard(appointments[index]);
        });
  }

  Card makeCard(AppointmentListData data) => Card(
    elevation: 8.0,
    child: Container(
      decoration: UIComponent.list.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Text(
              'doctor: ${data.doctor}',
              style: UIComponent.list.titleTextStyle,
            ),
            trailing: this.callBtn(data.doctorContact),
          ),
          SizedBox(height: 0.5,width: double.infinity,
              child: const DecoratedBox(
            decoration: const BoxDecoration(
                color: AppColor.appBG
            ),
          )),
          SizedBox(height: 10,),
          ListTile(
            leading: Text(
              'serial ${data.serial}',
              style: UIComponent.list.titleTextStyle,
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    )
  );
  IconButton callBtn(String number)=>IconButton(onPressed: (){
    Utility.makeCall(number);
  }, icon: Icon(Icons.call, color: UIComponent.list.trailingIconColor, size: 25.0),);
}