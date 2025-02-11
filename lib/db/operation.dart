import 'package:crud/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'notes.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT)');
    }, version: 1);
  }

  static Future<void> insert(Note note) async {
    Database db = await _openDB();
    await db.insert('notes', note.toMap());
  }

  static Future<List<Note>> getNotes() async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> notesMap = await db.query("notes");
    for (var note in notesMap) {
      print(note);
    }
    return List.generate(notesMap.length, (i) {
      return Note(
        id: notesMap[i]['id'],
        title: notesMap[i]['title'],
        content: notesMap[i]['content'],
      );
    });
  }
}
