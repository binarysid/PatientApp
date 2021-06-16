
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:patientapp/Helper/CommonServices.dart';
import 'package:patientapp/Helper/CommonUtils.dart';
import 'package:patientapp/Helper/AppDrawer.dart';
import 'package:patientapp/Helper/CommonViews.dart';

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchController createState() => _LocationSearchController();
}

class _LocationSearchController extends State<LocationSearch> {
  GoogleMapController mapController;
  List<LocationData> predictions = [];
  final _debouncer = Debouncer(milliseconds: 700);

  @override
  void dispose() {
    _debouncer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: BaseAppBar(title:UIComponent.hospitalTitle,appBar:AppBar()),
    bottomNavigationBar: BottomBar(backgroundColor:AppColor.appBG),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                searchField(),
                SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: predictions.length,
                    itemBuilder: (context, index) {
                      return makeCard(predictions[index]);
                    },
                  ),
                ),
              ],
            ),
          )
      ),
  );
  Card makeCard(LocationData data) => Card(
    elevation: 5.0,
    margin: new EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
    child: Container(
      decoration: UIComponent.list.boxDecoration,
      child: makeListTile(data),
    ),
  );
  ListTile makeListTile(LocationData data) => ListTile(
    leading: CircleAvatar(
      child: Icon(
        Icons.pin_drop,
        color: Colors.white,
      ),
    ),
    title: Text(data.address),
    onTap: () {
      Navigator.pop(context, data);
      // debugPrint(predictions[index].placeId);
    },
  );
  TextFormEditable searchField()=> TextFormEditable(hintText: 'Search Location',
      onTextChange: (value){
        if (value.isNotEmpty) {
          _debouncer.run(() => getLocations(value));
        } else {
          if (predictions.length > 0 && mounted) {
            setState(() {
              predictions = [];
            });
          }
        }
      },borderColor: AppColor.appBG,textColor: AppColor.appBG);
  Future getLocations(String query) async{
    var data = await LocationService.getAutoComplete(query);
    if(data != null && data.status==NetworkCode.success && data.places.length>0){
      setState(() {
        predictions = data.places;
      });
    }
    else{
      print('exception');
    }
  }
}

class _LocationSearchView extends StatelessWidget{
  final _LocationSearchController state;
  LocationSearch get widget => state.widget;
  _LocationSearchView(this.state, {Key key}) : super(key: key);
  Widget build(BuildContext context){
    return Scaffold();
  }

}

