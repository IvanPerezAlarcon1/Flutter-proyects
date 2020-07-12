import 'package:consumming_rest_api/models/note.dart';
import 'package:consumming_rest_api/services/notes_services.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

class NoteModify extends StatefulWidget {
  final String noteID;
  NoteModify({this.noteID});

  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteID != null;

  NotesService get notesService => GetIt.I<NotesService>();
  String errorMessage;
  Note note;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    notesService.getNote(widget.noteID).then((response) {
      setState(() {
        _isLoading = false;
      });
      if (response.error) {
        errorMessage = response.errorMessage ??
            'Un error ha ocurrido, mensaje de note_modify.dart';
      }
      note = response.data;
      _titleController.text = note.noteTitle;
      _contentController.text = note.noteContent;
    });
    super.initState();
  }

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
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: "Título de la nota",
                    ),
                  ),
                  Container(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _contentController,
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
