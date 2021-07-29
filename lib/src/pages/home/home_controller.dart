import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:uberapp/src/utils/shared_pref.dart';

class HomeController {
  BuildContext context;
  SharedPref _sharedPref; 

  Future init(BuildContext context) {
    this.context = context;
    _sharedPref = new SharedPref();
  }

  /* este metodo no retorna nada */
  Future goToLoginPage(String typeUser) {
    saveTypeUser(typeUser);
    Navigator.pushNamed(context, 'login');
  }

  void saveTypeUser(String typeUser) async{
    await _sharedPref.save('typeUser', typeUser);
  }
}
