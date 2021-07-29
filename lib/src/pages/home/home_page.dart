import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uberapp/src/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomeController _con = new HomeController();

  @override
  Widget build(BuildContext context) {
    _con.init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.grey.shade800])),
          child: Column(
            children: [
              bannerClipPath(context),
              SizedBox(height: 50),
              Text('SELECCIONA TU ROL',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'OneDay')),
              SizedBox(height: 50),
              _imageTypeUser('assets/img/pasajero.png', context, 'client'),
              SizedBox(height: 10),
              _textTypeUser('Cliente'),
              SizedBox(height: 50),
              _imageTypeUser('assets/img/driver.png', context, 'driver'),
              SizedBox(height: 10),
              _textTypeUser('Conductor')
            ],
          ),
        ),
      ),
    );
  }

  Widget _textTypeUser(String typeUser) {
    /* la linea baja en el nombre del metodo es para ponerlo privado */
    return Text(typeUser, style: TextStyle(color: Colors.white));
  }

  Widget _imageTypeUser(String imagePath, BuildContext context, String typeUser) {
    return GestureDetector(
      onTap: (){
        _con.goToLoginPage(typeUser);
      },
        
      child: CircleAvatar(
        /* assets/img/driver.png */
        backgroundImage: AssetImage(imagePath),
        radius: 50,
        backgroundColor: Colors.grey[800],
      ),
    );
  }

  Widget bannerClipPath(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Facil y rapido',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
