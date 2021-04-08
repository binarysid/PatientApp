
import 'package:patientapp/Model/UserData.dart';
import 'package:patientapp/Services/AuthService.dart';

class RegisterPresenter{
  var service = AuthService();
  Future<UserData> register(String name,String phone, String password) async{
    var userData = await service.register(name, phone, password);
    if (userData != null) {
      userData.phone = phone;
      return userData;
    }
    return null;
  }
}