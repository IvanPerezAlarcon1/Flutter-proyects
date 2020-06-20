import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_avanzadas/pages/login/widgets/welcome.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {//esto se ejecuta una vez, cuando el widget es creado, si lo pusieramos en el metodo build se ejecutaria muchas veces
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);//cambia la estatus bar a un color oscuro (donde se ve la bateria y hora)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,//le damos todo el alto y ancho posibles al container
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Welcome(),
          ],
        ),
      ),
    );
  }
}