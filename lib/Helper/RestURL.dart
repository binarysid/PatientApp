class RestURL{
  // static final baseURL = "http://10.0.2.2:8000/api/";
  static final baseURL = "http://api.nogorbazar.com/";
  static final patientBaseURL = baseURL+"patient/api";
  static final hospitalBaseURL = baseURL+"hospital/api";
  static final doctorBaseURL = baseURL+"doctor/api";
  static final login = patientBaseURL + "loginpatient";
  static final hospitalList = hospitalBaseURL + "hospitals";
  static final specializationList = hospitalBaseURL + "specializationlist";
  static final doctorList = doctorBaseURL + "doctorlist";
  static final doctorProfile = hospitalBaseURL + "doctorProfileBy";
  static final doctorSchedules = hospitalBaseURL + "doctorschedules";
  static final doctorAppointment = hospitalBaseURL + "doctorappointment";
  static final commonHeader = {"Content-type": "application/json"};
}