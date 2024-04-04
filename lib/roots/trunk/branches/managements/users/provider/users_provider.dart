import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:ecobioweb/roots/trunk/branches/database/sqlLite/connection_db_sqlite_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:thread/thread.dart';

import '../../../database/sqlLite/database_helper.dart';
import '../../../database/sqlLite/db_helper_sqlite.dart';
import '../components/users.dart';

import 'package:http/http.dart' as http;

/// ==============================  INIT ADD DATA USERS FROM CART MAP CART   =============================================

class UsersProvider with ChangeNotifier , DiagnosticableTreeMixin {

  bool _disposed = false;


  // void initState(){
  //
  //   fetchItems().whenComplete(() => print("UsersScreen"));
  //
  // }
  //
  // Future<void>  fetchItems() async {
  //   final loadDataUsers=getUsersList();
  // }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  ///MAP
   final Map<String, Users> _usersItem= {};

   Map<String,Users> get usersItems{

     return {..._usersItem};
   }
  
   /// LIST USERS
     List<Users> _users =[];
     final List<Users> users  =[];

      List<Users> get getUsers{
        return _users;
      }

  ///USERS OBJECT
      Users? _user;


     Users? get user => _user;

  /// LIST USERS FILTER SEARCH
  static List<Users> _usersDataFilter =[];
  final List<Users> usersDataFilter  =[];

   List<Users> get getUserDataFilter{
    return _usersDataFilter;
  }

  static set setUsersDataFilter(List<Users> users) {
    _usersDataFilter = users;
  }

  /// THREAD LOADER USER

  void loadUsersFromThread() async{
     final thread=Thread((events) {
       events.on('data', (String data) async{
           await Future.delayed(Duration(seconds: 1));
           events.emit('result', '<Computed>$data');

           // thread.on('result', (String data) => print(data));

           // thread.emit('data', 'Hello world!');
           // thread.emit('data', 'Wow!');
           //
           // print(await thread.compute(() => 'Hello world!'));
           // print(await thread.computeWith(123, (int data) => 'Wow $data'))
       });
     });

     thread.on('result', (String data) => print(data));

     thread.emit('data', 'Hello world!');
     thread.emit('data', 'Wow!');

     print(await thread.compute(() => 'Hello world!'));
     print(await thread.computeWith(123, (int data) => 'Wow $data'));

    // [Output]
    // Hello world!
    // Wow 123

    // <Computed> Hello world!
    // <Computed> Wow!
  }


  /// THREAD ISOLATE FLUTTER  LOADER LIST USERS

  Future<List<Users>> getUsersOfThreadIsolate()async{

     //TODO add implemtation assets/json/users.json'
    final String jsonString= await rootBundle.loadString('assets/json/users.json'); //

    final List<Users> users =await Isolate.run<List<Users>>((){

        final List<Object?> usersData=jsonDecode(jsonString) as List<Object?>;

      return usersData.cast<Map<String, Object?>>().map(Users.fromJson).toList();
    });
    return users;

  }


  void setUpdateUserDataFilter(List<Users> usersDataFilter) {
   /// _usersDataFilter.clear();
    _usersDataFilter.addAll(usersDataFilter);
    notifyListeners();

  }

 getUsersList(){
   for(Users  users in  listFilesUsers){
     _users.add(users);
     /// _usersDataFilter.add(users);
     _usersItem.putIfAbsent(users.code.toString(), () => users);
   }

 }

// // Create a private instance of the class
//   static final DBHelper _dbhelper = DBHelper._internal();
//   String DB_name = "user_data.db";
//   static const int DATABASE_VERSION = 2;
//
//   // Create an empty private named constructor
//   DBHelper._internal();
//
// // Use the factory to always return the same instance
//   factory DBHelper() {
//     return _dbhelper;
//   }
//
//   static Database _db;

  // Future<Database> get db async {
  //   if (_db == null) {
  //     _db = await initializeDb();
  //   }
  //   return _db;
  // }

