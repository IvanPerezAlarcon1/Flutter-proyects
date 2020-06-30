import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_avanzadas/utils/responsive.dart';
import 'package:flutter_ui_avanzadas/widgets/circle_button.dart';
import 'package:flutter_ui_avanzadas/widgets/input_text_login.dart';
import 'package:flutter_ui_avanzadas/widgets/rounded_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      top: false, //ignorar el safearea de la parte superior
      child: Container(
        //color: Colors.red,
        width: 330,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, //hace que el CupertinoButon "forgot password"se alinea con el borde derecho
          mainAxisSize: MainAxisSize
              .min, //hace que se aline al centro la pantalla cuando está en horizontal
          children: <Widget>[
            InputTextLogin(
                iconPath: 'assets/pages/login/icons/mail.svg',
                placeholder: "Email Adress"),
            SizedBox(
              height: responsive.ip(
                  2), //se usa para basarse en las medidas del dispositivo donde se ejecuta la app,
            ),
            InputTextLogin(
                iconPath: 'assets/pages/login/icons/smart-key.svg',
                placeholder: "Password"),
            //seccion de olvido su contraseña
            Container(
              alignment: Alignment.centerRight, //mover el texto a la derecha
              width: double.infinity, //ocupar todo el ancho posible
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontFamily: 'sans',
                  ),
                ),
                onPressed: () {
                  //aquí se coloca la página o ventana de redirección deseada
                },
              ),
            ),
            SizedBox(
              height: responsive.ip(
                  2), //se usa para basarse en las medidas del dispositivo donde se ejecuta la app,
            ),
            RoundedButton(
              label: "Sign In",
              onPressed: () {},
              //backgroundColor: Colors.red, //no se lo pasamos porque el color primary por defecto que agregamos está bien
            ),
            SizedBox(
              height: responsive.ip(
                  3.3), //se usa para basarse en las medidas del dispositivo donde se ejecuta la app
            ),
            Text("Or continue with"),
            SizedBox(
              height: responsive.ip(
                  1), //se usa para basarse en las medidas del dispositivo donde se ejecuta la app
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleButton(
                  size: 55,
                  backgroundColor: Color(0xff448AFF),
                  iconPath: 'assets/pages/login/icons/facebook.svg',
                ),
                SizedBox(
                  width: 20,
                ),
                CircleButton(
                  //botón de google
                  size: 55,
                  backgroundColor: Color(0xffFF1744),
                  iconPath: 'assets/pages/login/icons/google.svg',
                ),
              ],
            ),
            SizedBox(
              height: responsive.ip(
                  3.7), //se usa para basarse en las medidas del dispositivo donde se ejecuta la app
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                CupertinoButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: "sans",
                      fontWeight: FontWeight.w600, //grosor del texto
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
