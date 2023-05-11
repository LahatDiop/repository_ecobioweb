 import 'package:moor/moor.dart';

import '../moor/app_database.dart';



 @UseDao(tables: [Order])

class OrdersDAO extends AppDatabase implements DatabaseConnectionUser{
  late Insertable<Order> entity;





  Future<List<Order>> getAllOrder() => select(orders).get();
  Stream<List<Order>> watchAllOrder() => select(orders).watch();
  Future insertNewOrder(Order order) => into(orders).insert(order);
  Future updateOrder(Order order) => update(orders).replace(order) ;
  Future deleteOrder(Order order) => delete(orders).delete(order);

  Future<Order> getorderById(int id){
    return (select(orders)..where((tbl) => orders.id.equals(id))).getSingle();
  }

  Future < void > deleteOrderById(int id) {
    return (delete(orders)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future < void > updateOrderById(int id) {
    return (update(orders)..where((tbl) =>tbl.id.equals(id))).replace(entity);
  }


}

// @OrdersDao(tables: [Orders])
// class OrdersDAO extends DatabaseAccessor < AppDatabase> with _$OrdersDAOMixin implements IUser {
//   OrdersDAO(AppDatabasedb): super(db);
//
//   @override
//   Future < int > updateUser(UsersCompanion usr) {
//     return into(users)
//         .insert(usr);
//   }
//
//   @override
//   SingleSelectable < User > getUserData(int id) => select(users).
//       .where((usr) => usr.id.equals(id));
//
//   @override
//   Future < void > deleteUserRecord(UsersCompanion user) async {
//   return await deleteUserById(user.id.value);
//   }
//
//   @override
//   Future < void > deleteUserById(int id) {
//   return (delete(users).
//       .where((tbl) => tbl.id.equals(id)))
//       .go();
//   }
// }