  ///POST
  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return json.decode((response.body));
    } else {
      throw Exception('Failed to load : Methode fetchPosts');
    }
  }

  ///
  Future<Map<String,dynamic>> fetchUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      return json.decode((response.body));
    } else {
      throw Exception('Failed to load : Methode fetchUser');
    }
  }


  //https://stackoverflow.com/questions/72163002/how-can-i-use-a-variable-of-json-data-in-flutter-not-a-listview
  // body: Center(
  // child: FutureBuilder(
  // future: Future.wait([fetchPosts(), fetchUser()]),
  // builder: (context, snapshot) {
  // if (snapshot.hasError) {
  // return Text('${snapshot.error}');
  // } else if (snapshot.hasData) {
  // final posts = (snapshot.data as List)[0] as List<dynamic>;
  // final user = (snapshot.data as List)[1];
  // final userId = user['id'];
  // final post = posts.firstWhere((post) => post['userId'] == userId);
  // return Text('$post');
  // } else {
  // return const Text('Loading ...');
  // }
  // }
  // )
  // ),

  static String tableName = 'users';
  static String id = 'id';
  static String userDataJson='user_data_json';
  static String dateInsert='date_insert';
  static String tablePk='users_pk';


  DatabaseHelper dbHelper=DatabaseHelper();

  ///https://stackoverflow.com/questions/59043102/how-to-do-crud-operations-on-multiple-tables-in-sqlite-database-in-flutter
/// PARAMS DATABASE name, version, and create
   Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    // String path = dir.path + "todos.db";
    String path = dir.path + "ecobio.db";
    //String path = dir.path + "ecobio.sqlite";
  ///  var dataBase = await openDatabase(path, version: 1, );
    var dataBase = await openDatabase(path, version:1, onCreate: _createDb);
    return dataBase;
  }

