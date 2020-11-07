import 'package:flutte_app/Mainhomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4ebfe),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              WelcomeLogo(),
              WelcomeSVG(),
              LargeButton()
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeLogo extends StatelessWidget {
  const WelcomeLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(12.0)),
          color: Color(0xffffe2e2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your 4 step solution to keep your\nHealth in your pocket",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}

class WelcomeSVG extends StatelessWidget {
  const WelcomeSVG({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        padding: const EdgeInsets.all(4.0),
        children: <Widget>[
          Card(
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            color: Color(0xffccf6c8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 110,
                  width: 100,
                  child: SvgPicture.asset("assets/remote.svg"),
                ),
                Text(
                  "1.Quick-appointment✔",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Card(
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            color: Color(0xfffafcc2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 110,
                  width: 100,
                  child: SvgPicture.asset("assets/drm.svg"),
                ),
                Text(
                  "2.Full Healthcheck ✔",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Card(
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            color: Color(0xfff6d6ad),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 110,
                  width: 100,
                  child: SvgPicture.asset("assets/dr.svg"),
                ),
                Text(
                  "3.Proper consultation ✔",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Card(
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            color: Color(0xfff9c0c0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 110,
                  width: 100,
                  child: SvgPicture.asset("assets/maskwomen.svg"),
                ),
                Text(
                  "4.Safety first✔",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  const LargeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0)),
        color: Color(0xff7380f2),
        // shape: buildRoundedRectangleBorder(),
        child: Text(
          "Enrich your health",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
    );
  }
}
