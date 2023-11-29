//  import 'dart:async';
//
// import 'package:drift/src/runtime/api/runtime_api.dart';
// import 'package:drift/src/runtime/executor/stream_queries.dart';
// import 'package:ecobioweb/roots/trunk/branches/database/moor/orders.dart';
// import 'package:moor/moor.dart';
//
// import '../moor/app_database.dart';
//
//
//  //non @UseDao(tables: [Order])
//
//  //class OrdersDAO extends AppDatabase implements DatabaseConnectionUser{
//   class OrdersDAO extends AppDatabase {
// // class OrdersDAO extends AppDatabase {
//   late Insertable<Orders> entity;
//
//   @override
//   String $expandVar(int start, int amount) {
//     // TODO: implement $expandVar
//     throw UnimplementedError();
//   }
//
//   @override
//   GenerationContext $write(Component component, {bool? hasMultipleTables, int? startIndex}) {
//     // TODO: implement $write
//     throw UnimplementedError();
//   }
//
//   @override
//   GenerationContext $writeInsertable(TableInfo<Table, dynamic> table, Insertable insertable, {int? startIndex}) {
//     // TODO: implement $writeInsertable
//     throw UnimplementedError();
//   }
//
//   @override
//   T alias<T extends Table, D>(TableInfo<T, D> table, String alias) {
//     // TODO: implement alias
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement attachedDatabase
//   GeneratedDatabase get attachedDatabase => throw UnimplementedError();
//
//   @override
//   Future<void> batch(_BatchRunner runInBatch) {
//     // TODO: implement batch
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement connection
//   DatabaseConnection get connection => throw UnimplementedError();
//
//   @override
//   Stream<List<Map<String, Object?>>> createStream(QueryStreamFetcher stmt) {
//     // TODO: implement createStream
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<int> customInsert(String query, {List<Variable> variables = const [], Set<TableInfo<Table, dynamic>>? updates}) {
//     // TODO: implement customInsert
//     throw UnimplementedError();
//   }
//
//   @override
//   Selectable<QueryRow> customSelect(String query, {List<Variable> variables = const [], Set<ResultSetImplementation> readsFrom = const {}}) {
//     // TODO: implement customSelect
//     throw UnimplementedError();
//   }
//
//   @override
//   Selectable<QueryRow> customSelectQuery(String query, {List<Variable> variables = const [], Set<ResultSetImplementation> readsFrom = const {}}) {
//     // TODO: implement customSelectQuery
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> customStatement(String statement, [List? args]) {
//     // TODO: implement customStatement
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<int> customUpdate(String query, {List<Variable> variables = const [], Set<TableInfo<Table, dynamic>>? updates, UpdateKind? updateKind}) {
//     // TODO: implement customUpdate
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<QueryRow>> customWriteReturning(String query, {List<Variable> variables = const [], Set<TableInfo<Table, dynamic>>? updates, UpdateKind? updateKind}) {
//     // TODO: implement customWriteReturning
//     throw UnimplementedError();
//   }
//
//   @override
//   DeleteStatement<T, D> delete<T extends Table, D>(TableInfo<T, D> table) {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<T> doWhenOpened<T>(FutureOr<T> Function(QueryExecutor e) fn) {
//     // TODO: implement doWhenOpened
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement executor
//   QueryExecutor get executor => throw UnimplementedError();
//
//   @override
//   TableOrViewOperations<T, D> from<T extends HasResultSet, D>(ResultSetImplementation<T, D> table) {
//     // TODO: implement from
//     throw UnimplementedError();
//   }
//
//   @override
//   InsertStatement<T, D> into<T extends Table, D>(TableInfo<T, D> table) {
//     // TODO: implement into
//     throw UnimplementedError();
//   }
//
//   @override
//   void markTablesUpdated(Iterable<TableInfo<Table, dynamic>> tables) {
//     // TODO: implement markTablesUpdated
//   }
//
//   @override
//   void notifyUpdates(Set<TableUpdate> updates) {
//     // TODO: implement notifyUpdates
//   }
//
//   @override
//   // TODO: implement resolvedEngine
//   DatabaseConnectionUser get resolvedEngine => throw UnimplementedError();
//
//   @override
//   SimpleSelectStatement<T, R> select<T extends HasResultSet, R>(ResultSetImplementation<T, R> table, {bool distinct = false}) {
//     // TODO: implement select
//     throw UnimplementedError();
//   }
//
//   @override
//   JoinedSelectStatement<T, R> selectOnly<T extends HasResultSet, R>(ResultSetImplementation<T, R> table, {bool distinct = false, bool includeJoinedTableColumns = true}) {
//     // TODO: implement selectOnly
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement streamQueries
//   StreamQueryStore get streamQueries => throw UnimplementedError();
//
//   @override
//   Stream<Set<TableUpdate>> tableUpdates([TableUpdateQuery query = const TableUpdateQuery.any()]) {
//     // TODO: implement tableUpdates
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<T> transaction<T>(Future<T> Function() action) {
//     // TODO: implement transaction
//     throw UnimplementedError();
//   }
//
//   @override
//   // TODO: implement typeSystem
//   SqlTypeSystem get typeSystem => throw UnimplementedError();
//
//   @override
//   UpdateStatement<Tbl, R> update<Tbl extends Table, R>(TableInfo<Tbl, R> table) {
//     // TODO: implement update
//     throw UnimplementedError();
//   }
//
//   // Future<List<Order>> getAllOrder() => select(orders).get();
//   // Stream<List<Order>> watchAllOrder() => select(orders).watch();
//   // Future insertNewOrder(Order order) => into(orders).insert(order);
//   // Future updateOrder(Order order) => update(orders).replace(order) ;
//   // Future deleteOrder(Order order) => delete(orders).delete(order);
//   //
//   // Future<Order> getorderById(int id){
//   //   return (select(orders)..where((tbl) => orders.id.equals(id))).getSingle();
//   // }
//   //
//   // Future < void > deleteOrderById(int id) {
//   //   return (delete(orders)..where((tbl) => tbl.id.equals(id))).go();
//   // }
//   //
//   // Future < void > updateOrderById(int id) {
//   //   return (update(orders)..where((tbl) =>tbl.id.equals(id))).replace(entity);
//   // }
//
//
// }
//
// mixin _BatchRunner {
// }
//
//
//
// // @OrdersDao(tables: [Orders])
// // class OrdersDAO extends DatabaseAccessor < AppDatabase> with _$OrdersDAOMixin implements IUser {
// //   OrdersDAO(AppDatabasedb): super(db);
// //
// //   @override
// //   Future < int > updateUser(UsersCompanion usr) {
// //     return into(users)
// //         .insert(usr);
// //   }
// //
// //   @override
// //   SingleSelectable < User > getUserData(int id) => select(users).
// //       .where((usr) => usr.id.equals(id));
// //
// //   @override
// //   Future < void > deleteUserRecord(UsersCompanion user) async {
// //   return await deleteUserById(user.id.value);
// //   }
// //
// //   @override
// //   Future < void > deleteUserById(int id) {
// //   return (delete(users).
// //       .where((tbl) => tbl.id.equals(id)))
// //       .go();
// //   }
// // }