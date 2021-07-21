import 'package:flutter/material.dart';
import 'package:uberapp/src/providers/auth_provider.dart';

class RegisterController {
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  AuthProvider _authProvider;

  Future init(BuildContext context){
    this.context = context;
    _authProvider = new AuthProvider();
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('email: $email');
    print('email: $password');

    try {
      bool isLogin = await _authProvider.login(email, password);

      if(isLogin){
        print('El usuario esta logueado');
      } else {
        print('El usuario no se pudo autenticar');
      }
    } catch (error) {
      print('error: $error');
    }
  }
}