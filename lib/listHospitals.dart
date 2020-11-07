import 'package:flutte_app/listDoctors.dart';
import 'package:flutte_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

String query = '';

class _HospitalListState extends State<HospitalList> {
  String hospitalname = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7380F2),
        title: Text(
          ' Hospitals',
          style: TextStyle(
              fontFamily: 'Poppins', letterSpacing: 1.5, fontSize: 22.0),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 0),
        child: StreamBuilder(
            stream:
                Firestore.instance.collection("HospitalDetails").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              }

              return ListView(
                children: snapshot.data.documents.map((document) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1,
                        height: MediaQuery.of(context).size.height / 7.5,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 8.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(4, 4))
                            ]),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 12.0, 10.0, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 70.0,
                                    width: 50.0,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                          'https://static.toiimg.com/photo/76729750.cms'),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Name :' +
                                            " " +
                                            document['HospitalName'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 18.0),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Addr :' + " " + document['Address'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 15.0),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        hospitalname = document['HospitalName'];
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DoctorList(hospitalname),
                                            ));
                                      })
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
