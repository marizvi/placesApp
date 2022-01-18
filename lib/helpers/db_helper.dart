import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath(); //sqflite.dart

    //if not already exist then will create new one
    // places.dp will be created at path dbPath
    //sqflite.dart
    return openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)');
    }, version: 1);
    //we are going to fetch and create on a database refering to version:1
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final sqlDb = await DBHelper.database();
    await sqlDb.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    //means if we are trying to insert data for an id which is already present, then that
    //entry will be replaced
  }

  static Future<List<Map<String, Object?>>> getData(String table) async {
    final sqlDb = await DBHelper.database();
    return sqlDb.query(table);
    //hover on .query to know the return type of future
  }
}
