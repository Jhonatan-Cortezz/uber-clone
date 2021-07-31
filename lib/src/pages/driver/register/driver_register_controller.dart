import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:uberapp/src/models/driver.dart';
import 'package:uberapp/src/providers/auth_provider.dart';
import 'package:uberapp/src/providers/driver_provider.dart';
import 'package:uberapp/src/utils/my_progress_dialog.dart';
import 'package:uberapp/src/utils/snackbar.dart' as utils;

class DriverRegisterController {
  BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController pin1Controller = new TextEditingController();
  TextEditingController pin2Controller = new TextEditingController();
  TextEditingController pin3Controller = new TextEditingController();
  TextEditingController pin4Controller = new TextEditingController();
  TextEditingController pin5Controller = new TextEditingController();
  TextEditingController pin6Controller = new TextEditingController();

  AuthProvider _authProvider;
  DriverProvider _driverProvider;
  ProgressDialog _progressDialog;

  Future init(BuildContext context){
    this.context = context;
    _authProvider = new AuthProvider();
    _driverProvider = new DriverProvider();
    _progressDialog = MyProgressDialog.createProgressDialog(context, "Espere un momento");
  }

  void register() async {
    String userName = userNameController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String pin1 = pin1Controller.text.trim();
    String pin2 = pin2Controller.text.trim();
    String pin3 = pin3Controller.text.trim();
    String pin4 = pin4Controller.text.trim();
    String pin5 = pin5Controller.text.trim();
    String pin6 = pin6Controller.text.trim();

    String plate = '$pin1$pin2$pin3 - $pin4$pin5$pin6';

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

        Driver driver = new Driver(
          id: _authProvider.getUser().uid,
          email: _authProvider.getUser().email,
          username: userName,
          password: password,
          plate: plate
        ); 

        await _driverProvider.create(driver);
        _progressDialog.hide();
        Navigator.pushNamedAndRemoveUntil(context, 'driver/map', (route) => false);
        utils.Snackbar.showSnackbar(context, key, 'El driver se registro correctamente');
      } else {
        utils.Snackbar.showSnackbar(context, key, 'El driver no se pudo registrar');
        _progressDialog.hide();
      }
    } catch (error) {
      print('error: $error');
      _progressDialog.hide();
      utils.Snackbar.showSnackbar(context, key, error.toString());
    }
  }
}