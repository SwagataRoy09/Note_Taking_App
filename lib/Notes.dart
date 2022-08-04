class NotesOfApp {
  final String NoteTitle;
  final String NoteContent;
  final DateTime created;
  final DateTime editted;
  final int date;
  NotesOfApp(this.NoteTitle, this.NoteContent,this.created,this.editted,this.date);
  NotesOfApp.fromJson(Map<dynamic, dynamic> json)
      : created = DateTime.parse(json['created']),
        editted = DateTime.parse(json['editted']),
        NoteTitle = json['NoteTitle'] as String,
        NoteContent = json['NoteContent'] as String,
                date=json['date'] ;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  'created' : created.toIso8601String().split('T').first,
  'editted' : editted.toIso8601String().split('T').first,
 'NoteTitle': NoteTitle,
  'NoteContent' :NoteContent,
    'date':DateTime.now().microsecondsSinceEpoch,
  };
}
