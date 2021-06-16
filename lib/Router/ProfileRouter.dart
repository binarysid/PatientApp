import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/views/LocationSearch.dart';
import 'package:common_utils/Services/LocationData.dart';

class ProfileRouter{
  Future<LocationData> fetchLocation(BuildContext context) async {
    final location = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationSearch(),
        )
    );
    return location;
  }
}