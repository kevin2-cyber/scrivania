import 'package:flutter/material.dart';
import 'package:scrivania/model/database/hive_database.dart';

import '../model/entity/note.dart';

class NoteProvider extends ChangeNotifier {

  // hive database
  final db = HiveDatabase();

  // overall list of notes
  List<Note> allNotes = [];

  // initialize the list
  void initNotes() {
    allNotes = db.loadNotes();
  }

  // get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

  // add a new note
  void addNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  // update note
  void updateNote(Note note, String title, String content) {
    // go through list of notes
    for(int i = 0; i < allNotes.length; i++) {
      // find the relevant note
      if(allNotes[i].id == note.id) {
        // replace the title and content
        allNotes[i].title = title;
        allNotes[i].content = content;
        allNotes[i].modifiedTime = DateTime.timestamp();
      }
    }
    notifyListeners();
  }

  // delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}