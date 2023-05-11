// import 'dart:async';
//
// import 'package:collection/collection.dart';
//
// import 'package:flutter/widgets.dart';
// import 'package:path/path.dart';
//
//
// import 'dog.dart';
//
//
//
//
// // Database? database;
// String table ='dog';
// int version=1;
//
//
//
//    class DbConnectionServices{
//
//
//
//      Future<Database?> get database_sqlite async{
//      //  mainSqLite();
//     //   getDatabaseInstance();
//        if(database !=null){
//
//          return database;
//          database=await iniDB();
//        }else{
//
//         getDatabaseInstance();
//        }
//      }
//
//      iniDB() async{
//        var dir = await getDatabasesPath();
//        String path =join(dir,'../../assets/database/ecobio_data.db');
//        var database=await openDatabase(path, version: version, onCreate: (Database db, int version){
//          db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
//
//        },);
//        return database;
//
//      }
//
//      Future<Database?> getDatabaseInstance() async {
//
//
// // Get a location using getDatabasesPath
//        var databasesPath = await getDatabasesPath();
//        String path = join(databasesPath, 'ecobio.db');
//
// // Delete the database
//        await deleteDatabase(path);
//
// // open the database
//        Database database = await openDatabase(path, version: 1,
//            onCreate: (Database db, int version) async {
//              // When creating the db, create the table
//              await db.execute(
//                  'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
//            });
//
// // Insert some records in a transaction
//        await database.transaction((txn) async {
//          int id1 = await txn.rawInsert(
//              'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
//          print('inserted1: $id1');
//          int id2 = await txn.rawInsert(
//              'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
//              ['another name', 12345678, 3.1416]);
//          print('inserted2: $id2');
//        });
//
// // Update some record
//        int? count = await database.rawUpdate(
//            'UPDATE Test SET name = ?, value = ? WHERE name = ?',
//            ['updated name', '9876', 'some name']);
//        print('updated: $count');
//
// // Get the records
//        List<Map> list = await database.rawQuery('SELECT * FROM Test');
//        List<Map> expectedList = [
//          {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
//          {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
//        ];
//        print(list);
//        print(expectedList);
//        assert(const DeepCollectionEquality().equals(list, expectedList));
//
// // Count the records
// //        count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
// //        assert(count == 2);
//
// // Delete a record
// //        count = await database.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
// //        assert(count == 1);
//
// // Close the database
// //        await database.close();
//
//     //    // Get a location using getDatabasesPath
//     //    var databasesPath = await getDatabasesPath();
//     //
//     //    String path = join(databasesPath, 'ecobio_data.db');
//     //   // setDatabasesPath(path);
//     //
//     //
//     //    databaseExists(path);
//     //
//     // //   final String databasesPath = await getDatabasesPath();
//     //   // final String path = join(databasesPath, 'ecobio_data.db');
//     //
//     //   // return await openDatabase(path, version: 1, onCreate: _onCreate);
//     //
//     //   return   await openDatabase(path, version: version, onCreate: (Database db, int version){
//     //      db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
//     //
//     //    },);
//      }
// }
//
// void mainSqLite() async {
//   // Avoid errors caused by flutter upgrade.
//   // Importing 'package:flutter/widgets.dart' is required.
//   WidgetsFlutterBinding.ensureInitialized();
//   // Open the database and store the reference.
//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'ecobio_data.db'),
//     // When the database is first created, create a table to store dogs.
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
//       );
//     },
//     // Set the version. This executes the onCreate function and provides a
//     // path to perform database upgrades and downgrades.
//     version: 1,
//   );
//
//   // Define a function that inserts dogs into the database
//   Future<void> insertDog(Dog dog) async {
//     // Get a reference to the database.
//     //final db = await database;
//     final db = await  connection.createState().initDatabaseConnection();
//     // Insert the Dog into the correct table. You might also specify the
//     // `conflictAlgorithm` to use in case the same dog is inserted twice.
//     //
//     // In this case, replace any previous data.
//     await db.insert(
//       'dogs',
//       dog.toMap(),
//      // conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   // A method that retrieves all the dogs from the dogs table.
//   Future<List<Dog>> dogs() async {
//     // Get a reference to the database.
//   //  final db = await database;
//
//     final db = await  connection.createState().initDatabaseConnection();
//
//     // Query the table for all The Dogs.
//     final List<Map<String, dynamic>> maps = await db.query('dogs');
//
//     // Convert the List<Map<String, dynamic> into a List<Dog>.
//     return List.generate(maps.length, (i) {
//       return Dog(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         age: maps[i]['age'],
//       );
//     });
//   }
//
//   Future<void> updateDog(Dog dog) async {
//     // Get a reference to the database.
//     //final db = await database;
//
//     final db = await  connection.createState().initDatabaseConnection();
//
//     // Update the given Dog.
//     await db.update(
//       'dogs',
//       dog.toMap(),
//       // Ensure that the Dog has a matching id.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [dog.id],
//     );
//   }
//
//   Future<void> deleteDog(int id) async {
//     // Get a reference to the database.
//    // final db = await database;
//     final db = await  connection.createState().initDatabaseConnection();
//
//     // Remove the Dog from the database.
//     await db.delete(
//       'dogs',
//       // Use a `where` clause to delete a specific dog.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//   }
//
//   // Create a Dog and add it to the dogs table
//   var fido = const Dog(
//     id: 0,
//     name: 'Fido',
//     age: 35,
//   );
//
//   await insertDog(fido);
//
//   // Now, use the method above to retrieve all the dogs.
//   print(await dogs()); // Prints a list that include Fido.
//
//   // Update Fido's age and save it to the database.
//   fido = Dog(
//     id: fido.id,
//     name: fido.name,
//     age: fido.age + 7,
//   );
//   await updateDog(fido);
//
//   // Print the updated results.
//   print(await dogs()); // Prints Fido with age 42.
//
//   // Delete Fido from the database.
//   await deleteDog(fido.id);
//
//   // Print the list of dogs (empty).
//   print(await dogs());
// }
//
//
// void conectionDbSqlLite() async {
//   // Avoid errors caused by flutter upgrade.
//   // Importing 'package:flutter/widgets.dart' is required.
//   WidgetsFlutterBinding.ensureInitialized();
//
//
//
//   // Open the database and store the reference.
//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//    // join(await getDatabasesPath(), 'doggie_database.db'),
//      join(await getDatabasesPath(), '../../assets/database/ecobio_data.db'),
//     // When the database is first created, create a table to store dogs.
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
//       );
//     },
//     // Set the version. This executes the onCreate function and provides a
//     // path to perform database upgrades and downgrades.
//     version: 1,
//   );
//
//   // Define a function that inserts dogs into the database
//   Future<void> insertDog(Dog dog) async {
//     // Get a reference to the database.
//     //final db = await database;
//     Database? db = await database;
//
//     // Insert the Dog into the correct table. You might also specify the
//     // `conflictAlgorithm` to use in case the same dog is inserted twice.
//     //
//     // In this case, replace any previous data.
//     await db?.insert(
//       'dogs',
//       dog.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//
//   // Define a function that inserts dogs into the database
//   Future<void> saveDog(Dog dog) async {
//     // Get a reference to the database.
//     //final db = await database;
//     Database? db = await database;
//
//     // Insert the Dog into the correct table. You might also specify the
//        await db?.insert(table, dog.toMap());
//   }
//
//   // A method that retrieves all the dogs from the dogs table.
//   // Future<List<Dog>> dogs() async {
//   //   // Get a reference to the database.
//   //   Database? db = await database;
//   //
//   //   // Query the table for all The Dogs.
//   //  // final List<Map<String, dynamic>> maps = await db?.query('dogs');
//   //   final List<Map<String, dynamic>> maps = await db?.query('dogs');
//   //
//   //   // Convert the List<Map<String, dynamic> into a List<Dog>.
//   //   return List.generate(maps.length, (i) {
//   //     return Dog(
//   //       id: maps[i]['id'],
//   //       name: maps[i]['name'],
//   //       age: maps[i]['age'],
//   //     );
//   //   });
//   // }
//
//  // // A method that retrieves all the dogs from the dogs table.
//  //  Future<List<Dog>> dogs2() async {
//  //    // Get a reference to the database.
//  //    Database db = await database;
//  //
//  //    // Query the table for all The Dogs.
//  //   List<Map<String, dynamic>> maps = await db.query('dogs');
//  //    List<Dog> listDogs =List<Dog>();
//  //
//  //    for(var map in maps){
//  //      listDogs.add(Dog.fromMap(map));
//  //    }
//  //
//  //    return listDogs;
//  //  }
//
//   Future<void> updateDog(Dog dog) async {
//     // Get a reference to the database.
//     final db = await database;
//
//     // Update the given Dog.
//     await db?.update(
//       'dogs',// name table
//       dog.toMap(),
//       // Ensure that the Dog has a matching id.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [dog.id],
//     );
//   }
//
//   Future<void> deleteDog(int id) async {
//     // Get a reference to the database.
//     final db = await database;
//
//     // Remove the Dog from the database.
//     await db?.delete(
//       'dogs',  // name table
//       // Use a `where` clause to delete a specific dog.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//   }
//
// // example 2
//   Future<void> deleteDog2(Dog dog) async {
//     // Get a reference to the database.
//     final db = await database;
//
//     // Remove the Dog from the database.
//     await db?.delete(
//       'dogs',  // name table
//       // Use a `where` clause to delete a specific dog.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [dog.id],
//     );
//   }
//
//   // Create a Dog and add it to the dogs table
//   var fido = const Dog(
//     id: 0,
//     name: 'Fido',
//     age: 35,
//   );
//
//   await insertDog(fido);
//
//   // Now, use the method above to retrieve all the dogs.
//  // print(await dogs()); // Prints a list that include Fido.
//
//   // Update Fido's age and save it to the database.
//   fido = Dog(
//     id: fido.id,
//     name: fido.name,
//     age: fido.age + 7,
//   );
//   await updateDog(fido);
//
//   // Print the updated results.
//  // print(await dogs()); // Prints Fido with age 42.
//
//   // Delete Fido from the database.
//   await deleteDog(fido.id);
//
//   // Print the list of dogs (empty).
// //  print(await dogs());
// }
//
//
//
// // class Dog {
// //   final int id;
// //   final String name;
// //   final int age;
// //
// //   const Dog({
// //     required this.id,
// //     required this.name,
// //     required this.age,
// //   });
// //
// //   // Convert a Dog into a Map. The keys must correspond to the names of the
// //   // columns in the database.
// //   // toMap	permette di trasformare l’oggetto corrente in una Map
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'id': id,
// //       'name': name,
// //       'age': age,
// //     };
// //   }
// //
// //   // Implement toString to make it easier to see information about
// //   // each dog when using the print statement.
// //   //override del metodo toString per ottenere facilmente una descrizione dell’oggetto
// //   @override
// //   String toString() {
// //     return 'Dog{id: $id, name: $name, age: $age}';
// //   }
// //
// //   //fromMapToObject	permette di trasformare una Map composta dalle caratteristiche
// //   // della classe in un oggetto di quella classe
// //   Map<String, dynamic> fromMap(Map<String, dynamic> map) {
// //     return {
// //       'id': id,
// //       'name': name,
// //       'age': age,
// //     };
// //   }
// // }