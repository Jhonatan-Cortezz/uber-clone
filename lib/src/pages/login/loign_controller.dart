import 'package:flutter/material.dart';

class LogonController {
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future init(BuildContext context){
    this.context = context;
  }

  void login(){
    String email = emailController.text;
    String password = passwordController.text;

    print('email: $email');
    print('email: $password');
  }
}