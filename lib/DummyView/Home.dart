import 'dart:async';

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  final StreamController<int> _streamController = StreamController<int>();
  Map data = {};
  String location = 'default';

  @override
  void dispose() {
    // TODO: implement dispose
    this._streamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(onPressed: () async{
              dynamic result = await Navigator.pushNamed(context, '/location');
              setState(() {
                this.data = {
                  'location':result['location'],
                  'time':result['time']
                };
                location = result['location'];
              });
            },
                icon: Icon(Icons.edit_location),
                label: Text('edit location')),
            Text(this.location),
            StreamBuilder<int>(
              stream: this._streamController.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snap){
                return Text('${snap.data}');
              },
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          this._streamController.add(++this._counter);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
