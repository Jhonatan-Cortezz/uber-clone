import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:uberapp/src/providers/auth_provider.dart';
import 'package:uberapp/src/utils/shared_pref.dart';

class HomeController {
  BuildContext context;
  SharedPref _sharedPref;
  AuthProvider _authProvider;
  String _typeUser;

  Future init(BuildContext context) async {
    this.context = context;
    _sharedPref = new SharedPref();
    _authProvider = new AuthProvider();
    _typeUser = await _sharedPref.read('typeUser');
    checIfUserIsAuth();
  }

  void checIfUserIsAuth(){
    bool isSigned = _authProvider.isSignedIn();
    if (isSigned) {
      if(_typeUser == 'client'){
        Navigator.pushNamedAndRemoveUntil(context, 'client/map', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, 'driver/map', (route) => false);
      }
    }
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
