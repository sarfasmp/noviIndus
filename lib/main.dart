import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noviindus/src/ui/busManageScreen.dart';
import 'package:noviindus/src/ui/dashBoardScreen.dart';
import 'package:noviindus/src/ui/homeScreen.dart';
import 'package:noviindus/src/ui/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context)=> MyHomePage(),
        "/loginScreen": (context)=> LoginScreen(),
        "/dashBoardScreen": (context)=> DashBoardScreen(),
        "/busManageScreen": (context)=> BusManageScreen(),
      },
    );
  }
}


