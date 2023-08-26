import 'package:drift/drift.dart';

class Note extends Table {
  int id;
  String title;
  String details;

  Note(this.id, this.title, this.details);
}