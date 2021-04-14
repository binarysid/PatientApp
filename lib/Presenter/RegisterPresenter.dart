
import 'package:patientapp/Helper/Cache.dart';
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Services/AuthService.dart';

class RegisterPresenter{
  var service = AuthService();
  Future<UserData> register(String name,String phone, String password) async{
    var userData = await service.register(name, phone, password);
    if (userData != null) {
      userData.phone = phone;
      userData.name = name;
      Cache.addLoginInfoToCache(userData.id, name,userData.phone);
      return userData;
    }
    return null;
  }
}