import 'package:flutter/material.dart';
import 'package:patientapp/Views/LoginView.dart';
import 'DummyView/NinjaCard.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
    '/login':(context)=>LoginView(),
  },
));