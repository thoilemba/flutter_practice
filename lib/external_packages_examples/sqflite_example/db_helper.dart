import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static Database? _database;
  final String tableName = 'tasks';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            task TEXT NOT NULL
            completed INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> insertTask(String task) async {
    final Database db = await database;
    await db.insert(
      tableName,
      {'task': task},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

}
