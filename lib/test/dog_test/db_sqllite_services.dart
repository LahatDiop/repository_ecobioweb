import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:postgres/postgres.dart';
import '../../main.dart';
import 'dog.dart';




// Database? database;
String table ='dog';
int version=1;


// open the database
// Database database = await openDatabase(path, version: 1,
// onCreate: (Database db, int version) async {
// // When creating the db, create the table
// await db.c(
// 'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
// });



var databaseConnection = PostgreSQLConnection("localhost", 5432, "ecobio",
    username: "postgres",
    password: "root",
    queryTimeoutInSeconds: 3600,
    timeoutInSeconds: 3600,
    timeZone: 'UTC',
    useSSL: false,
    isUnixSocket: false
);
// Define a function that inserts dogs into the database
Future<void> insertDog() async {

    final connection = PostgreSQLConnection("localhost", 5432, "ecobio",
        username: "postgres",
        password: "root",
        queryTimeoutInSeconds: 3600,
        timeoutInSeconds: 3600,
    );
    await connection.open();
    debugPrint("Database Connected Yes!");

   String $table="ecobio.public.dogs ";

    //Map dataToMap = <String, dynamic>{
    Map<String, dynamic> dataToMap = <String, dynamic>{
      "id": '7',
      "name": "Dog Map",
      "age": "3"
    };
    // object Doc
    Dog dog= const Dog(
      id: 6,
      name: 'Dog TOP',
      age: 3,
    );
   // final dataToObject=dog.toMap;
   // final dataToMap=data;
    //await setData(connection, $table, data);
     await setData(connection, $table, dataToMap);
     await updateData(connection, table, dataToMap);
     await removedData(connection, $table, dataToMap);
     await getDataList(connection, $table, dataToMap);
   // await connection.close();

 }


Future<void> setData(PostgreSQLConnection connection, String table,
    Map<String, dynamic> data) async {
  //ok await connection.execute("INSERT INTO ecobio.information_schema.dogs VALUES ('6','DogHome','8')");
   await connection.execute('INSERT INTO $table (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})', substitutionValues:data);
}

Future<void> updateData(PostgreSQLConnection connection, String table,
    Map<String, dynamic> data) async {
 // await connection.execute("UPDATE $table SET (name='Dakar',age='22') WHERE id='5'");
    await connection.execute("UPDATE $table SET name='Dog Sam',age='6' WHERE id=1");
}

Future<void> removedData(PostgreSQLConnection connection, String table, Map<String, dynamic> data) async {
  await connection.execute("DELETE FROM $table WHERE id=7");
}

// A method that retrieves all the dogs from the dogs table.
Future<List<Dog>> getDataList(PostgreSQLConnection connection, String table,
    Map<String, dynamic> dataMap) async {

 //ok final List<Map<String, dynamic>> maps = <Map<String, dynamic>>[];
   List<Map<String, dynamic>> maps =  <Map<String, dynamic>>[];

   List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery("SELECT * FROM $table");

    maps=results;
   // for (var row in results) {
   //   var id = row["t"]!["id"];
   //   var name = row["t"]!["name"];
   //   var age = row["u"]!["age"];
   // }

   // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
    name: maps[i]['name'],
    age: maps[i]['age'],

    );
  });


}

class TypesHelper {
  static int toInt(num val) {
    try {
      if (val == null) {
        return 0;
      }
      if (val is int) {
        return val;
      } else {
        return val.toInt();
      }
    } catch (error) {
      print('Error');
      return 0;
    }
  }

// Define a function that inserts dogs into the database
//   Future<void> insertDog2(Dog dog) async {
//     // Get a reference to the database.
//     //final db = await database;
//     final db = await connection.createState().initDatabaseConnection();
//     // Insert the Dog into the correct table. You might also specify the
//     // `conflictAlgorithm` to use in case the same dog is inserted twice.
//     //
//     // In this case, replace any previous data.
//     await db.insert(
//       'dogs',
//       dog.toMap(),
//       // conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
}