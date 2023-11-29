// import 'package:moor_flutter/moor_flutter.dart';
// //part 'moor_database.g.dart';
//
// //part 'UserFonction.g.dart';
//
//
//
// @UseMoor(tables: [UserFonction])
//
// class UserFonction extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get username => text()();
//   TextColumn get password => text()();
//   TextColumn get email => text()();
//   TextColumn get telephone => text()();
//   BlobColumn get thumbnail => blob().nullable()();
//   DateTimeColumn get registerDate => dateTime().nullable()();
//   ColumnBuilder<DateTime> get dateOfBirth=>dateTime().named('dateOfBirth');
//  // DateTimeColumn get dateOfBirth=>dateTime().named('date_of_birth');
//   BoolColumn get isApproved => boolean().withDefault(const Constant(false))();
//
// }
//
//
// //
// // class AppDatabase extends _$AppDatabase {
// //   AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite", logStatements: true));
// //   //AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: "db.postgres", logStatements: true));
// //   int get schemaVersion => 1;
// //
// //
// //   Future<List<UserData>> getAllOrder() => select(users).get();
// //   Stream<List<UserData>> watchAllOrder() => select(users).watch();
// //   Future insertNewOrder(UserData user) => into(users).insert(userData);
// //   Future deleteOrder(UserData user) => delete(users).delete(userData);
// // //void updateOrder(Order order) => update(orders).writeStartPart(ctx);
// //
// //
// // }
