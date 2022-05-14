import 'package:flutter/material.dart';
import 'package:noviindus/src/model/apiModels.dart';

class BusManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final args = ModalRoute.of(context)!.settings.arguments as BusList;
    return Scaffold(

      appBar: AppBar(
        title: Text(args.name??""),
        backgroundColor:Color.fromRGBO(43, 43, 43, 1),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 10 / 3,
              child: Container(
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color:Color.fromRGBO(43, 43, 43, 1),
                    borderRadius: BorderRadius.circular(10)),
                //height: 100,
                width: size.width,
                child:Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rohith sharma",style: TextStyle(color: Colors.white,fontSize: 26),),
                            Text("Lisnc no: 1115214517",style: TextStyle(color: Colors.white,fontSize: 10),)
                          ],
                        ),
                      )
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset("assets/homeScreen/driver.png"),
                    ),
                  ],
                ) ,
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
                    itemCount: (5 + int.parse(args.seatCount??"0") + (int.parse(args.seatCount??"0") / 4).ceil()).toInt(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index < 4 || index % 5 == (args.seatCount!.contains("2x2")?2:1)) {
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
