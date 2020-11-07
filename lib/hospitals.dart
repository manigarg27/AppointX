import 'package:flutter/material.dart';

import 'doctor_profile.dart';

class Hospitals extends StatefulWidget {
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4ebfe),
      appBar: AppBar(
        backgroundColor: Color(0xff7380f2),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Hospitals",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
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
            icon: const Icon(Icons.search),
            onPressed: () => print("search"),
            iconSize: 25,
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              //C
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Doctors('', ''))),
                        title: Text(
                          "hospital name",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "hospital location",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Sen',
                            letterSpacing: 0.5,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                        ),
                        leading: ClipOval(
                          child: Material(
                            color: Colors.blue, // button color
                            child: InkWell(
                              splashColor:
                                  Colors.deepPurpleAccent, // inkwell color
                              child: SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: Icon(
                                    Icons.local_hospital_outlined,
                                    color: Colors.red,
                                  )),
                              onTap: () {},
                            ),
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "book appointment",
                                // style: kLabel,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "✔",
                                // style: kBody2B,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                ),
              ), // hat list
              // The input widget
            ],
          ),
        ],
      ),
    );
  }
}
