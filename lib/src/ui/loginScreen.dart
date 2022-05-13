import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noviindus/src/provider/loginProvider.dart';
import 'package:noviindus/src/ui/reUsableWidget/reUsableWidget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    var loginPro = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
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
                loginPro.onLoginClick(
                    userName: "admin_user",
                    password: "123admin789",
                    context: context);
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: HexColor("2B2B2B"),
            height: size.height * 40 / 100,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/homeScreen/polygon.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 41,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Manage your bus and drivers",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 10),
            child: textField(
              hintText: "Enter Username",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: textField(
              hintText: "Password",
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
