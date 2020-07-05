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
}
