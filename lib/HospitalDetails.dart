import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutte_app/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';

class Hospitaldetais extends StatefulWidget {
  @override
  _HospitaldetaisState createState() => _HospitaldetaisState();
}

class _HospitaldetaisState extends State<Hospitaldetais> {
  CollectionReference currenthospitalRef =
      Firestore.instance.collection('HospitalDetails');
  String time = '';
  bool checkboxValue = false;
  String btntext = 'Add Doctor';
  String continuetext = 'Continue';
  String speciality = '';
  String doctorname = '';
  String docnumber = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(7.0, 10.0, 7.0, 60.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Fill Doctor Details ,',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 29.0,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  shadowColor: Colors.black,
                  elevation: 5.0,
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter doctor\'s name',
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF7380F2)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF7380F2)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            validator: (val) =>
                                val.isEmpty ? 'Enter Name' : null,
                            onChanged: (value) {
                              setState(() => doctorname = value);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter doctor\'s speciality',
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF7380F2)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF7380F2)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            validator: (val) =>
                                val.isEmpty ? 'Enter Speciality' : null,
                            onChanged: (value) {
                              setState(() => speciality = value);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter doctor\'s Number ',
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF7380F2)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF7380F2)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            validator: (val) =>
                                val.isEmpty ? 'Enter Number' : null,
                            onChanged: (value) {
                              setState(() => docnumber = value);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Working Time',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w100,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7.0),
                                      topRight: Radius.circular(7.0),
                                      bottomLeft: Radius.circular(7.0),
                                      bottomRight: Radius.circular(7.0)),
                                ),
                                onPressed: () {},
                                color: Color(0xFF7380F2),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.timer),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text('time')
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'to',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 16.0),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7.0),
                                      topRight: Radius.circular(7.0),
                                      bottomLeft: Radius.circular(7.0),
                                      bottomRight: Radius.circular(7.0)),
                                ),
                                color: Color(0xFF7380F2),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.timer),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text('time')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: checkboxValue,
                                onChanged: (bool value) {
                                  setState(() {
                                    checkboxValue = value;
                                    if (checkboxValue == true) {
                                      btntext = continuetext;
                                    }
                                  });
                                }),
                            Text(
                              'Click here!',
                              style: TextStyle(fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(7.8, 1.0, 8.0, 10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.info),
                              SizedBox(
                                width: 7.0,
                              ),
                              Text(
                                'Click the check to Continue to Dashboard',
                                style: TextStyle(
                                    fontSize: 13.0, fontFamily: 'Poppins'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        NiceButton(
                            radius: 50,
                            fontSize: 20.0,
                            onPressed: () {

                              AuthService details = new AuthService();
                              details.getCurrentUserId(
                                  doctorname, speciality, docnumber);
                             
                            },
                            text: '$btntext',
                            background: Color(0xFF7380F2)),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
