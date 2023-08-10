//Cartella utils
//Questa cartella conterrà le classi di utility specifiche per il progetto.

//Ad esempio: se abbiamo necessità di definirci dei metodi statici per convertire le date fornite da un sistema remoto e visualizzarle, o di definirci dei controlli sulla validità dei campi inseriti, questo è il posto giusto dove inserirli.

import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';
import '../settings/localisation/translation/components/appLocalizations.dart';

//void main() => runApp(Utils());

class Utils extends StatefulWidget {
  const Utils({Key? key}) : super(key: key);

  @override
  _UtilsState createState() => _UtilsState();

  String? languageLocalApp(BuildContext context) {
    return Localizations.localeOf(context).toString();
  }

  static void updateLocalLanguage(
      BuildContext context, String codeLanguageChange) {
    Locale locale;
    String? languageLocal = const Utils().languageLocalApp(context);
    var fromSubtags = const Locale.fromSubtags(languageCode: 'de');
    // final language=await _getLanguage();
    // language change user: if the new linguage is not defaultt change the linguage   APP
    // String? codeLanguageChange = e.code;
    String? codeLangChange = codeLanguageChange;

    if (codeLanguageChange == "DE" && !languageLocal!.endsWith("DE")) {
      //setState(() {
      locale = const Locale('de', 'DE');
      MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'de'));
      // });
    } else if (codeLanguageChange == "IT" && !languageLocal!.endsWith("IT")) {
      //setState(() {
      locale = const Locale('it', 'IT');
      MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'it'));
      // });
    } else if (codeLanguageChange == "FR" && !languageLocal!.endsWith("FR")) {
      // setState(() {
      locale = const Locale('fr', 'FR');
      MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'fr'));
      // });
    } else if (codeLanguageChange == "EN" && !languageLocal!.endsWith("EN")) {
      // setState(() {
      locale = const Locale('en', 'EN');
      MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'en'));
      // });
    }
    //MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'de'));
    // return Localizations.localeOf(context).toString();
  }

  // void main() {
  //   runApp(MyApp());
  // }

  static String? search(BuildContext context) {
    return AppLocalizations.translate('search').toString();
  }

  static String? last_pick(BuildContext context) {
    return AppLocalizations.translate('last_pick').toString();
  }

  static String? search_point(BuildContext context) {
    return AppLocalizations.translate('search_point').toString();
  }

  void setState(Null Function() param0) {
    setState(() {});
  }
}

class _UtilsState extends State<Utils> {
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

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  getName(BuildContext context) {
    search = AppLocalizations.translate('search').toString();
    return search;
  }
}
