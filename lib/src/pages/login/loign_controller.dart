import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:uberapp/src/models/client.dart';
import 'package:uberapp/src/models/driver.dart';
import 'package:uberapp/src/providers/auth_provider.dart';
import 'package:uberapp/src/providers/client_provider.dart';
import 'package:uberapp/src/providers/driver_provider.dart';
import 'package:uberapp/src/utils/my_progress_dialog.dart';
import 'package:uberapp/src/utils/shared_pref.dart';

class LogonController {
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  AuthProvider _authProvider;
  ProgressDialog _progressDialog;
  SharedPref _sharedPref;
  String _typeUser;
  DriverProvider _driverProvider;
  ClientProvider _clientProvider;

  Future init(BuildContext context) async{
    this.context = context;
    _authProvider = new AuthProvider();
    _driverProvider = new DriverProvider();
    _clientProvider = new ClientProvider();
    _progressDialog = MyProgressDialog.createProgressDialog(context, "Iniciando sesion");
    _sharedPref = new SharedPref();
    _typeUser = await _sharedPref.read('typeUser');

    print('============= TIPO DE USUARIO $_typeUser');
  }

  Void goToRegisterPage(){
    if (_typeUser == 'client') {
      Navigator.pushNamed(context, 'client/register');
    } else {
      Navigator.pushNamed(context, 'driver/register');
    }
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('email: $email');
    print('email: $password');

    _progressDialog.show();

    try {
      bool isLogin = await _authProvider.login(email, password);

      _progressDialog.hide();
      if(isLogin){
        print('El usuario esta logueado');
        if (_typeUser == 'client') {
          Client client = await _clientProvider.getById(_authProvider.getUser().uid);

          if(client != null){
            Navigator.pushNamedAndRemoveUntil(context, 'client/map', (route) => false);
          } else {
            print('El usuario no es valido');
            /* close sesion */ 
            await _authProvider.signOut();
          }
        } else if (_typeUser == 'driver') {

          Driver driver = await _driverProvider.getById(_authProvider.getUser().uid);

          if(driver != null){
            Navigator.pushNamedAndRemoveUntil(context, 'driver/map', (route) => false);
          } else {
            print('El usuario no es valido');
            /* close sesion */ 
            await _authProvider.signOut();
          }
        }
      } else {
        print('El usuario no se pudo autenticar');
      }
    } catch (error) {
      _progressDialog.hide();
      print('error: $error');
    }
  }
}