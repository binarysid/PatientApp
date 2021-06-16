class RestURL{
  // static final baseURL = "http://10.0.2.2:8000/"; // for android(if using emulator) localhost
  // static final baseURL = "http://127.0.0.1:8000/"; // for iOS localhost
  static final baseURL = "http://health.nogorbazar.com/";
  // static final baseURL = "103.204.244.18:8000/"; // local machine ip
  static final patientBaseURL = baseURL+"patient/api/";
  static final hospitalBaseURL = baseURL+"hospital/api/";
  static final doctorBaseURL = baseURL+"doctor/api/";
  static final login = patientBaseURL + "loginpatient";
  static final register = patientBaseURL + "registerpatient";
  static final updateProfile = patientBaseURL + "updateinfo";
  static final hospitalList = hospitalBaseURL + "hospitals";
  static final specializationList = hospitalBaseURL + "specializationlist";
  static final doctorList = doctorBaseURL + "list";
  static final doctorProfile = hospitalBaseURL + "doctorProfileBy";
  static final doctorSchedules = hospitalBaseURL + "doctorschedules";
  static final doctorAppointment = hospitalBaseURL + "doctorappointment";
  static final appointmentList = patientBaseURL + "getappointments";
  static final commonHeader = {"Content-type": "application/json"};
}