


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget{
  @override
_CartScreenState  createState()=>_CartScreenState();
  
}

class _CartScreenState extends State<CartScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[createHeader(), createSubTitle(), createCartList(), footer(context)],
          );
        },
      ),
    );
  }

  createHeader() {}

  createSubTitle() {}

  createCartList() {}

  footer(BuildContext context) {}
}
    