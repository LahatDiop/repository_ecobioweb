// // import 'dart:io';
// import 'dart:io';
//
// import 'package:logging_manager/logging_manager.dart';
// // import 'package:moor_flutter/moor_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import '../connection_postgreSql.dart';
// import 'orders.dart';
// import 'package:ecobioweb/database/moor/user_data.dart';
// part 'app_database.g.dart';
//
//
//
// ///@UseMoor(tables: [Orders,UserFonction])
//   ///@UseMoor(tables: [])
// ///  @UseMoor(daos: DaoList.daos)
//
// //@UseMoor(tables: TableList.tables, daos: DaoList.daos)
//
//  // @DriftDatabase(
//  //   tables: TableList.tables,
//  //   daos: DaoList.daos,
//  // )
//
// @DriftDatabase(
//   tables: [Orders,UserFonction]
// )
//
//
// /// connection PostgreSql
// // class AppDatabase extends _$AppDatabase {
// //   //AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: "ecobio.sqlite", logStatements: true));
// //    AppDatabase() : super(connection.createState().initDatabaseConnection());
// //   int get schemaVersion => 1;
// //
// // }
//
// /// connection SqlLIte
// class AppDatabase extends _$AppDatabase {
//
//   final loggingManager = LoggingManager(logger: Logger('AppDatabase'));
//
//  //  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: "ecobio.sqlite", logStatements: true));
//  //   AppDatabase() : super(_openConnection());
//   AppDatabase() : super(_openConnectionPostgreSQL());
//   @override
//   int get schemaVersion => 1;
//
// }
//
// LazyDatabase _openConnectionPostgreSQL() {
//   return LazyDatabase(() async {
//     ConnectionPostgresSql connection =const ConnectionPostgresSql();
//
//     return connection.createState().initDatabaseConnection();
//   });
// }
//   LazyDatabase _openConnection() {
//     return LazyDatabase(() async {
//       final dbFolder = await getApplicationDocumentsDirectory();
//       final file = File(path.join(dbFolder.path, 'ecobio.sqlite'));
//       return NativeDatabase(file);
//     });
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //   Future<List<Order>> getAllOrder() => select(orders).get();
// //   Stream<List<Order>> watchAllOrder() => select(orders).watch();
// //   Future insertNewOrder(Order order) => into(orders).insert(order);
// //   Future deleteOrder(Order order) => delete(orders).delete(order);
// //
// // Future<List<UserFonctionData>>? getAllUser() => select(userFonction).get();
// // Stream<List<UserFonctionData>> watchAllUser() => select(userFonction).watch();
// // Future insertNewUser(UserFonctionData user) => into(userFonction).insert(user);
// // Future deleteUser(UserFonctionData user) => delete(userFonction).delete(user);
//
// // LazyDatabase _openConnection() {
// //   return LazyDatabase(() async {
// //     final dbFolder = await getApplicationDocumentsDirectory();
// //     final file = File(p.join(dbFolder.path, 'db.sqlite'));
// //     return VmDatabase(file);
// //   });
// // }
//
//
//
