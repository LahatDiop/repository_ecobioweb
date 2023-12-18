


import 'package:ecobioweb/roots/trunk/branches/search/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class Padded {

 static Widget padded(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }
  Widget paddedTag(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

}