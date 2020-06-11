import 'package:flutter/material.dart';

class LugaresTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          //agregamos una imagen
          new Container(
            margin: const EdgeInsets.all(30.0),//margen de la imagen por todos los lados en float
            width: 350.0,
            height: 350.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("assets/images/elegida2.jpeg"),
              fit: BoxFit.cover
              ),
            ),
          ),
          //agregamos un boton con alguna acción
          new Container(
            margin: const EdgeInsets.only(top: 410.0, left: 60.0), //posicion del boton en la pantalla
            child: new RaisedButton( //boton en flutter
              padding: const EdgeInsets.only(top: 30, left: 100, right: 100, bottom: 20), //dimensiones del boton "presiona aqui"
              textColor: Colors.white,//color del texto
              color: Colors.blue, //color del boton
              onPressed: (){
                //acción al dar click en el boton
                Scaffold
                .of(context)
                .showSnackBar(SnackBar(content: Text('God of war'),));   
              },
              child: new Text("Presiona aquí"),
            ),
          ),
        ],
      ) //funcion de que si se presiona un boton se muestra algo
    );
  }
}