/// CREATE TABLE
  void _createDb(Database db, int newVersion) async {
    await db.execute(
          "CREATE TABLE $tableName($id INTEGER PRIMARY KEY, $userDataJson JSON,"
            );
  }

  // DBMS: SQLite (ver. 3.43.0)
  // Case sensitivity: plain=mixed, delimited=mixed
  // Driver: SQLite JDBC (ver. 3.43.0.0, JDBC4.2)
  //
  // Ping: 44 ms
  // void _createDb(Database db, int newVersion) async {
  //   await db.execute(
  //       "CREATE TABLE $tableName($id INTEGER PRIMARY KEY, $colUsername TEXT," +
  //           "$colPassword TEXT, $colEmail TEXT, $colFirstName TEXT,"
  //               "$colLastName TEXT, $colDate TEXT, $colMonthId INTEGER,"
  //               " $colSubtract BOOLEAN, $colMonthSalary DOUBLE, $colLogDetails TEXT,"
  //               " $colEBI DOUBLE, $colEBF DOUBLE, $colTBI DOUBLE, $colTBF DOUBLE, "
  //               " $colLBI DOUBLE, $colLBF DOUBLE, $colSBI DOUBLE, $colSBF DOUBLE,"
  //               " $colSOBI DOUBLE, $colSOBF DOUBLE)");
  //
  // }



  /// Create and insert table
  static Future<Database> getDB() async {

     // DatabaseHelper databaseHelper = DatabaseHelper;

    if (Platform.isWindows || Platform.isLinux) {
      // Initialize FFI
      sqfliteFfiInit();


      // Change the default factory. On iOS/Android, if not using `sqlite_flutter_lib` you can forget
      // this step, it will use the sqlite version available on the system.
      databaseFactory = databaseFactoryFfi;
    }

    var result= openDatabase(join(await getDatabasesPath(), DatabaseHelper.dbName),
        readOnly: true,
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE users (id INTEGER PRIMARY KEY,user_data_json ANY);",
            // "CREATE TABLE $tableName($id INTEGER PRIMARY KEY CONSTRAINT $tablePk primary key autoincrement, $userDataJson JSON,$dateInsert ANY"
        ),
        version:  DatabaseHelper.version);

    return result;
  }

  Future<int> addUserData(Users data, String usersDataJson) async {

    Database? db = await getDB();
    var result = await db.insert(tableName, data.toJson());
    return result;
  }
  /// ----------------------------------------------------------------



  //https://stackoverflow.com/questions/54097326/how-to-do-a-database-insert-with-sqflite-in-flutter
  // // row to insert
  // Map<String, dynamic> row = {
  //   DatabaseHelper.columnName : 'Bob',
  //   DatabaseHelper.columnAge  : 23
  // };
  //
  // // do the insert and get the id of the inserted row
  // int id = await db.insert(DatabaseHelper.table, row);

 /// E:\Lahat\Projet App\AppBio\workspace_ecobio\ecobioweb\.dart_tool\sqflite_common_ffi\databases\ecobio.db
  static Future<int> addNewUser(Users user,Map<String,dynamic> usersData) async {
    final db = await getDB();
     Users userNew=Users.fromJson(usersData);

    String  userDataJson =jsonEncode(usersData);

    String creationDate=  DateTime.timestamp().toString();

    String modifiedDate=  DateTime.timestamp().toString();

    String? name =user.name;

    ///OK if table is autoincrement , is not necessary to implement id
    var result =db.rawInsert('INSERT INTO $tableName (name,users_data_json,creation_date,modified_date) VALUES(?,?,?,?)',[name,userDataJson,creationDate,modifiedDate]);



    // do the insert and get the id of the inserted row
   /// var result= await db.insert(tableName, row);
    // // return await db.insert(tableName, user.toJson(),
    ///  var result =db.insert('users', usersData);


   ///OK   var result =db.rawInsert('INSERT INTO $tableName (id, user_data_json) VALUES(?,?)',[1, userDataJson]);

     return result;
  }

  static Future<int> addUser(Users user,Map<String,dynamic> usersData) async {
    final db = await getDB();
    Users userNew=Users.fromJson(usersData);
    // return await db.insert(tableName, user.toJson(),
    return await db.insert(tableName,userNew.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUsers(Users user) async {
    final db = await getDB();
    return await db.update("Users", user.toJson(),
        where: 'id = ?',
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteUsers(Users user) async {
    final db = await getDB();
    return await db.delete(
      "Users",
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<List<Users>?> getAllUsers() async {
    final db = await getDB();

    final List<Map<String, dynamic>> maps = await db.query("users");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Users.fromJson(maps[index]));
  }

 /// ----------------------------------------------------------------

  Future<List> getDatas() async {
    Database? db = await getDB();
    // Database? dbConnection = await connection.execute;
    var result =
    await db!.rawQuery("SELECT * FROM $tableName order by $id ASC");
    return result;
  }

  Future<int?> getCount() async {
    Database? db = await getDB();
    var result = Sqflite.firstIntValue(
        await db!.rawQuery("SELECT COUNT (*) FROM $tableName"));
    return result;
  }

  Future<int> updateData(Users data) async {
    Database? db = await getDB();
    var result = await db!.update(tableName, data.toJson(), where: "$id=?", whereArgs: [data.id]);
    return result;
  }

  Future<int> deleteData(int id) async {
    int result;
    Database? db = await getDB();
    //Database? db = await DatabaseHelper.getDB();
    result = await db!.rawDelete("DELETE FROM $tableName WHERE $id=$id");
    return result;
    notifyListeners();
  }

  Future<List<Users>> getUsersItemsList() async {

    final String response =
    await rootBundle.loadString('assets/json/home.json');
    final data = await json.decode(response);

    // if(data is Map){
    //   _mapGroupListHomeItems=data.cast<String, usersItems>();
    // }

     for(Users  users in  listFilesUsers){
       _users.add(users);
     }

    _users ;
    /// dataLoader =data['homeItemsGroups'].map((DATA)=> usersItems.fromJsonFactory(data)).toList();
    Map <String,dynamic> dataMap=data;

    /// items;
    // groupsHome.clear();

    Map<String, List<dynamic>> getListItemsFromDataMap=dataMap.map((key, value) => MapEntry(key, List.castFrom(value)));

    getListItemsFromDataMap.forEach((key, value) {
      ///_users.addAll(Users.fromJsonList(value));
    });

    Map<String, String> stringQueryParameters=dataMap.map((key, value) => MapEntry(key, value!.toString()));

    stringQueryParameters.forEach((key, value) {

    });
    ///  notifyListeners();
    return _users;

  }



   
   
   
}
