import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:noviindus/src/globalVariable/globalVariables.dart';
import 'package:noviindus/src/model/apiModels.dart';
import 'package:noviindus/src/provider/dashBoardProvider.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dashPro = Provider.of<DashBoardProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/homeScreen/logo.png",
          height: 26,
          width: 120,
        ),
        backgroundColor: Color.fromRGBO(43, 43, 43, 1),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(252, 21, 59, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bus",
                                        style: TextStyle(
                                            fontSize: 26, color: Colors.white),
                                      ),
                                      Text(
                                        "Manage your bus",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child:
                                      Image.asset("assets/homeScreen/bus.png")),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/driverListScreen");
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            height: 200,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(43, 43, 43, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Driver",
                                          style: TextStyle(
                                              fontSize: 26,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Manage your driver",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                        "assets/homeScreen/driver.png")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ].cast<Widget>() +
            [
              FutureBuilder(
                  future: dashPro.fetchBusList(
                      token: token.toString(),
                      key: apiKey.toString(),
                      context: context),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      List<BusList> busList = snap.data as List<BusList>;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "${busList.length} Buses found",
                                    style: TextStyle(fontSize: 13),
                                  )),
                            ].cast<Widget>() +
                            busList
                                .map((e) => Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    // image: DecorationImage(
                                                    //   image: NetworkImage(baseUrl+e.image.toString())
                                                    // ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(10),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10))),
                                                height: 60,
                                                width: 70,
                                                child: Image.network(baseUrl+e.image.toString(),
                                                 errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                                                   return Center(child: const Text('😢'));
                                                 }
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Text(e.driver ?? ""),
                                                          Text(e.name ?? "")
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15.0),
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty.all(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8))),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                            Color.fromRGBO(250, 21, 59, 1),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              "/busManageScreen",
                                                              arguments:
                                                                  BusList(
                                                                seatCount:
                                                                    e.seatCount,
                                                                type: e.type,
                                                                name: e.name,
                                                              ));
                                                        },
                                                        child: Text(
                                                          "Manage",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ))
                                .toList()
                                .cast<Widget>(),
                      );
                    }
                  }),
            ],
      ),
    );
  }
}
