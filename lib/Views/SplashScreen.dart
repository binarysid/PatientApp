import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor;
  final Function onSplashScreenEnd;
  final int splashDelay;
  final String splashImage;
  String splashText='';
  SplashScreen({Key key, @required this.onSplashScreenEnd, @required this.splashDelay,@required this.splashImage,@required this.backgroundColor,this.splashText}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState(onSplashScreenEnd:this.onSplashScreenEnd, splashDelay:this.splashDelay,splashImage:this.splashImage,backgroundColor:this.backgroundColor,splashText:this.splashText);
}

class _SplashScreenState extends State<SplashScreen> {

  String _versionName = 'V1.0';
  final Color backgroundColor;
  final Function onSplashScreenEnd;
  final int splashDelay;
  final String splashImage;
  String splashText='';
  _SplashScreenState({Key key, this.onSplashScreenEnd, this.splashDelay,this.splashImage,this.backgroundColor,this.splashText});

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, onSplashScreenEnd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            this.splashImage,
                            height: 300,
                            width: 300,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}