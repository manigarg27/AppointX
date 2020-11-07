import 'package:cloud_firestore/cloud_firestore.dart';

class Hospitals {
  String hospitalName;
  String address;
  List doctors;

  Hospitals.fromMap(Map<String, dynamic> data) {
    hospitalName = data['HospitalName'];
    address = data['Address'];
    doctors = data['Doctors'];
  }
}
