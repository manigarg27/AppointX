import 'package:flutte_app/donateblood.dart';
import 'package:flutte_app/needblood.dart';
import 'package:flutter/material.dart';

class BloodBankWrapper extends StatefulWidget {
  @override
  _BloodBankWrapperState createState() => _BloodBankWrapperState();
}

class _BloodBankWrapperState extends State<BloodBankWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NeedBlood()));
                },
                child: Image(
                  image: NetworkImage(
                      'https://cdn0.iconfinder.com/data/icons/health-icons/110/Blood-Donate-512.png'),
                  height: 220.0,
                ),
              ),
              Text(
                'Need Blood',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0),
              ),
              SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DonateBlood()));
                },
                child: Image(
                  image: NetworkImage(
                      'https://img.icons8.com/color/452/drop-of-blood.png'),
                  height: 150.0,
                ),
              ),
              Text(
                'Donate Blood',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
