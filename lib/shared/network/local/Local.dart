

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static late Database database ;

  static init() async{
    var databasePath = await getDatabasesPath();
    String path = "${databasePath}demo.db";
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE database (id INTEGER PRIMARY KEY, size TEXT, counter TEXT)'
        );
      }
      );
      await database.transaction((txn) async {
        await txn.rawInsert(
          'INSERT INTO database(size, counter) VALUES(25, 0)'
        );
      });
  }

  static void update(String size, String counter) async {
    await database.rawUpdate(
      'UPDATE database SET size="${size}", counter="${counter}" WHERE database_id = 1'
    );
  }

  static Future<List<Map>> getData() async {
    List<Map> list = await database.rawQuery('SELECT * FROM database');
    return list;
  }
}
