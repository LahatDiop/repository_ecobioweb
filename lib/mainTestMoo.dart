//
// import 'package:flutter/material.dart';
//
// import 'roots/trunk/branches/database/dao/orders_dao.dart';
// import 'roots/trunk/branches/database/moor/app_database.dart';
//
//
// void main() {
//
//   // ConnectionPostgresSql connection = const ConnectionPostgresSql();
//   //  connection.createState().initDatabaseConnection();
//
//   // connectionDB();
//   //SessionManager sessionManager = SessionManager();
//
//   //AppDatabase appDatabase= AppDatabase();
//
//  // Future database = sessionManager.get("databaseConnection");
//
//   // var schemaversion = appDatabase.schemaVersion;
//   // var userFonction = appDatabase.userFonction;
//   // var allTables = appDatabase.allTables;
//   // var allSchemaEntities =appDatabase.allSchemaEntities;
//   // var connection = appDatabase.connection;
//
//   runApp(const Orders());
// }
//
// class Orders extends StatefulWidget {
//   const Orders({super.key});
//
//   @override
//   _OrdersState createState() => _OrdersState();
// }
//
// class _OrdersState extends State<Orders> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Orders List"),
//         ),
//         body: const SingleChildScrollView(child: NewOrder()),
//       ),
//     );
//   }
// }
//
// class NewOrder extends StatefulWidget {
//   const NewOrder({super.key});
//
//   @override
//   _NewOrderState createState() => _NewOrderState();
// }
//
// class _NewOrderState extends State<NewOrder> {
//   TextEditingController productNameController = TextEditingController();
//
//   TextEditingController priceController = TextEditingController();
//
//   late String id =priceController.toString() ;
//   bool isloading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         TextField(
//           decoration: const InputDecoration(hintText: 'Product Name'),
//           keyboardType: TextInputType.text,
//           controller: productNameController,
//         ),
//         TextField(
//           decoration: const InputDecoration(hintText: 'Product Price'),
//           keyboardType: TextInputType.number,
//           controller: priceController,
//         ),
//         ElevatedButton (
//           onPressed: () {
//             setState(() {
//               // AppDatabase().insertNewOrder(Order(
//               OrdersDAO().insertNewOrder(Order(
//                 id:int.parse(priceController.text),
//                 price: priceController.text,
//                 productName: productNameController.text,
//                 completed: true,
//               ));
//
//             //  priceController.clear();
//              // productNameController.clear();
//             });
//           },
//          // color: Colors.green,
//           child: const Text("Place Order"),
//         ),
//         SizedBox(
//           height: 700,
//           width: double.infinity,
//           child: StreamBuilder(
//             stream: OrdersDAO().watchAllOrder(),
//             builder: (context, AsyncSnapshot<List<Order>> snapshot) {
//               return ListView.builder(
//                 itemBuilder: (_, index) {
//                   return Card(
//                     color: Colors.blue,
//                     child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 20,
//                           child: Text('${index + 1 } '),
//                         ),
//
//                         // title: Text(snapshot.data![index].productName),
//                         title: const Text('Nome'),
//                         subtitle: Text("Categoria. ${snapshot.data?[index].price}"),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete_outline),
//                           onPressed: () {
//                             setState(() {
//                               OrdersDAO().deleteOrder(snapshot.data![index]);
//                             });
//                           },
//                           color: Colors.red,
//                         )),
//                   );
//                 },
//                 itemCount: snapshot.data?.length,
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
//
