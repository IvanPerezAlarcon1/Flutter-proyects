import 'package:consumming_rest_api/models/api_responses.dart';
import 'package:consumming_rest_api/services/notes_services.dart';
import 'package:consumming_rest_api/views/note_modify.dart';
import 'package:consumming_rest_api/views/note_delete.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:consumming_rest_api/models/note_for_listing.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.I<NotesService>();

  //propiedad que representa la respuesta de la API
  APIResponse<List<NoteForListing>> _apiResponse;
  //variable que indica que hay un proceso de carga
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}'; //VER COMO PONER HORA Y MINUTOS
  }

  @override
  void initState() {
    _fetchNotes(); //método buscar notas
    super.initState();
  }

  _fetchNotes() async {
    //muestra el load indicator
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await service.getNotesList();

    setState(() {
      //esconde el load indicator
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Listado de notas")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Al presionar el botón "+" aparece en la pantalla, nos dirigimos a la ventana de crear nota
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NoteModify()))
                .then((_) {
              _fetchNotes(); //al agregar una nota, el listado de la pantalla principal se actualiza automaticamente.
            });
          },
          child: Icon(Icons.add),
        ),
        body: Builder(builder: (_) {
          if (_isLoading) {
            //si esta cargando se mostrara el texto de carga centrado
            return Center(child: CircularProgressIndicator());
          }

          if (_apiResponse.error) {
            //si hay un error se mustra el mensaje
            return Center(child: Text(_apiResponse.errorMessage));
          }

          return ListView.separated(
            //_isLoading ? CircularProgressIndicator() : ListView.separated( //muestra un indicador circular de progreso mientras se cargan las notas

            //lista en la pantalla
            separatorBuilder: (_, __) => Divider(
                height: 1, color: Colors.green), //separador de cada elemento
            itemBuilder: (_, index) {
              return Dismissible(
                //key, es un parámetro requerido por el widget Dismissible
                key: ValueKey(_apiResponse.data[index].noteID),
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
                    _apiResponse.data[index]
                        .noteTitle, //titulo de la nota según la estructura de la clase NoteForListing
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text(
                      'Última modificación: ${formatDateTime(_apiResponse.data[index].createDateTime)}'), //fecha con el formato indicado en formatDateTime
                  //'Última modificación: ${_apiResponse.data[index].latestEditDateTime.day}/${_apiResponse.data[index].latestEditDateTime.month}/${_apiResponse.data[index].latestEditDateTime.year}'), //texto secundario de cada casilla
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (_) => NoteModify(
                                noteID: _apiResponse.data[index].noteID)))
                        .then((data) {
                      _fetchNotes();
                    });
                  },
                ),
              );
            },
            //itemCount: 30,
            itemCount: _apiResponse.data
                .length, //contador de elementos de la lista, en este caso se repite las veces indicada el titulo y el subtitulo
          );
        }));
  }
}
