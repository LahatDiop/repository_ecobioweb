//
//
//
// import '../moor/app_database.dart';
//
// class UserFonctionDAO extends AppDatabase{
//
//
//   Future<List<UserFonctionData>>? getAllUser() => select(userFonction).get();
//     Stream<List<UserFonctionData>> watchAllUser() => select(userFonction).watch();
//     Future insertNewUser(UserFonctionData userFonctionData) => into(userFonction).insert(userFonctionData);
//     Future updateNewUser(UserFonctionData userFonctionData) => into(userFonction).insert(userFonctionData);
//     Future deleteUser(UserFonctionData userFonctionData) => delete(userFonction).delete(userFonctionData);
//
//   Future<UserFonctionData> UserFonctionById(int id){
//     return (select(userFonction)..where((tbl) => userFonction.id.equals(id))).getSingle();
//   }
//
//
// }