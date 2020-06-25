import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_avanzadas/pages/login/widgets/welcome.dart';
import 'package:flutter_ui_avanzadas/utils/responsive.dart';
import 'package:flutter_ui_avanzadas/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AfterLayoutMixin{//AfterLayoutMixin se ejecuta cuando se renderiza la app

  @override
  void initState() {//esto se ejecuta una vez, cuando el widget es creado, si lo pusieramos en el metodo build se ejecutaria muchas veces
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);//cambia la estatus bar a un color oscuro (donde se ve la bateria y hora)
  }

  @override
  void afterFirstLayout(BuildContext context){//este método se ejecuta solo 1 vez, detecta el tipo de dispositivo en el cual se ejecuta la app
    //para ver las medidas si está horizontal o vertical, shortestSide retorna el valor mínimo del ancho o el alto, independiente del sentido del dispositivo
    final bool isTablet = MediaQuery.of(context).size.shortestSide >=600; //si esto se cumple es que la app está en una tablet y se permitira que el dispositivo rote, en caso contrario, se bloquea la opción de rotar la app
    if(!isTablet){
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //SI ME ENCUENTRO EN UN SMARTPHONE SE BLOQUEA LA ROTACIÓN DEL DISPOSITIVO
    }

  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context); //llamamos a la clase Responsive que calcula las medidas del dispositivo
    return Scaffold(
      body: GestureDetector( //para que no salga el error de overflow al querer ingresar datos a un campo
      //GestuoreDetector necesita un color en el container de abajo para poder detectar cuando se hace click en otra parte que no sea el campo de ingreso de datos para poder salierse si se hace click en otra parte
      onTap: (){
        FocusScope.of(context).unfocus();
      },

      child: Container(
          width: double.infinity,//le damos todo el alto y ancho posibles al container
          height: double.infinity,
          color: Colors.white, //esto se agrega para que el widget GestureDetector funcione correctamente y al presionar en otra parte que no sea el campo de datos respectivo, se quita el teclado de la pantalla
          child: SingleChildScrollView(//se usa para evitar el error de overflow al presionar un campo de inputs
                      child: Container(
                        height: responsive.height-30,
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,//se coloca para que los widgets Welcome() y LoginForm(), esten lo mas separados posibles
              children: <Widget>[
                Welcome(),
                LoginForm(),
              ],
            ),
                      ),
          ),
        ),
      ),
    );
  }
}