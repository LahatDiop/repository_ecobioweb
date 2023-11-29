import 'package:flutter/material.dart';

class _CustomLocalization extends StatelessWidget {
  final String description;
  final String country; // paese
  final String lang; // lingua
  final String location; // zone
  final String info;
  final String ruler;
  final bool enabled;
  final Widget thumbnail;
  final String publishDate;

  const _CustomLocalization({
    Key? key,
    required this.description,
    required this.country,
    required this.lang,
    required this.location,
    required this.info,
    required this.ruler,
    required this.enabled,
    required this.thumbnail,
    required this.publishDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
