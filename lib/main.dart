import 'package:flutter/material.dart';
import 'package:patientapp/Views/login.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
    '/login':(context)=>LoginView(),
  },
));