import 'package:flutter/material.dart';
import 'package:miprimeraapp/tabs/ayuda_tabs.dart';
import 'package:miprimeraapp/tabs/inicio_tabs.dart';
import 'package:miprimeraapp/tabs/lugares_tabs.dart';
import 'package:miprimeraapp/tabs/registro_tabs.dart';

void main() => runApp(MYAPP());

class MYAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //barra de iconos
    final TabController = new DefaultTabController(
      length: 4, //numero de iconos o tabs de la barra de navegacion
      child: new Scaffold( //se arma la barra de navegacion, el esqueleto
        appBar: new AppBar(
          //creamos los iconos y les damos un nombre
          title: new Text('Navegación por tabs'),
          bottom: new TabBar(indicatorColor: Colors.deepPurple,tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home),text: "Inicio",), //lo que se muestra por pantalla como nombre del icono
            //se crean los iconos,Icons.home es el icono de inicio
            new Tab(icon: new Icon(Icons.contacts),text: "Registro",),
            new Tab(icon: new Icon(Icons.place),text: "Lugares",),
            new Tab(icon: new Icon(Icons.help),text: "Ayuda",)  
          ]),//bottom, es parte de abajo de la barra, si quisieramos la parte superior seria TOP
          //le damos un colo a la linea para cuando nos desplcemos en bottom
        ),

        //cuerpo de la barra de navegación
        //se llaman los métodos, estos deben ir de la mano con el nro de iconos creados
        body: new TabBarView(children: <Widget>[
          new InicioTabs(), //este metodo se define en el archivo inicio_tabs.dart
          new RegistroTabs(), //este metodo se define en el archivo registro_tabs.dart
          new LugaresTabs(),
          new AyudaTabs()
          ],
        ),
      ),
    );

    return new MaterialApp(
      title: 'Tabs con flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabController,
    );
  }
}