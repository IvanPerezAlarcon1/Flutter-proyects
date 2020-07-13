import 'package:consumming_rest_api/models/api_responses.dart';
import 'package:consumming_rest_api/models/note.dart';
import 'package:consumming_rest_api/models/note_for_listing.dart';
import 'package:consumming_rest_api/models/note_insert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {
    "apiKey": "aa7deca2-cf49-4618-8abb-09881bf02dee",
    "Content-Type": "application/json"
  };
  //convertiremos las respuestas del body de la api de formato json, a objetos de una lista de tipo NoteForListing
  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    //devuelve el listado de notas almacenadas en la api
    return http.get(API + "/notes", headers: headers).then((data) {
      if (data.statusCode == 200) {
        //respuesta satisfactoria de los datos
        final jsonData =
            json.decode(data.body); //convierte el header en una lista de maps
        final notes =
            <NoteForListing>[]; //ponemos todos los elementos en una lista
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(
              item)); //agrega las notas a la lista notas mediante un for
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

  Future<APIResponse<Note>> getNote(String noteID) {
    //devuelve una nota según su noteID
    return http.get(API + "/notes/" + noteID, headers: headers).then((data) {
      //se hace el request
      if (data.statusCode == 200) {
        //aqui aparece la respuesta
        //respuesta satisfactoria de los datos
        final jsonData =
            json.decode(data.body); //convierte el header en una lista de maps
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      //retorna un mensaje de error en caso de ocurrir uno
      return APIResponse<Note>(
          error: true, errorMessage: 'Un error ha ocurrido');
    })
        //para posibles errores luego de enviar los parametros a la API
        .catchError((_) => APIResponse<Note>(
            error: true, errorMessage: 'Un error ha ocurrido'));
  }

  Future<APIResponse<bool>> createNote(NoteInsert item) {
    return http
        .post(API + "/notes",
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      //se hace el request
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      //retorna un mensaje de error en caso de ocurrir uno
      return APIResponse<bool>(
          error: true,
          errorMessage: 'Un error ha ocurrido, archivo: notes_services.dart');
    })
        //para posibles errores luego de enviar los parametros a la API
        .catchError((_) => APIResponse<bool>(
            error: true,
            errorMessage:
                'Un error ha ocurrido, archivo: notes_services.dart'));
  }
}
