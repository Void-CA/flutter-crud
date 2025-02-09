import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation {
  Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'notes.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT)');
    }, version: 1);
  }
}
