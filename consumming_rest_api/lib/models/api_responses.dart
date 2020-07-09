class APIResponse<T> {
  T data;
  bool error;
  String errorMessage;
  //error es un parametro opcional y por default es false
  APIResponse({this.data, this.errorMessage, this.error = false});
}

//ir al archivo /services/notes_services.dart, para ver como se llama a la API
