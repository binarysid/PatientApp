
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Helper/CommonUtils.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Services/AuthService.dart';

class LoginPresenter{
  var service = AuthService();
  Future<UserData> userLoginRequest(String phone, String password) async{
    var userData = await service.loginRequest(phone, password);
    var user = userData[0];
    var notificationRegToken = userData[1];
    if (user.code == NetworkCode.success) {
      user.phone = phone;
      Cache.addLoginInfoToCache(user.id, user.name,user.phone,notificationRegToken);
    }
    return user;
  }
}