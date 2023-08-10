import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? db;
class DBHelper {
  static const dbName = 'ecobio_data';
  static const dogsTable = 'dog';
  static const id = 'id';
  static const name = 'name';
  static const age = 'age';


  Future<void> createDogTable(Database db) async {
    //const todoSql = '''CREATE TABLE $dogsTable ( $id INTEGER PRIMARY KEY, $name TEXT,  $age TEXT)''';
    const todoSql =  '''CREATE TABLE $dogsTable ($id INTEGER PRIMARY KEY, $name TEXT, $age TEXT)''';
    await db.execute(todoSql);
  }
  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    if (!await Directory(dirname(path)).exists()) {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }
  Future<void> initDatabase() async {
  //  assets/database/ecobio_data.db
    ByteData data = await rootBundle.load(join('assets', '/database/ecobio_data.db'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    final path = await getDatabasePath(dbName);
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
   //    if (kDebugMode) {
   //      print(db);
   //    }
  }
  Future<void> onCreate(Database db, int version) async {
    await createDogTable(db);
  }


  // int _counter = 0;
  //
  // void _incrementCounter() async{
  //   ByteData data = await rootBundle.load(join('assets', 'cities.db'));
  //   List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   print("${bytes}");
  //
  //   // setState(() {
  //   //   // This call to setState tells the Flutter framework that something has
  //   //   // changed in this State, which causes it to rerun the build method below
  //   //   // so that the display can reflect the updated values. If we changed
  //   //   // _counter without calling setState(), then the build method would not be
  //   //   // called again, and so nothing would appear to happen.
  //   //   _counter++;
  //   // });
  // }
}