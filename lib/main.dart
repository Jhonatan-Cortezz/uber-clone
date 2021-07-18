import 'package:flutter/material.dart';
import 'package:uberapp/pages/home/home_page.dart';
import 'package:uberapp/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      initialRoute: 'home',
      /* esta es la ruta que se ejecuta al iniciar la app */
      theme: ThemeData(fontFamily: 'NimbusSans'),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
      },
    );
  }
}