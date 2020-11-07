import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SOS extends StatefulWidget {
  @override
  _SOSState createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7380f2),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "SOS Center",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      onTap: () => launch("tel://112"),
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
                                child: Image.network(
                                    "https://banner2.cleanpng.com/20180424/gsq/kisspng-helpline-mental-health-information-technical-suppo-new-year-wish-5adfa7e4c69d76.3451582015246069488135.jpg")),
                            Text("SOS helpline"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: GestureDetector(
                      onTap: () => launch("tel://+91-11-23978046"),
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
                                child: Image.asset("assets/virus.png")),
                            //child: Image.network("https://www.pinclipart.com/picdir/big/15-159514_health-png-transparent-images-health-png-clipart.png")),
                            Text("Covid-19 helpline"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: GestureDetector(
                      onTap: () => launch("tel://100"),
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
                                    "https://pngtree.com/freepng/q-version-cute-saluting-police-cartoon-design_4377239.html")),
                            Text("Police"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: GestureDetector(
                      // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnosis())),
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
                            Text("Road Accident Relief"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
