import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'note_model.dart';

class DatabaseHelper {


 /// E:\Lahat\Projet App\AppBio\workspace_ecobio\ecobioweb\.dart_tool\sqflite_common_ffi\databases


   static const int version = 1;
   static const String dbName = "ecobio.db";
   /// sqflite datbase instance
   static Database? _database;

   /// gets database instance
   Future<Database> get database async {
     if (_database != null) {
       return _database!;
     }
     _database = await _initializeDB();
     return _database!;
   }

   // static String tableName = 'users';
   // static String id = 'id';
   // static String userDataJson='user_data_json';
   // static String dateInsert='date_insert';
   // static String tablePk='users_pk';

   static Future<Database> _initializeDB() async {

    WidgetsFlutterBinding.ensureInitialized();

     if (Platform.isWindows || Platform.isLinux) {
       // Initialize FFI
       sqfliteFfiInit();


       // Change the default factory. On iOS/Android, if not using `sqlite_flutter_lib` you can forget
       // this step, it will use the sqlite version available on the system.
       databaseFactory = databaseFactoryFfi;
     }



     ///print('createing databse');

  //  return openDatabase(join(await getDatabasesPath(), dbName), version: version);
  ///  CREATE TABLE user_test (id INTEGER PRIMARY KEY,user_data_json TEXT);
    var result =   openDatabase(join(await getDatabasesPath(), dbName),
     onCreate: (db, version) async => await db.execute(
         "create table users( id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, users_data_json JSON,creation_date TEXT,modified_date TEXT);"
         ///" CREATE TABLE users (id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,user_data_json JSON,creation_date TEXT, modified_date TEXT,notes TEXT);"
     ),
         version: version);


    return result;
     // return openDatabase(join(await getDatabasesPath(), _dbName),
     //     onCreate: (db, version) async => await db.execute(
     //         "CREATE TABLE $tableName($id INTEGER PRIMARY KEY CONSTRAINT $tablePk primary key autoincrement, $userDataJson JSON,$dateInsert ANY"
     //     ),
     //     version: _version);
   }

// /// Create and insert table
//     static Future<Database> getDB() async {
//
//      return openDatabase(join(await getDatabasesPath(), _dbName),
//          onCreate: (db, version) async => await db.execute(
//              "CREATE TABLE $tableName($id INTEGER PRIMARY KEY CONSTRAINT $tablePk primary key autoincrement, $userDataJson JSON,$dateInsert ANY"
//          ),
//          version: _version);
//    }
   
   
  // static Future<Database> getDB() async {
  //   return openDatabase(join(await getDatabasesPath(), _dbName),
  //       onCreate: (db, version) async => await db.execute(
  //           "CREATE TABLE Note(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL);"),
  //       version: _version);
  // }


}
