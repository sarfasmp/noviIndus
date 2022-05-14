import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Color.fromRGBO(252, 21, 59, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/homeScreen/logo.png",
                        height: 68,
                        width: 205,
                      ))),
              Flexible(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: SizedBox(
                           width: size.width - 90,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)))),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.only(left: 30, right: 30),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed("/loginScreen");
                              },
                              child: Text(
                                "GET STARTED",
                                style: TextStyle(color: Color.fromRGBO(252, 21, 59, 1),fontSize: 20),
                              )),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
