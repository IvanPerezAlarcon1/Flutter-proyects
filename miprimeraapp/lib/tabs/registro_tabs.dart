import 'package:flutter/material.dart';

class RegistroTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Registro Cliente"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save),
          onPressed: (){}//aqui ingresamos lo que hace el apretar el boton,
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(
                hintText:"Nombre",
              ),
            ),
          ),

          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText:"Celular",
              ),
            ),
          ),

          new ListTile(
            leading: const Icon(Icons.mail),
            title: new TextField(
              decoration: new InputDecoration(
                hintText:"Correo",
              ),
            ),
          ),

          const Divider(//es una linea divisoria, pero se le pueden dar mas propiedades
            height: 1.0,
          ),

          new ListTile(
            leading: const Icon(Icons.group),
            title: new Text('Grupo flutter'),
            subtitle: new Text('Flutter...'),
          ),

          new ListTile(
            leading: const Icon(Icons.today),
            title: new Text('Cumpleaños'),
            subtitle: const Text('7 de Junio de 1997'),
          ),

        ],
      ),
    );
  }
}