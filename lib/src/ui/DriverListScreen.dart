import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noviindus/src/model/apiModels.dart';
import 'package:noviindus/src/provider/dashBoardProvider.dart';
import 'package:noviindus/src/publicData/publicData.dart';
import 'package:provider/provider.dart';

class DriverListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var dashPro = Provider.of<DashBoardProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Driver List"),
          backgroundColor: HexColor("#2B2B2B"),
          centerTitle: true,
        ),
        floatingActionButton: SizedBox(
          width: size.width - 80,
          child: FloatingActionButton(
              backgroundColor: HexColor("#FC153B"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/driverAddScreen");
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
                    padding: EdgeInsets.only(bottom: 50),
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
                                          // image: DecorationImage(
                                          //   image: NetworkImage(baseUrl+e.image.toString())
                                          // ),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))),
                                      height: 60,
                                      width: 70,
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
                                                          HexColor("#FC153B"))),
                                              onPressed: () {
                                                dashPro.deleteDriver(
                                                    deleteId: e.id.toString(),
                                                    context: context);
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
