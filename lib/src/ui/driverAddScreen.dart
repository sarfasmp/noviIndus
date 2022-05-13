import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noviindus/src/ui/reUsableWidget/reUsableWidget.dart';

class DriverAddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;


    return Scaffold(
      appBar: AppBar(
        title: Text("Add Driver"),
        backgroundColor: HexColor("#2B2B2B"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: SizedBox(
        width: size.width - 80,
        child: Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
              backgroundColor: HexColor("#FC153B"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {

              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 20),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding:
            const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 10),
            child: textField(
              hintText: "Enter Name",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: textField(
              hintText: "Enter Licence Number",
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
