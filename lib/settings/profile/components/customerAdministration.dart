import 'package:flutter/material.dart';

class CustomAdministration extends StatelessWidget {
  String? description;
  String? title;
  String? subtitle;
  Widget? thumbnail;
  Icon? trailing;
  String? favorite;
  String? username; // cognome nome
  String? email;
  String? password;
  String? statusProducer; // produttore
  String? statusCustomer; // cliente
  String? messages;
  bool? enabled;
  String? publishDate;

  CustomAdministration({
    Key? key,
    this.description,
    this.favorite,
    this.username,
    this.email,
    this.password,
    this.statusCustomer,
    this.statusProducer,
    this.messages,
    this.enabled,
    this.thumbnail,
    this.publishDate,
    this.title,
    this.subtitle,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
