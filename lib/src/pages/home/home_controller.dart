import 'package:flutter/material.dart';

class HomeController {
  BuildContext context;

  Future init(BuildContext context) {
    this.context = context;
  }

  /* este metodo no retorna nada */
  Future goToLoginPage() {
    Navigator.pushNamed(context, 'login');
  }
}
