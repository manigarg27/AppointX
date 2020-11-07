import 'package:flutte_app/covid_detection.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7380f2),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Detection Center",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
      ),
      body: Column(
        children: [
          SizedBox(
            height: 140,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: <Widget>[
                Opacity(
                  opacity: 0.9,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Diagnosis())),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      color: Color(0xffffffff),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 40,
                              width: 40,
                              child: Image.asset("assets/virus.png")),
                          Text("Covid-19"),
                        ],
                      ),
                    ),
                  ),
                ),

                Opacity(
                  opacity: 0.9,
                  child: GestureDetector(
                    //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => HeartDiagnosis())),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      color: Color(0xfffe7940),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 40,
                              width: 40,
                              child: Image.network(
                                  "https://www.pinclipart.com/picdir/big/15-159514_health-png-transparent-images-health-png-clipart.png")),
                          Text("Heart Disease"),
                        ],
                      ),
                    ),
                  ),
                ),
                // Opacity(
                //   opacity: 0.9,
                //   child: GestureDetector(
                //     onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnosis())),
                //     child: Card(elevation: 10,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(22.0),
                //       ),
                //
                //       color: Color(0xfffe7940),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: <Widget>[
                //           Container(
                //               height:40,width: 40,
                //               child: Image.asset("assets/virus.png")),
                //           Text("Covid-19"),
                //         ],
                //       ),),
                //   ),
                // ),
                // Opacity(
                //   opacity: 0.9,
                //   child: GestureDetector(
                //     onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnosis())),
                //     child: Card(elevation: 10,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(22.0),
                //       ),
                //       color: Color(0xffffffff),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: <Widget>[
                //           Container(
                //               height:40,width: 40,
                //               child: Image.asset("assets/virus.png")),
                //           Text("Covid-19"),
                //         ],
                //       ),),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
