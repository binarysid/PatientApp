
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Helper/CommonViews.dart';
import 'package:patientapp/Helper/CommonUtils.dart';
import 'package:patientapp/Helper/BottomBar.dart';
import 'package:patientapp/Model/AppointmentInfo.dart';
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Presenter/DoctorListPresenter.dart';
import 'package:patientapp/Router/DoctorListRouter.dart';
import 'DoctorSearch.dart';


class DoctorList extends StatefulWidget {
  AppointmentInfo info;
  DoctorList({Key key, this.info}) : super(key: key);

  @override
  _DoctorListController createState() => _DoctorListController(info: this.info);
}

class _DoctorListController extends State<DoctorList> {
  AppointmentInfo info;
  _DoctorListController({Key key, this.info});
  var presenter = DoctorListPresenter();
  var router = DoctorListRouter();
  Loader loader = Loader(true);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: BaseAppBar(title:info.hospitalData.name,icon: Icon(Icons.search),
          appBar:AppBar(),
          onPressIcon: (){
            if (!this.loader.isVisible())
            showSearch(context: context, delegate: DoctorSearch(onSelectItem: (data){
              this.setData(data);
            },data: this.presenter.getFilteredDoctorList()));
          },
        ),
        body:
          Container(
            child:
            FutureBuilder(
              future: this.presenter.getDoctorlListBy(info.hospitalData.id),
              builder: (context,snapshot){
                if (snapshot.connectionState==ConnectionState.done){
                  loader.hideLoader();
                  return _DoctorListView(this);
                }
                else{
                  return loader;
                }
              },
            )
          )
      );

  setData(DoctorListData data){
    this.info.doctorData = data;
    this.router.navigateToDoctorProfile(context, info);
  }

}


class _DoctorListView extends StatelessWidget{
  final _DoctorListController state;
  DoctorList get widget => state.widget;
  _DoctorListView(this.state, {Key key}) : super(key: key);
  Widget build(BuildContext context){
    final doctors = this.state.presenter.getFilteredDoctorList();
    if(doctors != null && doctors.isNotEmpty){
      return _doctorListView(doctors);
    }
    else{
      return emptyListView();
    }
  }
  Widget emptyListView()=>Center(child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text('No doctor found',style: TextStyle(fontWeight: FontWeight.bold),),
  ));
  ListView _doctorListView(List<DoctorListData> data) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
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
      backgroundImage: (data.photo != null) ? NetworkImage(data.photo):AssetImage('images/avatar.jpg'),
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
      this.state.setData(data);
      // navigateToDoctorProfile(this.info);
    },
  );
  Card makeCard(DoctorListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: UIComponent.list.boxDecoration,
      child: makeListTile(data),
    ),
  );

}