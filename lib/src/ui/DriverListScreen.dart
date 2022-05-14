import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noviindus/src/globalVariable/globalVariables.dart';

import 'package:noviindus/src/model/apiModels.dart';
import 'package:noviindus/src/provider/dashBoardProvider.dart';
import 'package:provider/provider.dart';

class DriverListScreen extends StatefulWidget {
  @override
  _DriverListScreenState createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var dashPro = Provider.of<DashBoardProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Driver List"),
          backgroundColor:Color.fromRGBO(43, 43, 43, 1),
          centerTitle: true,
        ),
        floatingActionButton: SizedBox(
          width: size.width - 80,
          child: FloatingActionButton(
              backgroundColor: Color.fromRGBO(252, 21, 59, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/driverAddScreen").then((value) {
                  setState(() {
                    print("sarfas");
                  });
                  return;
                });
              },
              child: Text(
                "Add Driver",
                style: TextStyle(fontSize: 20),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: FutureBuilder(
            future: dashPro.fetchDriverList(
                token: token.toString(),
                key: apiKey.toString(),
                context: context),
            builder: (context, snap) {
              if (!snap.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<DriverList> driverList = snap.data as List<DriverList>;
                return ListView(
                    padding: EdgeInsets.only(bottom: 80),
                    children: driverList
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(243, 243, 243, 1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))),
                                      height: 60,
                                      width: 70,
                                      child: Center(
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage("assets/homeScreen/diver.png"),
                                          radius: 25,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(e.name ?? ""),
                                              Text("Licn no" +
                                                  (e.licenseNo ?? ""))
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color.fromRGBO(252, 21, 59, 1))
                                              ),
                                              onPressed: () {
                                                dashPro.deleteDriver(
                                                    deleteId: e.id.toString(),
                                                    context: context);
                                                setState(() {});
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        )
                        .toList());
              }
            }));
  }
}
