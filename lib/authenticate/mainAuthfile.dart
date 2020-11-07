import 'package:flutte_app/authenticate/authenticate.dart';
import 'package:flutte_app/authenticate/register.dart';
import 'package:flutter/material.dart';

class MainAuth extends StatefulWidget {
  @override
  _MainAuthState createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  
  bool showSignin = true;

  void toggleView() {
    setState(() => showSignin = !showSignin);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return Authenticate(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
