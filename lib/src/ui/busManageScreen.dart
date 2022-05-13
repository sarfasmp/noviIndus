import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BusManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print({});
        },
      ),
      appBar: AppBar(
        backgroundColor: HexColor("#2B2B2B"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 10 / 3,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                //height: 100,
                width: size.width,
                //child: ,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(60),
            child: Container(
                padding: EdgeInsets.all(50),
                // height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1)),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: (5 + 16 + (16 / 4).ceil()).toInt(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index < 4 || index % 5 == 2) {
                        return Container();
                      }
                      return Container(
                        child:  index == 4? Image.asset("assets/homeScreen/seatBlack.png") : Image.asset("assets/homeScreen/seat.png"),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
