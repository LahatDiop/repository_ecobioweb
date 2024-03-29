import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConnectionSqLite{

  Database connectionParam = getDatabasesConnection();

  static getDatabasesConnection() async{
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      // join(await getDatabasesPath(), 'doggie_database.db'),
      join(await getDatabasesPath(), '../../assets/database/ecobio_data.db'),
      // When the database is first created, create a table to store dogs.
     onCreate: (db, version) {
      //   // Run the CREATE TABLE statement on the database.
       return db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
         );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}