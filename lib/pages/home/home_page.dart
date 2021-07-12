import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,
                Colors.grey.shade800
              ]
            )
          ),

          child: Column(
            children: [
              ClipPath(
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
                          fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50),
              Text('SELECCIONA TU ROL', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'OneDay'
                )
              ),
              SizedBox(height: 50),

              CircleAvatar(
                backgroundImage: AssetImage('assets/img/pasajero.png'),
                radius: 50,
                backgroundColor: Colors.grey[800],
              ),
              SizedBox(height: 10),
              Text('Cliente', style: TextStyle(color: Colors.white)),

              SizedBox(height: 50),
              CircleAvatar(
                backgroundImage: AssetImage('assets/img/driver.png'),
                radius: 50,
                backgroundColor: Colors.grey[800],
              ),
              SizedBox(height: 10),
              Text('Conductor', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}