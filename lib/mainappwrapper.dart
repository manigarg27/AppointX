import 'package:flutte_app/HospitalDetails.dart';
import 'package:flutte_app/Mainhomepage.dart';

import 'package:flutte_app/home.dart';
import 'package:flutte_app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mainwrapper extends StatefulWidget {
  @override
  _MainwrapperState createState() => _MainwrapperState();
}

class _MainwrapperState extends State<Mainwrapper> {
  bool isloggedIn = false;
  bool isPat = false;
  bool isDoc = false;

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isloggedIn = prefs.getBool('isloggedin');
      isPat = prefs.getBool('isPat');
      isDoc = prefs.getBool('isDoc');

      if (isloggedIn == true && isDoc == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage())); //todo: replace home with doctor dashboard widget
      } else if (isloggedIn == true && isPat == true) {
        Navigator.push(
            //todo: replace home with patient dashboard widget
            context,
            MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Wrapper()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
