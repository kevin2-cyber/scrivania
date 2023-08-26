import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'note.g.dart';

@DataClassName('Note')
class Note extends Table {
  ColumnBuilder<int> get id => integer().autoIncrement();
  ColumnBuilder<String> get title => text().withLength(min: 6, max: 32);
  ColumnBuilder<String> get content => text().named('body');
}

@DriftDatabase(tables: [Note])
class NoteDatabase extends _$NoteDatabase {

  NoteDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}