//
// import 'package:ecobioweb/database/moor/orders.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
//
// import '../../dao/orders_dao.dart';
// import 'package:ecobioweb/database/moor/app_database.dart';
// import 'package:ecobioweb/database/moor/Home/new_orders_input.dart';
// // Moor works by source gen. This file will all the generated code.
//
//
//
//
// class HomePageMoor extends StatefulWidget{
//   const HomePageMoor({super.key});
//   @override
//   _HomePageMoorState createState() => _HomePageMoorState();
//
// }
//
// class _HomePageMoorState extends State<HomePageMoor>{
//   @override
//   Widget build(BuildContext context) {
//     // Key key;
//     return Scaffold(
//       appBar: AppBar(title: const Text('test Moor'),
//     ),
//       body: Column(
//       children: <Widget> [
//         Expanded(child: _buildTaskList(context)),
//        const NewOrdersInput(),
//       ],
//     ),
//     );
//   }
//
//   //NewOrdersInput() {}
// }
//
// StreamBuilder<List<Order>> _buildTaskList(BuildContext context) {
//   final database = Provider.of<OrdersDAO>(context);
//   return StreamBuilder(
//     stream: database.watchAllOrder(),
//     builder: (context, AsyncSnapshot<List<Order>> snapshot) {
//      // final tasks = snapshot.data??List();
//       return ListView.builder(
//         itemCount: tasks =snapshot.data ?? List();.length,
//         itemBuilder: (_, index) {
//           final itemTask = tasks[index];
//           return _buildListItem(itemTask, database);
//         },
//       );
//     },
//   );
// }
//
// // Widget _buildListItem(Order itemTask, OrdersDAO database) {
// //   return Slidable(
// //     actionPane: SlidableDrawerActionPane(),
// //     secondaryActions: <Widget>[
// //       IconSlideAction(
// //         caption: 'Delete',
// //         color: Colors.red,
// //         icon: Icons.delete,
// //         onTap: () => database.deleteOrder(itemTask),
// //       )
// //     ],
// //     child: CheckboxListTile(
// //       title: Text(itemTask.productName),
// //       subtitle: Text(itemTask.dueDate?.toString() ?? 'No date'),
// //       value: itemTask.completed,
// //       onChanged: (newValue) {
// //         database.updateOrder(itemTask.copyWith(completed: newValue));
// //       },
// //     ),
// //   );
// // }
//
// Widget _buildListItem(Order itemOrder, OrdersDAO database){
//
//   return Slidable(
//     // Specify a key if the Slidable is dismissible.
//     key: const ValueKey(0),
//
//     // The start action pane is the one at the left or the top side.
//     startActionPane: ActionPane(
//       // A motion is a widget used to control how the pane animates.
//       motion: const ScrollMotion(),
//
//       // A pane can dismiss the Slidable.
//       dismissible: DismissiblePane(onDismissed: () {}),
//
//       // All actions are defined in the children parameter.
//       children: const [
//         // A SlidableAction can have an icon and/or a label.
//         SlidableAction(
//           onPressed: doNothing,
//           backgroundColor: Color(0xFFFE4A49),
//           foregroundColor: Colors.white,
//           icon: Icons.delete,
//           label: 'Delete',
//         //  onTap: () => database.deleteOrder(itemOrder),
//         ),
//         SlidableAction(
//           onPressed: doNothing,
//           backgroundColor: Color(0xFF21B7CA),
//           foregroundColor: Colors.white,
//           icon: Icons.share,
//           label: 'Share',
//         ),
//       ],
//     ),
//
//     // The end action pane is the one at the right or the bottom side.
//     endActionPane: const ActionPane(
//       motion: ScrollMotion(),
//       children: [
//         SlidableAction(
//           // An action can be bigger than the others.
//           flex: 2,
//           onPressed: doNothing,
//           backgroundColor: Color(0xFF7BC043),
//           foregroundColor: Colors.white,
//           icon: Icons.archive,
//           label: 'Archive',
//         ),
//         SlidableAction(
//           onPressed: doNothing,
//           backgroundColor: Color(0xFF0392CF),
//           foregroundColor: Colors.white,
//           icon: Icons.save,
//           label: 'Save',
//         ),
//         SlidableAction(
//           onPressed: doNothing,
//           backgroundColor: Color(0xFF0392CF),
//           foregroundColor: Colors.white,
//           icon: Icons.update,
//           label: 'Update',
//         ),
//       ],
//     ),
//
//     // The child of the Slidable is what the user sees when the
//     // component is not dragged.
//    // child: const ListTile(title: Text('Slide me')),
//
//     child: CheckboxListTile(
//       title: Text(itemOrder.productName),
//       subtitle: Text(itemOrder.dueDate?.toString() ?? 'No date'),
//       value: itemOrder.completed,
//       onChanged: (newValue) {
//         database.updateOrder(itemOrder.copyWith(completed: newValue));
//       },
//     ),
//   );
//
// // Widget _buildListItem3(Order itemOrder, OrdersDAO database){
// //   return Slidable(
// //     key: const ValueKey(0),
// //
// //     startActionPane: const ActionPane(
// //         motion: ScrollMotion(),
// //          dismissible: DismissiblePane(onDismissed: () {}),
// //       children: [
// //         // A SlidableAction can have an icon and/or a label.
// //         SlidableAction(
// //           onPressed: doNothing,
// //           backgroundColor: Color(0xFFFE4A49),
// //           foregroundColor: Colors.white,
// //           icon: Icons.delete,
// //           label: 'Delete',
// //         ),
// //         SlidableAction(
// //           onPressed: doNothing,
// //           backgroundColor: Color(0xFF21B7CA),
// //           foregroundColor: Colors.white,
// //           icon: Icons.share,
// //           label: 'Share',
// //         ),
// //       ],
// //     ),
// //     // The end action pane is the one at the right or the bottom side.
// //     endActionPane: ActionPane(
// //       motion: const ScrollMotion(),
// //       dismissible: DismissiblePane(onDismissed: () {}),
// //       children: const [
// //         SlidableAction(
// //           // An action can be bigger than the others.
// //           flex: 2,
// //           onPressed: doNothing,
// //           backgroundColor: Color(0xFF7BC043),
// //           foregroundColor: Colors.white,
// //           icon: Icons.delete,
// //           label: 'Delete',
// //         ),
// //         SlidableAction(
// //           onPressed: doNothing,
// //           backgroundColor: Color(0xFF0392CF),
// //           foregroundColor: Colors.white,
// //           icon: Icons.save,
// //           label: 'Save',
// //         ),
// //       ],
// //     ),
// //
// //     // The child of the Slidable is what the user sees when the
// //     // component is not dragged.
// //     child: const ListTile(title: Text('Slide me')),
// //   );
// // }
//
// // Widget _buildListItem2(Order itemOrder, OrdersDAO database){
// //   return Slidable(
// //     startActionPane: SlidableDrawerActionPane(),
// //     child:<Widget>[
// //       IconSliderAction(
// //         caption:'Delete',
// //         icon:Icons.delete,
// //         onTap:() => database.deleteOrder(itemOrder),
// //       )
// //     ],
// //     child: CheckboxListTile(
// //       title: Text(itemOrder.productName),
// //       subtitle:Text(itemOrder.price.toString()?? ''),
// //       value: itemOrder.completed,
// //       onChanged: (newValue){
// //         database.updateOrder(itemOrder.copyWith(completed:newValue));
// //       },
// //     ),
// //   );
// // }
//
//
//
//   // return Slidable(
//   //     actionPane: SlidableDrawerActionPane(),
//   //     secondaryActions:<Widget>[
//   //     IconSliderAction(
//   //       caption:'Delete',
//   //       icon:Icons.delete,
//   //       onTap:() => database.deleteOrder(itemOrder),
//   //     )
//   //   ],
//   //   child: CheckboxListTile(
//   //     title: Text(itemOrder.productName),
//   //     subtitle:Text(itemOrder.price.toString()?? ''),
//   //     value: itemOrder.completed,
//   //     onChanged: (newValue){
//   //       database.updateOrder(itemOrder.copyWith(completed:newValue));
//   //     },
//   //   ),
//   // );
//
//
// }
//
//
// void doNothing(BuildContext context) {
//
// }
