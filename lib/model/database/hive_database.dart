
import 'package:hive/hive.dart';
import 'package:scrivania/core/constants.dart';

import '../entity/note.dart';

class HiveDatabase {
  // reference our hive box
  final _myBox = Hive.box(Constants.noteDatabase);

  // load notes
  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];

    // if there's existing notes, return that, otherwise return empty list
    if(_myBox.get(Constants.allNotes) != null) {
      List<dynamic> savedNotes = _myBox.get(Constants.allNotes);
      for(int i = 0; i < savedNotes.length; i++) {
        // create individual note
        Note individualNote = Note(id: savedNotes[i][0], title: savedNotes[i][1], content: savedNotes[i][2], modifiedTime: DateTime.now());
        // add to list
        savedNotesFormatted.add(individualNote);
      }
    } else {
      // default notes
      for(int i = 0; i < sampleNotes.length; i++) {
        savedNotesFormatted.add(sampleNotes[i]);
      }

    }
    return savedNotesFormatted;
  }

  // save notes
  void savedNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [];

    // each note has an id, a title, content and a timestamp
    for(var note in allNotes) {
      int id = note.id;
      String title = note.title;
      String content = note.content;
      DateTime timestamp = note.modifiedTime;
      allNotesFormatted.add([id, title, content, timestamp]);
    }
    
    _myBox.put(Constants.allNotes, allNotesFormatted);
  }
}