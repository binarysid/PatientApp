
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Services/AuthService.dart';

class RegisterPresenter{
  var service = AuthService();
  Future<UserData> register(String name,String phone, String password) async{
    var userData = await service.register(name, phone, password);
    if(userData[0]!=null) {
      var user = userData[0];
      var notificationRegToken = userData[1];
      user.phone = phone;
      user.name = name;
      Cache.addLoginInfoToCache(
          user.id, name, user.phone, notificationRegToken);
      return user;
    }
    return null;
  }
}