import 'package:flutte_app/bloodbankwrapper.dart';
import 'package:flutte_app/diagnosis.dart';
import 'package:flutte_app/hospitals.dart';
import 'package:flutte_app/listHospitals.dart';
import 'package:flutte_app/sos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'covid_detection.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe4ebfe),
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Color(0xffe4ebfe),
        //   leading:  Padding(
        //     padding: const EdgeInsets.only(left:8.0),
        //     child: CircleAvatar(
        //         radius: 25, child: Image.asset("assets/circleAvatar.jpg")),
        //   )
        //   ,
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.dashboard,color: Colors.black,size: 26,),
        //     )
        //   ],
        // ),
        appBar: AppBar(
          backgroundColor: Color(0xff7380f2),
          centerTitle: true,
          title: Text(
            "My Infirmary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          elevation: 10,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              size: 26.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.dashboard,
                size: 26.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SvgPicture.asset(
                  'assets/dr.svg',
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 12, right: 10, bottom: 2),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50.0, bottom: 20, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  //Text('  ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 32),),
                                  Text(
                                    ' Hello,Jessika! 💊',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 6, bottom: 10),
                              child: Opacity(
                                opacity: 0.9,
                                child: Container(
                                  height: 48,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    color: Color(0xffffffff),
                                  ),
                                  child: TextField(
                                      // controller: searchController,
                                      decoration: InputDecoration(
                                    hintText: 'Search ...',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        letterSpacing: 0.5),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Color(0xff7380f2),
                                      size: 28,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.9,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                color: Color(0xff7380f2),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Stay home!\n',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22)),
                                            TextSpan(
                                                text: "schedule an e-visit\n"),
                                            TextSpan(
                                                text:
                                                    'and discuss the plan\nwith a doctor')
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: 100,
                                          width: 100,
                                          child: SvgPicture.asset(
                                            'assets/maskwomen.svg',
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "What do you need?",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        wordSpacing: 3),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                                padding: const EdgeInsets.all(4.0),
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.9,
                                    child: GestureDetector(
                                      /* onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Grid())),*/
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        color: Color(0xffffffff),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                    "assets/diagnosis.png")),
                                            Text("Diagnostic"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.9,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BloodBankWrapper())),
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        color: Color(0xfffe7940),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                    "assets/injection.png")),
                                            Text("Blood Bank"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.9,
                                    child: GestureDetector(
                                      /* onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HospitalList())),*/
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        color: Color(0xffffffff),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                    "assets/support.png")),
                                            Text("Consultation"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.9,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SOS())),
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        color: Color(0xfffe7940),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                    "assets/ambulance.png")),
                                            Text("SOS"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.9,
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                      color: Color(0xffffffff),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                  "assets/nurse.png")),
                                          Text("Samadhan"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.9,
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                      color: Color(0xfffe7940),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                  "assets/laboratory.png")),
                                          Text("Lab Reports"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ))
              ],
            )
          ],
        ));
  }
}
