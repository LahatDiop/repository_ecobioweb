// /*import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:ecobio/database/objectbox/item_model.dart';
// import 'package:ecobio/database/objectbox/order_model.dart';
// import 'package:objectbox/objectbox.dart';
// import 'package:quiver/strings.dart';
//
// import '../../locatization/components/appLocalizations.dart';
//
// class OrderScreen extends StatefulWidget {
//   // TO 13: Add parameter for OrderModel and OrderBox
//   final OrderModel? orderModel;
//   final Box<OrderModel> orderBox;
//
//   const OrderScreen({Key? key, this.orderModel, required this.orderBox})
//       : super(key: key);
//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }
//
// class _OrderScreenState extends State<OrderScreen> {
//   // TO 13: create a list with dishes -->ItemModel
//   final items = [
//     ItemModel(itemCount: 0, itemName: 'Pizza Salami'),
//     ItemModel(itemCount: 0, itemName: 'Pizza Margarita'),
//     ItemModel(itemCount: 0, itemName: 'Spaguetti'),
//     ItemModel(itemCount: 0, itemName: 'Lasagne'),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           AppLocalizations.translate('localization').toString(),
//           style: const TextStyle(color: Colors.black),
//         ),
//         leading: const BackButton(
//           color: Colors.black,
//         ),
//       ),
//       body: Column(children: [
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: ListView.separated(
//               scrollDirection: Axis.vertical,
//               itemCount: items.length,
//               separatorBuilder: (context, index) =>
//                   const Divider(height: 1, color: Colors.green),
//               itemBuilder: (BuildContext context, int index) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       items[index].itemName,
//                       //AppLocalizations.translate('countryLocation').toString(),
//                       style: const TextStyle(fontSize: 25),
//                       textAlign: TextAlign.center,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             items[index].itemCount++;
//                             saveOrderModel(index);
//                           },
//                           child: const Icon(Icons.add),
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Text(
//                         items[index].itemCount.toString(),
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (items[index].itemCount == 0) {
//                           return;
//                         }
//                         items[index].itemCount--;
//                         saveOrderModel(index);
//                       },
//                       child: const Icon(Icons.remove),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         //18 : set order true on orderModel
//                         //19  : save the orderModel into the orderBox
//                         widget.orderModel?.ordered = true;
//                         Navigator.pop(context);
//                       },
//                       child: const Icon(Icons.remove),
//                     )
//                   ],
//                 );
//               }),
//         ),
//       ]),
//     );
//   }
//
//   //openStore() {}
//
//   /*void dispose() {
//     // TO 10: close the store
//     super.dispose();
//     _store?.close();
//   }
// */
//   void saveOrderModel(int index) {
// //15 : 15 Add the item into the orderModel items
// //16 :save the orderModel in the orderBox
// //17 : Call set state to update the newest count
//     widget.orderModel?.items.add(items[index]);
//     widget.orderBox.put(widget.orderModel!);
//     setState(() {});
//   }
// }
// */