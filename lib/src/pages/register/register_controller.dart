import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:uberapp/src/models/client.dart';
import 'package:uberapp/src/providers/auth_provider.dart';
import 'package:uberapp/src/providers/client_provider.dart';
import 'package:uberapp/src/utils/my_progress_dialog.dart';
import 'package:uberapp/src/utils/snackbar.dart' as utils;

class RegisterController {
  BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  AuthProvider _authProvider;
  ClientProvider _clientProvider;
  ProgressDialog _progressDialog;

  Future init(BuildContext context){
    this.context = context;
    _authProvider = new AuthProvider();
    _clientProvider = new ClientProvider();
    _progressDialog = MyProgressDialog.createProgressDialog(context, "Espere un momento");
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
      utils.Snackbar.showSnackbar(context, key, "El usuario debe ingresar todos los campos");
      return;
    }

    if (confirmPassword != password) {
      utils.Snackbar.showSnackbar(context, key, "Las contraseñas no coninciden");
      return;
    }

    if (password.length < 6) {
      utils.Snackbar.showSnackbar(context, key, "El password debe tener al menos 6 caracteres");
      return;
    }

    _progressDialog.show();
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
        _progressDialog.hide();
        utils.Snackbar.showSnackbar(context, key, 'El usuario se registro correctamente');
      } else {
        utils.Snackbar.showSnackbar(context, key, 'El usuario no se pudo registrar');
        _progressDialog.hide();
      }
    } catch (error) {
      print('error: $error');
      _progressDialog.hide();
      utils.Snackbar.showSnackbar(context, key, error.toString());
    }
  }
}