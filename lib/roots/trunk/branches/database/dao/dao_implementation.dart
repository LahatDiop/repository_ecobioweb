//
//
// import 'dart:collection';
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:logging_manager/logging_manager.dart';
//
// import '../moor/user_data.dart';
// import 'orders_dao.dart';
// //import 'orders_dao.dart';
//
//
// Map<int, String> listObjectDAO = <int,String>{1:"OrdersDAO", 2:"UserFonction"};
//
// Map<int,Object> listSingle = <int, Object>{1:OrdersDAO(), 2:UserFonction};
//
// Map<int,String> myHashmap = HashMap();
//
// Map<String, Object> params  =HashMap();
//
// List<String> list = <String> [];
//
//  class DaoImplementation {
//
//    final loggingManager = LoggingManager(logger: Logger('DaoImplementation'));
//
//    Map<int, String> ObjectsDAO = Map<int,String>.from(listObjectDAO);
//    Map<int, Object> obgDAO      = Map<int,Object>.fromEntries(listSingle as Iterable<MapEntry<int, Object>>);
//
//
//
//
//    DaoImplementation(OrdersDAO ordersDAO,UserFonction userFonction);
//
//    // DaoImplementation(String objectName, Object objectValue){
//    //   add(objectName, objectValue);
//    // }
//
//    // add Oject
//    void add(String objectName, Object objectValuer){
//        if(objectValuer == null){
//          return;
//        }
//        params.putIfAbsent(objectName, () => objectValuer);
//   }
//
// // bool check param into the hashmap
//   bool hasValue(String paramName){
//      return params.containsKey(paramName);
//    }
//
//
// // Get paramName from Hasmap
//   void getparamName(String objectName, Object objectValuer){
//        return params.forEach((key, value) {
//          debugPrint('$key: $value');
//      });
//
//    }
//
//
//
//  //   String[]  getParamName(){
//  //     return params.keySet().toArray(new String[] {});
//  // }
//  //
//  //    String[] getParameterName() {
//  //     return params.keySet().toArray(new String[] {});
//  //   }
//
// }
//
// class TableList {
//   // static var tables=OrdersDAO,
//   // UserFonctionDAO;
//   //
//
//   static const List<Type> tables=[
//    // OrdersDAO,
//    // UserFonctionDAO,
//   ];
//
// }
//
// class DaoList{
//    static const List<Type> daos=[
//    //  OrdersDAO,
//     // UserFonctionDAO,
//    ];
// }
//
//
//
