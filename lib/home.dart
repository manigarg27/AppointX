import 'package:flutte_app/mainappwrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutte_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () async {
            // ignore: dead_code
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('isloggedin', false);

            _auth.signOut();

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Mainwrapper()));
          },
        ),
      ),
    );
  }
}
