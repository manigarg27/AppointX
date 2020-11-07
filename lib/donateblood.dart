import 'package:flutte_app/shared/contents.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fluttertoast/fluttertoast.dart';

class DonateBlood extends StatefulWidget {
  @override
  _DonateBloodState createState() => _DonateBloodState();
}

class _DonateBloodState extends State<DonateBlood> {
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String name = '';
  String bloodgroup = '';
  String number = '';

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
              Color(0xFF398AE5),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 70.0),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    'Hey Donor,',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        letterSpacing: 0.8),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Row(
                children: [
                  Icon(Icons.format_quote_outlined),
                  Text(
                    ' Donate your blood for a reason, ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 17.0),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  SizedBox(
                    
                    width: 26.0,
                  ),
                  Text(
                    ' let the reason to be life ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 17.0),
                  ),
                  Icon(Icons.format_quote_outlined),
                ],
              ),
              SizedBox(height: 50.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (val) => val.isEmpty ? 'Enter Username' : null,
                onChanged: (value) {
                  setState(() => name = value);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'BloodGroup',
                  prefixIcon: Icon(
                    Icons.bubble_chart,
                  ),
                ),
                obscureText: true,
                validator: (val) => val.length < 1
                    ? 'Blood group must be of 2 characters'
                    : null,
                onChanged: (value) {
                  setState(() => bloodgroup = value);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Mobile no.',
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                ),
                validator: (val) =>
                    val.length < 10 ? 'Please enter Valid number' : null,
                onChanged: (value) {
                  setState(() => number = value);
                },
              ),
              SizedBox(height: 50.0),
              RaisedButton(
                elevation: 6.0,
                onPressed: () async {
                  final CollectionReference reference =
                      Firestore.instance.collection('Donors');
                  dynamic result = await reference.add({
                    'DonorName': name,
                    'Bloodgroup': bloodgroup,
                    'DonorNumber': number
                  });

                  if (result == null) {
                    print('sorry but data not inserted');
                  } else {
                    Fluttertoast.showToast(
                        msg: "Details Successfully Submitted",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                color: Color(0xFF398AE5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 18, 40, 18),
                  child: Text(
                    'Submit Details',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 18.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
