import 'package:flutter/material.dart';
class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}


class _NinjaCardState extends State<NinjaCard> {
  int i = 9;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Center(child: Text('ninja header start')),
        backgroundColor: Colors.grey[600],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            i += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/linkon.jpg'),
              ),
            ),
            Divider(
              height: 100,
              color: Colors.white,
            ),
            Text(
              'name',
               style: TextStyle(
                 color: Colors.white,
                 letterSpacing: 2.0,
                 fontSize: 16,
               ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Ninjas',
              style: TextStyle(
                color: Colors.yellowAccent,
                letterSpacing: 2.0,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 30.0,),
            Text(
              'Current Ninja level',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              '$i',
              style: TextStyle(
                color: Colors.yellow,
                letterSpacing: 2.0,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}