import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutte_app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutte_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth changes user streams
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //  .map((FirebaseUser user) => _userFromFirebase(user));
        .map(_userFromFirebase);
  }

  //signiwith email and password

  Future signInWithEmailandPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password

  Future registerWithEmailandPassword(
      String email, String password, String username) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for the database
      await DatabaseService(uid: user.uid)
          .updateUserData(email, password, username);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //doctor registration

  Future registerDoctorWithEmailandPassword(
      String email, String password, String username) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for the database
      await DoctorDatabaseService(uid: user.uid)
          .updateClinicData(email, password, username);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //google signin
  Future handleSiginGoogleforDoctor() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));

    FirebaseUser user = result.user;
    String email = user.email;
    String username = user.displayName;
    String photoUrl = user.photoUrl;

    await DoctorDatabaseService(uid: user.uid)
        .updatesclinicData(email, username, photoUrl);
    return _userFromFirebase(user);
  }

  bool isSignin = false;

  //google sigin for users

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));

    FirebaseUser user = result.user;
    String email = user.email;
    String username = user.displayName;
    String photoUrl = user.photoUrl;

    await DatabaseService(uid: user.uid)
        .updatesUserData(email, username, photoUrl);
    return _userFromFirebase(user);
  }

  //get current user id and add doctors under same id

  Future getCurrentUserId(
      String doctorname, String speciality, String doctorno) async {
    CollectionReference currenthospitalRef =
        Firestore.instance.collection('HospitalDetails');

    final FirebaseUser user = await _auth.currentUser();

    print(user);

    final String uid = user.uid.toString();

    return await currenthospitalRef.document(uid).collection('Doctors').add({
      'doctorname': doctorname,
      'specility': speciality,
      'doctornumber': doctorno
    });
  }
}
