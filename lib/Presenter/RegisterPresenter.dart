
import 'package:common_utils/UIComponent.dart';
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Services/AuthService.dart';

class RegisterPresenter{
  var service = AuthService();
  Future<UserData> register(String name,String phone, String password) async{
    var userData = await service.register(name, phone, password);
    var user = userData[0];
    if(user!=null && user.id != null) {
      var notificationRegToken = userData[1];
      user.phone = phone;
      user.name = name;
      Cache.addLoginInfoToCache(user, notificationRegToken);
      UIComponent.patientTitle = name;
    }
    return user;
  }
}