
import 'package:hive/hive.dart';

import '../entity/note.dart';

class HiveDatabase {
  // reference our hive box
  final _myBox = Hive.box('note_database');

  // load notes
  List<Note> loadNotes() {
    return [];
  }
}