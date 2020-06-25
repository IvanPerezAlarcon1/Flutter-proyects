import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_avanzadas/utils/app_colors.dart';

class RoundedButton extends StatelessWidget {
  //parametro que requerira el metodo al declararse
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  const RoundedButton({Key key, 
    @required this.onPressed,
    @required this.label, this.backgroundColor}) 
    :assert(label != null), super (key:key
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        child: Text(
          this.label, 
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'sans',
            letterSpacing: 1,//espaciado entre las letras
            fontSize: 18,
            ),
          ),
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),//largo y ancho del botón
        decoration: BoxDecoration(
          //si backgroundcolor es !=null, se toma el valor ingresado, en caso contrario se usa AppColors.primary
          color: this.backgroundColor ?? AppColors.primary, //color del botón
          boxShadow: [ //sombreado del botón
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(30),//para dar un borde circular al botón
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}