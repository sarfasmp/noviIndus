import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:noviindus/src/provider/dashBoardProvider.dart';
import 'package:noviindus/src/provider/loginProvider.dart';
import 'package:noviindus/src/ui/DriverListScreen.dart';
import 'package:noviindus/src/ui/driverAddScreen.dart';
import 'package:noviindus/src/ui/busManageScreen.dart';
import 'package:noviindus/src/ui/dashBoardScreen.dart';
import 'package:noviindus/src/ui/homeScreen.dart';
import 'package:noviindus/src/ui/loginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>LoginProvider()),
        ChangeNotifierProvider(create: (_)=>DashBoardProvider()),

      ],
      child: MyApp() ,
      )
     );
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
        "/driverListScreen": (context)=> DriverListScreen(),
        "/driverAddScreen": (context)=> DriverAddScreen()
      },
    );
  }
}


