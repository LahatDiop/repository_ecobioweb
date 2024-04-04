// import 'dart:io';
//
// import 'package:ecobioweb/roots/trunk/branches/managements/users/provider/users_provider.dart';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// Database? db;
// class DBHelper {
//   static const dbName = 'ecobio_data';
//   static const dogsTable = 'dog';
//   static const id = 'id';
//   static const name = 'name';
//   static const age = 'age';
//
//    UsersProvider usersProvider= UsersProvider();
//   ///
//   // Create a private instance of the class
//   static final DBHelper _dbhelper = DBHelper._internal();
//  String DB_name = "ecobio.db";
//  ///  String DB_name = "ecobio.sqlite";
//   static  int DATABASE_VERSION = 1;
//
//   // Create an empty private named constructor
//   DBHelper._internal();
//
//   // Use the factory to always return the same instance
//   factory DBHelper() {
//     return _dbhelper;
//   }
//
//   static Database? _db;
//
//   // Future<Database?> get db async {
//   //   _db ??= await usersProvider!.initializeDb();
//   //   return _db;
//   // }
//   // Future<Database> get db async {
//   //   _db ??= await usersProvider.initializeDb();
//   //   return _db!;
//   // }
//
//    Future<Database> get db async {
//     if (_db == null) {
//       _db = await initializeDb();
//     }
//     return _db!;
//   }
//
//   /// PARAMS DATABASE name, version, and create
//   Future<Database> initializeDb() async {
//   //  Directory dir = await getApplicationDocumentsDirectory();
//     // String path = dir.path + "todos.db";
//     // String path = dir.path + "ecobio.db";
//     //String path = "${dir.path}\\ecobio.sqlite";
//
//     // Get a location using getDatabasesPath
//     var databasesPath = await getDatabasesPath();
//
//     String path = join(databasesPath, 'ecobio.db');
//     // open the database
//   //  Database dataBase = await openDatabase(path, version: DBHelper.DATABASE_VERSION, );
//     Database dataBase  = await openDatabase(path, version: DBHelper.DATABASE_VERSION,
//         onCreate:(Database db,int version) async{
//
//           const sql =  '''CREATE IF NOT EXISTS TABLE $dogsTable ($id INTEGER PRIMARY KEY, $name TEXT, $age TEXT)''';
//           await db.execute(sql);
//     });
//     return dataBase;
//   }
//
//
//   Future<void> createDogTable(Database db) async {
//     //const todoSql = '''CREATE TABLE $dogsTable ( $id INTEGER PRIMARY KEY, $name TEXT,  $age TEXT)''';
//     const todoSql =  '''CREATE TABLE $dogsTable ($id INTEGER PRIMARY KEY, $name TEXT, $age TEXT)''';
//     await db.execute(todoSql);
//   }
//   Future<String> getDatabasePath(String dbName) async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, dbName);
//     if (!await Directory(dirname(path)).exists()) {
//       await Directory(dirname(path)).create(recursive: true);
//     }
//     return path;
//   }
//   Future<Database> initDatabase() async {
//   //  assets/database/ecobio_data.db
//     ByteData data = await rootBundle.load(join('assets', '/database/ecobio_data.sqlite'));
//   //   ByteData data = await rootBundle.load(join('assets', '/database/ecobio_data.db'));
//     List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//
//     final path = await getDatabasePath(dbName);
//     var db = await openDatabase(path, version: 1, onCreate: onCreate);
//     print(db);
//     return  db;
//    //    if (kDebugMode) {
//    //      print(db);
//    //    }
//   }
//   Future<void> onCreate(Database db, int version) async {
//     await createDogTable(db);
//   }
//
//
//   // int _counter = 0;
//   //
//   // void _incrementCounter() async{
//   //   ByteData data = await rootBundle.load(join('assets', 'cities.db'));
//   //   List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//   //   print("${bytes}");
//   //
//   //   // setState(() {
//   //   //   // This call to setState tells the Flutter framework that something has
//   //   //   // changed in this State, which causes it to rerun the build method below
//   //   //   // so that the display can reflect the updated values. If we changed
//   //   //   // _counter without calling setState(), then the build method would not be
//   //   //   // called again, and so nothing would appear to happen.
//   //   //   _counter++;
//   //   // });
//   // }
// }