import 'package:flutter/material.dart';

class DriverMapPage extends StatefulWidget {

  @override
  _DriverMapPageState createState() => _DriverMapPageState();
}

class _DriverMapPageState extends State<DriverMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Mapa del conductor'
        ),
      ),
    );
  }
}