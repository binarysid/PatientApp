import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Helper/CommonServices.dart';
import 'package:patientapp/Helper/CommonUtils.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Services/PatientService.dart';

class ProfilePresenter{
  final _profilePicController = StreamController<dynamic>();
  Stream<dynamic> get getProfilePic=>_profilePicController.stream;
  var service = PatientService();

  Future<String> updateInfo(String name, int id, String email,
      LocationData location, File logo, UserData data,bool logoUpdated) async{
    Map<String, dynamic> jsonMap = {'id':'${id}'};
    if(name.isNotEmpty && name!=data.name){
      jsonMap['name'] = '$name';
    }
    if(email.isNotEmpty && email!=data.email){
      jsonMap['email'] = '$email';
    }
    if(location!=null && double.parse(location.latitude)!=data.lat){
      jsonMap['lat'] = '${location.latitude}';
      jsonMap['lng'] = '${location.longitude}';
      jsonMap['address'] = '${location.address}';
    }
    if(logoUpdated && logo!=null){
      List<int> imageBytes = await logo.readAsBytesSync();
      String  base64Image = base64Encode(imageBytes);
      jsonMap['photo']='$base64Image';
    }
    var userData = await service.updateInfo(jsonMap);
    if(userData != null) {
      if (userData.code == NetworkCode.success) {
        Cache.updateUserInfo(userData);
      }
      return userData.message;
    }
    else{
      return 'something went wrong.try again';
    }
  }
  getProfileImage(String icon){
    PaintingBinding.instance.imageCache.clear();
    _profilePicController.sink.add(Image.network(
      icon,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ));

  }
  setProfileImage(File image){
    var imageFile = Image.file(
      image,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
    _profilePicController.sink.add(imageFile);
  }
  dispose() {
    _profilePicController.close(); // close our StreamController to avoid memory leak
  }

}