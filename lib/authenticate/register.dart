import 'package:flutte_app/authenticate/authenticate.dart';
import 'package:flutte_app/services/auth.dart';
import 'package:flutte_app/shared/contents.dart';
import 'package:flutte_app/shared/loading.dart';
import 'package:flutter/material.dart';

import 'package:nice_button/NiceButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String username = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF7380F2),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 90.0),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          'Hello User',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              letterSpacing: 0.8),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      onChanged: (value) {
                        setState(() => email = value);
                      },
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                      validator: (val) => val.length < 6
                          ? 'Password cannot be less than 6 characters'
                          : null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() => password = value);
                      },
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Username',
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                      validator: (val) =>
                          val.isEmpty ? 'Please enter Username' : null,
                      onChanged: (value) {
                        setState(() => username = value);
                      },
                    ),
                    SizedBox(height: 50.0),
                    NiceButton(
                      radius: 50,
                      width: 285,
                      elevation: 5.0,
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.registerWithEmailandPassword(
                                  email, password, username);

                          if (result == null) {
                            setState(() => {
                                  error =
                                      'please enter a valid email and password',
                                  loading = false
                                });
                          } else {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            prefs.setBool('isloggedin', true);
                            prefs.setBool('isPat', true);
                            
                          }
                        }
                      },
                      text: 'Register',
                      background: Color(0xFF398AE5),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      '-OR-',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        AuthService auth = new AuthService();
                        auth.handleSignIn();
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://w7.pngwing.com/pngs/229/438/png-transparent-google-logo-adsense-google-adwords-history-company-text-logo.png'))),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: .3),
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          InkWell(
                            onTap: () {
                              // widget.toggleView();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Authenticate()));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
