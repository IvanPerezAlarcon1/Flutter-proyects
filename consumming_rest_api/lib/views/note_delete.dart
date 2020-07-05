import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Advertencia"),
      content: Text("¿Estás seguro de borrar esta nota?"),
      actions: <Widget>[
        FlatButton(
          child: Text("Sí"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
