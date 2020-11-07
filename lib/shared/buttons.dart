import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NiceButton(
        text: 'hello',
        width: 210,
        elevation: 8.0,
        radius: 62.0,
        background: Colors.blue,
        onPressed: () {
          print("hello");
        },
      ),
    );
  }
}
