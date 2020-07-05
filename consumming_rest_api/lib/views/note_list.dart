import 'package:consumming_rest_api/models/note_for_listing.dart';
import 'package:consumming_rest_api/views/note_modify.dart';
import 'package:consumming_rest_api/views/note_delete.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new NoteForListing(
        noteID: "1",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 1"),
    new NoteForListing(
        noteID: "2",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 2"),
    new NoteForListing(
        noteID: "3",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List of notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Al presionar el botón "+" aparece en la pantalla, nos dirigimos a la ventana de crear nota
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        //lista en la pantalla
        separatorBuilder: (_, __) => Divider(
            height: 1, color: Colors.green), //separador de cada elemento
        itemBuilder: (_, index) {
          return Dismissible(
            //key, es un parámetro requerido por el widget Dismissible
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,

            onDismissed: (direction) {},

            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context, builder: (_) => NoteDelete());
              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: ListTile(
              title: Text(
                //texto principal de cada casilla
                notes[index]
                    .noteTitle, //titulo de la nota según la estructura de la clase NoteForListing
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                  'Última modificación: ${notes[index].latestEditDateTime.day}/${notes[index].latestEditDateTime.month}/${notes[index].latestEditDateTime.year}'), //texto secundario de cada casilla
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NoteModify(noteID: notes[index].noteID)));
              },
            ),
          );
        },
        //itemCount: 30,
        itemCount: notes
            .length, //contador de elementos de la lista, en este caso se repite las veces indicada el titulo y el subtitulo
      ),
    );
  }
}
