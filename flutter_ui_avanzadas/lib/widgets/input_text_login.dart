import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class InputTextLogin extends StatelessWidget {
  final String iconPath,placeholder;
  const InputTextLogin({Key key,@required this.iconPath,@required this.placeholder}) : 
  assert(iconPath != null && placeholder != null), //hacemos una corroboración de los parámetros
  super (key:key);//constructor
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
            //pripiedades del textfield de email
            padding: EdgeInsets.symmetric(
              vertical:7,
              horizontal: 7
              ),
            prefix: Container(
              height: 30,
              width: 40,
              padding: EdgeInsets.all(2),
              child: SvgPicture.asset(this.iconPath,
              color: Color(0xffcccccc),
              ),
            ),
            placeholder: this.placeholder,
            style:TextStyle(fontFamily: 'sans'),//estilo del texto input que se ingresa debe cambiarse tambien al deseado
            placeholderStyle: TextStyle(fontFamily: 'sans', color: Color(0xffcccccc)),//estilo del placeholder
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xffdddddd),
                ),
              ),
            ),
          );
  }
}