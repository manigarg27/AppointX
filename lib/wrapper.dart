import 'package:flutte_app/Mainhomepage.dart';
import 'package:flutte_app/authenticate/doctorsignup.dart';
import 'package:flutte_app/authenticate/register.dart';
import 'package:flutte_app/home.dart';
import 'package:flutte_app/models/user.dart';
import 'package:flutte_app/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Wrapper extends StatefulWidget {

  bool isPatient = false;
  bool isDoctor = false;

  Wrapper({this.isDoctor, this.isPatient});

  @override
  _WrapperState createState() => _WrapperState();
  
}

class _WrapperState extends State<Wrapper> {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null && widget.isDoctor == true && !widget.isPatient) {
      return HomePage();
    } else if (user != null && widget.isPatient == true && !widget.isDoctor) 
    {
      return HomePage();
    } else if (user == null && widget.isDoctor == true) {
      return Doctorlosignup();
    } else if (user == null && widget.isPatient == true) {
      return Register();
    } else {
      return Welcome();
    }
    //either show home or authenticate
  }
}
