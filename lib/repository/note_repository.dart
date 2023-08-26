
import '../model/note.dart';

abstract class NoteRepository {
  List<Note>? notes;

  Note createNote(Note note);
  void updateNote(Note note);
  void deleteNote(Note note);
}