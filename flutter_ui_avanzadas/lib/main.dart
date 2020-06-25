import 'package:flutter/material.dart';
import 'package:flutter_ui_avanzadas/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //para esconder el banner de debug de la esquina superior derecha
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'sans', //fuente por defecto que queremos, esto luego de importarlas al proyecto en la carpeta assets/fonts/ en el pubspec.yaml

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
