import 'dart:ffi';

import 'package:ecobioweb/database/moor/app_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dao/orders_dao.dart';
// import '../../data/moor_database.dart';

class NewOrdersInput extends StatefulWidget {
  const NewOrdersInput({super.key});

  // const NewOrdersInput({
  //   required Key key,
  // }) : super(key: key);

  @override
  _NewOrdersInputState createState() => _NewOrdersInputState();
}

class _NewOrdersInputState extends State<NewOrdersInput> {
  late DateTime newOrdersDate;
  late TextEditingController controller;


  late int id;
  late String productName;
  late Double price;
  late DateTime dateTime;
  bool completed =false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildInsertTextField(context),
          _buildDeleteTextField(context),
          _buildUpdateTextField(context),

        //  _buildDateButton(context),
        ],
      ),
    );
  }

  Expanded _buildInsertTextField(BuildContext context) {

    return Expanded(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Orders Name'),
        onSubmitted: (inputName) {
          // final database = Provider.of<AppDatabase>(context);
          final database = Provider.of<OrdersDAO>(context);
          final orders = Order(
              id: id,
              price: price.toString(),
              productName: productName,
              completed: completed);

          database.insertNewOrder(orders);
          resetValuesAfterSubmit();
        },
      ),
    );
  }


  Expanded _buildUpdateTextField(BuildContext context) {

    return Expanded(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Orders Name'),
        onSubmitted: (inputName) {
          // final database = Provider.of<AppDatabase>(context);
          final database = Provider.of<OrdersDAO>(context);
          final orders = Order(
              id: id,
              price: price.toString(),
              productName: productName,
              dueDate: dateTime,
              completed: completed);

          database.updateOrder(orders);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  Expanded _buildDeleteTextField(BuildContext context) {

    return Expanded(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Orders Name'),
        onSubmitted: (inputName) {
          // final database = Provider.of<AppDatabase>(context);
          final database = Provider.of<OrdersDAO>(context);
          final orders = Order(
              id: id,
              price: price.toString(),
              productName: productName,
              dueDate:dateTime,
              completed: completed);

          database.updateOrder(orders);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  IconButton _buildDateButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () async {
        // newOrdersDate = (await showDatePicker(
        dateTime = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2050),
        ))!;
      },
    );
  }

  IconButton _buildInsertButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () async {
        newOrdersDate = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2050),
        ))!;
      },
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
     // newTaskDate = null;
      controller.clear();
    });
  }
}