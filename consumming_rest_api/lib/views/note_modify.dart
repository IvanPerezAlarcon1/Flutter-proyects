import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String noteID;
  NoteModify({this.noteID});
  bool get isEditing => noteID != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing
            ? 'Editar nota'
            : 'Crear nota'), //título de la pantalla al presionar el botón "+"
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Título de la nota",
              ),
            ),
            Container(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Contenido de la nota",
              ),
            ),
            Container(
              height: 16.0,
            ),
            SizedBox(
              width: double
                  .infinity, //el botón ocupa todo el espacio disponible del contenedor en donde se encuentra
              height: 35,
              child: RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (isEditing) {
                    //actualiza la nota en la API
                  } else {
                    //Crea la nota en la API
                  }
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
