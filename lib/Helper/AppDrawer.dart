
import 'package:flutter/material.dart';
import 'package:patientapp/Services/AuthService.dart';
import 'package:patientapp/Views/LoginView.dart';
import 'package:patientapp/Views/Profile.dart';

class AppDrawer{
  BuildContext context;
  AppDrawer(BuildContext context){ this.context=context; }
  Drawer getDrawer() => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        header(),
        profile(),
        logout()
      ],
    ),
  );
  ListTile profile() =>ListTile(
    title: Text('Profile'),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(),
        ),
      );
    },
  );
  ListTile logout() =>ListTile(
    title: Text('Logout'),
    onTap: () {
      this.onLogout();
    },
  );
  DrawerHeader header() =>DrawerHeader(
    child: Text('Menu'),
    decoration: BoxDecoration(
      color: Colors.blue,
    ),
  );
}
extension on AppDrawer{
  void onLogout(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Text('Are you sure you want to logout?'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('yes'),
              onPressed: () {
                AuthService.logout();
                Navigator.of(context, rootNavigator: true).pop('dialog');
                this.navigateToLogin();
                // this.router.navigateToDoctorList(context, this.hospitalID);
              },
            ),
            TextButton(
              child: Text('no'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            )
          ],
        ));
  }
}
extension on AppDrawer{
  navigateToLogin(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }
}