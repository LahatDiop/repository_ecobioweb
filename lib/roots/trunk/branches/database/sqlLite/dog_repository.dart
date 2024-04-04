//
//
// import 'package:sqflite/sqflite.dart';
//
//
// // import '../local/db/db_sqllite_services.dart';
// // import '../local/db/db_test.dart';
// import '../../../../../test/dog_test/dog.dart';
// import 'connection_sqlite.dart';
// import 'db_helper_sqlite.dart';
//
// class ArticleRepository {
//   get database => null;
//
//
//   Future<void> deleteDogTest(int id) async {
//     // Get a reference to the database.
//     // final db = database;
//     Database database = ConnectionSqLite().connectionParam;
//
//     // Remove the Dog from the database.
//     await database.delete(
//       'dogs',  // name table
//       // Use a `where` clause to delete a specific dog.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//   }
//
//
//   static Future<void> addDog(Dog dog) async {
//     await db?.insert(DBHelper.dogsTable, dog.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   // static Future<void> addArticle(Dog dog) async {
//   //   const sql = '''INSERT INTO ${DBHelper.dogsTable}(
//   //                   ${DBHelper.id},
//   //                   ${DBHelper.name},
//   //                   ${DBHelper.age})
//   //                 VALUES (?,?,?)
//   //               ''';
//   //   List<dynamic> params = [dog.id, dog.name, dog.age];
//   //   await db?.rawInsert(sql, params);
//   // }
//
//
//   Future<void> updateDog(Dog dog) async {
//     // Get a reference to the database.
//     final db = database;
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
//     final db = database;
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
//     final db = database;
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
// }