
import '../components/appLocalizations.dart';
import 'package:flutter/material.dart';

//void main() => runApp(Translation());

class Translation extends StatefulWidget {
  const Translation({Key? key}) : super(key: key);

  //String? search = getName(context);

  @override
  _TranslationState createState() => _TranslationState();

  static String? search(BuildContext context) {
    return AppLocalizations.translate('search').toString();
  }

  static String? last_pick(BuildContext context) {
    return AppLocalizations.translate('last_pick').toString();
  }

  static String? search_point(BuildContext context) {
    return AppLocalizations.translate('search_point').toString();
  }
}

class _TranslationState extends State<Translation> {
  late String search;

  // String search = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  getName(BuildContext context) {
    search = AppLocalizations.translate('search').toString();
    return search;
  }
}
