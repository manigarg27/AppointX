import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference reference = Firestore.instance.collection('Users');
  Future updateUserData(String email, String password, String username) async {
    return await reference
        .document(uid)
        .setData({'email': email, 'password': password, 'username': username});
  }

  Future updatesUserData(String email, String username, String photoUrl) async {
    return await reference
        .document(uid)
        .setData({'email': email, 'username': username, 'photoUrl': photoUrl});
  }
}

class DoctorDatabaseService {
  
  final String uid;
  DoctorDatabaseService({this.uid});

  final CollectionReference doctorreference =
      Firestore.instance.collection('HospitalDetails');
  Future updateClinicData(
      String email, String password, String username) async {
    return await doctorreference.document(uid).setData(
        {'Clinicemail': email, 'password': password, 'HospitalName': username});
  }

  Future updatesclinicData(
      String email, String username, String photoUrl) async {
       return await doctorreference
        .document(uid)
        .setData({'email': email, 'username': username, 'photoUrl': photoUrl});
  }
}
