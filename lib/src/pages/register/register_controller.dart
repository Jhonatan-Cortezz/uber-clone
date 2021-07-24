import 'package:flutter/material.dart';
import 'package:uberapp/src/models/client.dart';
import 'package:uberapp/src/providers/auth_provider.dart';
import 'package:uberapp/src/providers/client_provider.dart';

class RegisterController {
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  AuthProvider _authProvider;
  ClientProvider _clientProvider;

  Future init(BuildContext context){
    this.context = context;
    _authProvider = new AuthProvider();
    _clientProvider = new ClientProvider();
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

        Client client = new Client(
          id: _authProvider.getUser().uid,
          email: _authProvider.getUser().email,
          username: userName,
          password: password
        ); 

        await _clientProvider.create(client);
        print('El usuario se registro correctamente');
      } else {
        print('El usuario no se pudo registrar');
      }
    } catch (error) {
      print('error: $error');
    }
  }
}