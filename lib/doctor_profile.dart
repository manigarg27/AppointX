import 'package:flutte_app/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class Doctors extends StatefulWidget {
  String doctorName = '';
  String speciality = '';

  Doctors(String doctorName, String speciality) {
    this.doctorName = doctorName;
    this.speciality = speciality;
  }

  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  String fees = '500';
  @override
  Widget build(BuildContext context) {
    Future<DateTime> newDateTime;
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.deepPurpleAccent.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 4.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 60.0),
                Text(
                  widget.doctorName,
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(height: 5.0),
                Text(
                  widget.speciality,
                  style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Fee : Rs. $fees',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 30.0,
                            width: 70.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.redAccent,
                              color: Colors.red,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    '9:00am',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 30.0,
                            width: 70.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.redAccent,
                              color: Colors.red,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    '11:00am',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 30.0,
                            width: 70.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.redAccent,
                              color: Colors.red,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    '4:00pm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 30.0,
                            width: 70.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.redAccent,
                              color: Colors.red,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    '5:00pm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 35.0),
                Container(
                    height: 60.0,
                    width: 270.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment(fees)));
                        },
                        child: Center(
                          child: Text(
                            'Book appointment',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 21.0),
                          ),
                        ),
                      ),
                    )),
              ],
            )),
      ],
    ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
