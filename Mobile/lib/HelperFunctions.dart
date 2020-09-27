import 'package:flutter/material.dart';

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black54, fontSize: 16);
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black54),
      focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
      enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54)));
}