import 'package:flutter/material.dart';
import 'package:uberapp/src/utils/colors.dart' as utils;

class ButtonApp extends StatelessWidget {
  /* para recibit parametros */
  Color color;
  Color textColor;
  String text;
  IconData icon;

  ButtonApp(
      {this.color,
      this.textColor = Colors.white,
      @required this.text,
      this.icon = Icons.arrow_forward_ios});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      color: color,
      textColor: textColor,
      // child: Text(text),chi
      child: Stack(
        /* esto me permite colocar un elemento encima de otro */
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(text,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 50,
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  icon,
                  color: utils.Colors.uberCloneColor,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
      /* para el border rounded */
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
