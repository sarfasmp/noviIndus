import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String hintText;
  CustomTextField({
    this.controller, required this.hintText
  });
  @override
  Widget build(BuildContext context) {
    return  TextField(
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


}


void showSnackCm(
    {required BuildContext context,
      String? msg,
      bool? load,
    }) {
  var snackBar = SnackBar(
      duration: Duration(seconds: load!=null?60:4),
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      content:  Row(children: [
        load!=null?
        CircularProgressIndicator():SizedBox(),
        load!=null?
        SizedBox(
          width: 20,
        ):SizedBox(),
       Text(
          msg?? "",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontSize: 14, color: Colors.white),
        )
      ])
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
