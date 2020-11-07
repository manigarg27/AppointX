import 'package:flutte_app/Mainhomepage.dart';
import 'package:flutte_app/bloodbankwrapper.dart';
import 'package:flutte_app/listDoctors.dart';
import 'package:flutte_app/listHospitals.dart';
import 'package:flutte_app/mainappwrapper.dart';
import 'package:flutte_app/models/user.dart';
import 'package:flutte_app/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        //  home: BloodBankWrapper(),
        // home: HomePage(),
        // home:  Hospitaldetais(),
        home: Mainwrapper(), /////
        // home: HospitalList(),
        // home: HospitalList(),
      ),
    );
  }
}
