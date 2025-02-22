class NoteForListing {
  //atributos de la clase
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  NoteForListing(
      //constructor de la clase
      {this.noteID,
      this.noteTitle,
      this.createDateTime,
      this.latestEditDateTime});

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    return NoteForListing(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      createDateTime: DateTime.parse(item['createDateTime']),
      //si el resultados no es null, entonces transforma la fecha al formato deseado, de lo contrario guarda null
      latestEditDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
