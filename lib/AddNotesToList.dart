import 'package:firebase_database/firebase_database.dart';
import 'package:notesapp/Notes.dart';
class MessageDao {
  final DatabaseReference _notesRef =
  FirebaseDatabase.instance.ref();
  void saveNotes(NotesOfApp notes) {
    _notesRef.push().set(notes.toJson());
  }
  Query getNotesQuery() {
    return _notesRef;
  }
}