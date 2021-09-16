import 'package:flutter/material.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Presenter/DoctorListPresenter.dart';
import 'package:patientapp/Services/DoctorService.dart';
import 'DoctorProfileView.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:patientapp/Helper/BottomBar.dart';

import 'DoctorSearch.dart';

class DoctorListBySpecializationView extends StatefulWidget {
  AppointmentInfo info;
  DoctorListBySpecializationView({Key key, this.info}) : super(key: key);
  @override
  _DoctorListBySpecializationViewState createState() => _DoctorListBySpecializationViewState(info: this.info);
}

class _DoctorListBySpecializationViewState extends State<DoctorListBySpecializationView> {
  AppointmentInfo info;
  List<DoctorListData> doctors;
  _DoctorListBySpecializationViewState({Key key, this.info});
  var presenter = DoctorListPresenter();
  Loader loader = Loader(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //const Icon(Icons.search)
        appBar: BaseAppBar(title:info.specializationData.name,appBar:AppBar(),
        icon: Icon(Icons.search),onPressIcon: (){
            if (!this.loader.isVisible())
              showSearch(context: context, delegate: DoctorSearch(onSelectItem: (data){
                this.setData(data);
              },data: this.doctors));
          },),

        body:Container(
          child: FutureBuilder(
            future: this.presenter.getDoctorlList(this.info.hospitalData.id, this.info.specializationData.id, this.info.specializationData.name),
            builder: (context,snapshot){
              if (snapshot.connectionState==ConnectionState.done){
                loader.hideLoader();
                if(snapshot.hasData) {
                  this.doctors = snapshot.data;
                  return _doctorListView(this.doctors);
                }
                else{
                  return Text('');
                }
              } else{
                return loader;
              }
            },
          ),
        ),
    );
  }
  ListView _doctorListView(List<DoctorListData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return this.makeCard(data[index]);
        });
  }
  ListTile makeListTile(DoctorListData data) => ListTile(
    contentPadding:
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.grey,
      backgroundImage: (data.photo != null) ? NetworkImage(data.photo):UIComponent.defaultAvatar,
    ),
    title: Text(
      data.name,
      style: UIComponent.list.titleTextStyle,
    ),
    subtitle: Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(data.phone,
                  style: UIComponent.list.subtitleTextStyle)),
        )
      ],
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: UIComponent.list.trailingIconColor, size: 30.0),
    onTap: () {
      setData(data);
    },
  );
  setData(DoctorListData data){
    this.info.doctorData = data;
    navigateToDoctorProfile(this.info);
  }
  Card makeCard(DoctorListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: UIComponent.list.boxDecoration,
      child: makeListTile(data),
    ),
  );

  void navigateToDoctorProfile(AppointmentInfo info){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorProfileView(info:info),
      ),
    );
  }
}
