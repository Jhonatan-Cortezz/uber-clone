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

  void register() async {
    String userName = userNameController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('email: $email');
    print('email: $userName');
    print('email: $password');
    print('email: $confirmPassword');

    if (userName.isEmpty && email.isEmpty && password.isEmpty && confirmPassword.isEmpty){
      print("El usuario debe ingresar todos los campos");
      return;
    }

    if (confirmPassword != password) {
      print("Las contraseñas no coninciden");
      return;
    }

    if (password.length < 6) {
      print("El password debe tener al menos 6 caracteres");
      return;
    }

    try {
      bool isRegister = await _authProvider.rgister(email, password);

      if(isRegister){
        print('El usuario se registro correctamente');
      } else {
        print('El usuario no se pudo registrar');
      }
    } catch (error) {
      print('error: $error');
    }
  }
}