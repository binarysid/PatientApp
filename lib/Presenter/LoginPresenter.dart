
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Services/AuthService.dart';

class LoginPresenter{
  var service = AuthService();
  Future<UserData> userLoginRequest(String phone, String password) async{
    var userData = await service.loginRequest(phone, password);
    if (userData != null) {
      userData.phone = phone;
      Cache.addLoginInfoToCache(userData.id, userData.name,userData.phone);
      return userData;
    }
    return null;
  }
}