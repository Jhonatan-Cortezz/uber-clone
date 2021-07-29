import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:uberapp/src/providers/auth_provider.dart';
import 'package:uberapp/src/utils/my_progress_dialog.dart';

class LogonController {
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  AuthProvider _authProvider;
  ProgressDialog _progressDialog;

  Future init(BuildContext context){
    this.context = context;
    _authProvider = new AuthProvider();
    _progressDialog = MyProgressDialog.createProgressDialog(context, "Iniciando sesion");
  }

  Void goToRegisterPage(){
    Navigator.pushNamed(context, 'register');
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
      } else {
        print('El usuario no se pudo autenticar');
      }
    } catch (error) {
      _progressDialog.hide();
      print('error: $error');
    }
  }
}