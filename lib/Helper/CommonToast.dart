
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonToast{
  static showToastForAsyncRequest(String mssg,{Color backgroundColor=Colors.red, Color textColor = Colors.white, double textSize = 16.0, Toast duration=Toast.LENGTH_SHORT}){
    Fluttertoast.showToast(
        msg: mssg,
        toastLength: duration,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: textSize
    );
  }
}