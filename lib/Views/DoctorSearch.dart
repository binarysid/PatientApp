import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Helper/CommonUtils.dart';

class DoctorSearch extends SearchDelegate {
  final List<DoctorListData> data;
  List<DoctorListData> searchResult = [];
  final Function (DoctorListData) onSelectItem;
  DoctorSearch({this.onSelectItem,this.data});

  @override
  List<Widget> buildActions(BuildContext context) {
// this will show clear query button
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
// adding a back button to close the search
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult =
        data.where((element) => element.name.startsWith(query)).toList();

    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(searchResult.length, (index) {
            var item = searchResult[index];
            return Card(
              color: Colors.white,
              child: Container(padding: EdgeInsets.all(16), child: Text(item.name)),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    searchResult =
        data.where((element) => element.name.containsSubstring(query))
            .toList();

    // searchResult = data;
    return Container(
        margin: EdgeInsets.all(20),
        child: _doctorListView(searchResult)
    );
  }
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
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.medical_services_outlined, color: Colors.white),
      ),
      title: Text(
        data.name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(data.phone,
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: (){
        onSelectItem(data);
      }
  );
  Card makeCard(DoctorListData data) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: makeListTile(data),
    ),
  );

}