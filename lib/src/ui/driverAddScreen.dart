import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noviindus/src/provider/dashBoardProvider.dart';
import 'package:noviindus/src/ui/reUsableWidget/reUsableWidget.dart';
import 'package:provider/provider.dart';

class DriverAddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

   // var dashPro = Provider.of<DashBoardProvider>(context, listen: false);

    print("rebuildAddScreen");

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Driver"),
        backgroundColor: HexColor("#2B2B2B"),
        centerTitle: true,
      ),
      floatingActionButton: SizedBox(
        width: size.width - 80,
        child: Visibility(
          visible: true,
          child: FloatingActionButton(
              backgroundColor: HexColor("#FC153B"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                // dashPro.addDriver(
                //     name: dashPro.nameCnt.text,
                //     licenceNumber: dashPro.licenCnt.text,
                //     context: context);
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
            child: CustomTextField(
             // controller: dashPro.nameCnt,
              hintText: "Enter Name",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: CustomTextField(
             // controller: dashPro.licenCnt,
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
