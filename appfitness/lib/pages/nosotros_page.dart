import 'package:flutter/material.dart';

//LOS NOMBRES DE LAS CLASES INICIAN EN MAYUSCULAS
class Nosotros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Quienes somos'),
      ),
      body: new Center(
        child: new Text('Un alumno promedio aprendiendo a programar en Dart y Flutter.'),
      ),
    );
  }
}