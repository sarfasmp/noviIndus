import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class BusManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#2B2B2B"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 10/3,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
              //height: 100,
              width: size.width,

              //child: ,
              ),
            ),
          )

        ],
      ),
    );
  }
}
