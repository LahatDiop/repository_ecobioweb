import 'package:flutter/material.dart';

List<Widget> getChildrenWithSeperatorProduct(

    {required List<Widget> widgets,
      Widget? seperator,
       bool addToLastChild = true
    }) {

  List<Widget> children = [];
  if (widgets.isNotEmpty) {
    children.add(seperator!);

    for (int i = 0; i < widgets.length; i++) {
      children.add(widgets[i]);

      if (widgets.length - i == 1) {
        if (addToLastChild) {
          children.add(seperator);
        }
      } else {
        children.add(seperator);
      }
    }
  }
  return children;
}
