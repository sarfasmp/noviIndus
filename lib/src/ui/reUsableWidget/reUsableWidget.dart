import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget textField(
    { TextEditingController? controller, required String hintText}) {
  return TextField(
    controller: controller,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor("#2a2a2a1a"),
          ),
          borderRadius: BorderRadius.circular(15)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor("#2a2a2a1a")),
          borderRadius: BorderRadius.circular(15)),
      fillColor: HexColor("##2a2a2a1a"),
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 15),
    ),
  );
}
