import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uberapp/src/pages/client/register/client_register_controller.dart';
import 'package:uberapp/src/utils/colors.dart' as utils;
import 'package:uberapp/src/widgets/button_app.dart';

class ClientRegisterPage extends StatefulWidget {
  @override
  _ClientRegisterPageState createState() => _ClientRegisterPageState();
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {
  ClientRegisterController _con = new ClientRegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.key,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _bannerClipPath(),
              _textLogin(),
              _textFieldUserName(),
              _textFieldEmail(),
              _textFieldPassword(),
              _textFieldConfirmPassword(),
              _buttonRegister(),
            ],
          ),
        ));
  }

  Widget _bannerClipPath() {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: utils.Colors.uberCloneColor,
        height: MediaQuery.of(context).size.height * 0.22,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Facil y rapido',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        'Registro',                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            fontFamily: 'NimbusSans'),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController,
        decoration: InputDecoration(
            hintText: 'correo@gmail.com',
            labelText: 'Correo electronico',
            suffixIcon: Icon(
              Icons.email_outlined,
              color: utils.Colors.uberCloneColor,
            )),
      ),
    );
  }

  Widget _textFieldUserName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        controller: _con.userNameController,
        decoration: InputDecoration(
            hintText: 'Jhonatan',
            labelText: 'Nombre de usuario',
            suffixIcon: Icon(
              Icons.person,
              color: utils.Colors.uberCloneColor,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.Colors.uberCloneColor,
            )),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        obscureText: true,
        controller: _con.confirmPasswordController,
        decoration: InputDecoration(
            labelText: 'Confirmar contraseña',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.Colors.uberCloneColor,
            )),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        color: utils.Colors.uberCloneColor,
        text: 'Registrar ahora',
        onPressed: _con.register,
      ),
    );
  }
}
