import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.transparent,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(13)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.5,
    ),
  ),
  focusedBorder: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(13)),
      borderSide: BorderSide(color: Color(0xFF0D47A1), width: 2.0)),
);
