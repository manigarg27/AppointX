
import 'package:flutte_app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool isDoctor = false;
  bool isPatient = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/homescreen.jpg'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 0),
            child: Column(
              children: [
                Text(
                  'Welcome User,',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 30.0),
                ),
                SizedBox(
                  height: 400.0,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      isDoctor = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Wrapper(
                                isDoctor: isDoctor, isPatient: isPatient)));
                  },
                  color: Color(0xFF7380F2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Continue as Doctor',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  elevation: 7.0,
                ),
                SizedBox(
                  height: 35.0,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      isPatient = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Wrapper(
                                isDoctor: isDoctor, isPatient: isPatient)));
                  },
                  color: Color(0xFF7380F2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Continue as Patient',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  elevation: 7.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
