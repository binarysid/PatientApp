class RestURL{
  static final baseURL = "http://10.0.2.2:8000/api/";
  static final login = baseURL + "loginpatient";
  static final hospitalList = baseURL + "hospitals";
  static final specializationList = baseURL + "specializationlist";
  static final doctorList = baseURL + "doctorlist";
  static final doctorProfile = baseURL + "doctorProfileBy";
  static final doctorSchedules = baseURL + "doctorschedules";
  static final doctorAppointment = baseURL + "doctorappointment";
  static final commonHeader = {"Content-type": "application/json"};
}