import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uberapp/src/pages/home/home_page.dart';
import 'package:uberapp/src/pages/login/login_page.dart';
import 'package:uberapp/src/utils/colors.dart' as utils;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      theme: ThemeData(
          fontFamily: 'NimbusSans',
          appBarTheme:
              AppBarTheme(elevation: 0, color: utils.Colors.uberCloneColor),
          primaryColor: utils.Colors.uberCloneColor),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
