// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// ignore_for_file: type=lint
class $NoteTable extends Note with TableInfo<$NoteTable, Note>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$NoteTable(this.attachedDatabase, [this._alias]);
@override
List<GeneratedColumn> get $columns => [];
@override
String get aliasedName => _alias ?? 'note';
@override
 String get actualTableName => 'note';
@override
VerificationContext validateIntegrity(Insertable<Note> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => const {};@override Note map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Note();
}
@override
$NoteTable createAlias(String alias) {
return $NoteTable(attachedDatabase, alias);}}class Note extends DataClass implements Insertable<Note> {
const Note({});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};return map; 
}
NoteCompanion toCompanion(bool nullToAbsent) {
return NoteCompanion();
}
factory Note.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Note();}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
};}Note copyWith({}) => Note();@override
String toString() {return (StringBuffer('Note(')..write(')')).toString();}
@override
 int get hashCode => identityHashCode(this);@override
bool operator ==(Object other) => identical(this, other) || (other is Note);
}class NoteCompanion extends UpdateCompanion<Note> {
final Value<int> rowid;
const NoteCompanion({this.rowid = const Value.absent(),});
NoteCompanion.insert({this.rowid = const Value.absent(),});
static Insertable<Note> custom({Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (rowid != null)'rowid': rowid,});
}NoteCompanion copyWith({Value<int>? rowid}) {
return NoteCompanion(rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (rowid.present) {map['rowid'] = Variable<int>(rowid.value);}return map; 
}
@override
String toString() {return (StringBuffer('NoteCompanion(')..write('rowid: $rowid')..write(')')).toString();}
}
abstract class _$NoteDatabase extends GeneratedDatabase{
_$NoteDatabase(QueryExecutor e): super(e);
late final $NoteTable note = $NoteTable(this);
@override
Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
@override
List<DatabaseSchemaEntity> get allSchemaEntities => [note];
}
