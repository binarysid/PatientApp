
import 'package:patientapp/Model/DoctorListData.dart';
import 'package:patientapp/Services/DoctorService.dart';

class DoctorListPresenter{
  var service = DoctorService();
  List<DoctorListData> _doctorList;
  List<DoctorListData> _filteredDoctorList;

  Future getDoctorlListBy(int hospitalID) async{
    var service = DoctorService();
    var doctorData =await service.getDoctorListBy(hospitalID);
    this._doctorList = doctorData.list;
    this._filteredDoctorList = doctorData.list;
  }
  List<DoctorListData> getFilteredDoctorList(){
    return _filteredDoctorList;
  }
}