import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:uberapp/src/providers/auth_provider.dart';
import 'package:uberapp/src/utils/shared_pref.dart';

class HomeController {
  BuildContext context;
  SharedPref _sharedPref;
  AuthProvider _authProvider;

  Future init(BuildContext context) {
    this.context = context;
    _sharedPref = new SharedPref();
    _authProvider = new AuthProvider();
    _authProvider.checkIfUserLoggerd(context);
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
