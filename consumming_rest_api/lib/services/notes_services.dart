import 'package:consumming_rest_api/models/api_responses.dart';
import 'package:consumming_rest_api/models/note_for_listing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {
    "apiKey": "aa7deca2-cf49-4618-8abb-09881bf02dee",
  };
  //convertiremos las respuestas del body de la api de formato json, a objetos de una lista de tipo NoteForListing
  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + "/notes", headers: headers).then((data) {
      if (data.statusCode == 200) {
        //respuesta satisfactoria de los datos
        final jsonData =
            json.decode(data.body); //convierte el header en una lista de maps
        final notes =
            <NoteForListing>[]; //ponemos todos los elementos en una lista
        for (var item in jsonData) {
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            //si el resultados no es null, entonces transforma la fecha al formato deseado, de lo contrario guarda null
            latestEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note); //agrega las notas a la lista notas mediante un for
        }
        //retorna la respuesta a la api
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      //retorna un mensaje de error en caso de ocurrir uno
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'Un error ha ocurrido');
    })
        //para posibles errores luego de enviar los parametros a la API
        .catchError((_) => APIResponse<List<NoteForListing>>(
            error: true, errorMessage: 'Un error ha ocurrido'));
  }
}
