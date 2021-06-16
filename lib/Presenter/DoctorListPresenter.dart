
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Services/DoctorService.dart';

class DoctorListPresenter{
  var service = DoctorService();
  List<DoctorListData> _doctorList;
  List<DoctorListData> _filteredDoctorList;

  Future getDoctorlListBy(int hospitalID) async{
    var doctorData =await service.getDoctorListBy(hospitalID);
    var doctorList = doctorData.list.where((element) => element.profileCompletionPercentage==100).toList();
    this._doctorList = doctorList;
    this._filteredDoctorList = doctorList;
  }
  List<DoctorListData> getFilteredDoctorList(){
    return _filteredDoctorList;
  }
  Future<List<DoctorListData>> getDoctorlList(int hospitalID, int specializationID, String specialization) async{

    var doctorData =await service.getDoctorListBy(hospitalID, specializationID: specializationID, specialization: specialization);
    if (doctorData.code == 200){
      var doctorList = doctorData.list.where((element) => element.profileCompletionPercentage==100).toList();
      return doctorList;
    }
  }
}