import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskLocalSqfliteStorage {
  const TaskLocalSqfliteStorage();

  static const taskTableKey = "tasks";
  static late final Future<Database> database;

  static Future<void> init() async {
    String pathDirectory = await getDatabasesPath();
    String path = join(pathDirectory, taskTableKey);

    database = openDatabase(path, onCreate: _onCreate, version: 1);
  }

  static FutureOr<void> _onCreate(Database database, int version) async {
    return database.execute(
      ''' CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,
      taskName TEXT,
      note TEXT,
      date TEXT,
      remind INTEGER,
      color INTEGER,
      priority TEXT,
      plannedStartTime TEXT,
      plannedEndTime TEXT,
      startTime TEXT,
      endTime TEXT)''',
    );
  }

  Future<void> insert(Map<String, Object?> data) async {
    final db = await database;
    await db.insert(
      taskTableKey,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(
    Map<String, Object?> data,
    int id,
  ) async {
    final db = await database;

    await db.update(
      taskTableKey,
      data,
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<List<Map<String, Object?>>> readAll() async {
    final db = await database;

    return await db.query(taskTableKey);
  }

  Future<void> delete(int id) async {
    final db = await database;

    db.delete(
      taskTableKey,
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<Map<String, Object?>> read(int id) async {
    final db = await database;

    final tasks = await db.query(
      taskTableKey,
      where: "id=?",
      whereArgs: [id],
    );
    return tasks[0];
  }

  Future<List<Map<String, Object?>>> readFilteredData(DateTime time) async {
    final db = await database;
    final year = time.year.toString();
    final month = time.month.toString().padLeft(2, "0");
    final day = time.day.toString().padLeft(2, "0");

    return await db.rawQuery(
        "SELECT * FROM `$taskTableKey`  WHERE `date` LIKE '%$year-$month-$day%'");
  }
}
