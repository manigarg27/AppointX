import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutte_app/doctor_profile.dart';
import 'package:flutte_app/shared/loading.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatefulWidget {
  String hospitalName = '';
  DoctorList(String hospitalName) {
    this.hospitalName = hospitalName;
  }
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  String doctorName = '';
  String speciality = '';
  final CollectionReference ref = Firestore.instance.collection('Doctors');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7380F2),
        title: Text(
          widget.hospitalName,
          style: TextStyle(
              fontFamily: 'Poppins', letterSpacing: 1.5, fontSize: 20.0),
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 15.0, 0, 0),
            child: Text(
              'Please Select Doctor,',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 23.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 60.0, 2.0, 0),
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                  stream: ref.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                                      colors: [
                                        Color(0xFF6448FE),
                                        Color(0xFF5FC6FF)
                                      ],
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
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 12.0, 10.0, 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                                  document['DoctorName'],
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
                                              'Speciality :' +
                                                  " " +
                                                  document['Specialization'],
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
                                              doctorName =
                                                  document['DoctorName'];

                                              speciality =
                                                  document['Specialization'];

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Doctors(doctorName,
                                                            speciality),
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
          ),
        ],
      ),
    );
  }
}
