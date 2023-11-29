import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  late final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations?of(context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

 static  Map<String, String> _localizedStrings=<String, String>{};

  static Future<bool> load(Locale locale) async {

    // List country enabled else en

    // if(locale.languageCode =="GB"){
    //   locale.languageCode.toString().replaceAll("GB", "UK");


    // }
    // _localizedStrings?.clear();
       // Load the language JSON file from the "language" folder
    // final jsonString =  await rootBundle.loadString('./assets/language/${locale.languageCode}.json');
  ///  final jsonString =  await rootBundle.loadString('./assets/language/${locale.languageCode.toString().toLowerCase()}.json');
    final jsonString =  await rootBundle.loadString('./assets/language/${locale.languageCode.toString().toLowerCase()}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

     _localizedStrings = jsonMap.map((key, value) {
         return MapEntry(key, value.toString());
    });

   //Localizations.localeOf(context);
    return true;
  }

  // This method will be called from every widget which needs a localized text
  static String translate(String key) {
    return _localizedStrings[key].toString();
  }

  static initializeMessages(localeName) {}
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  // @override
  // bool isSupported1(Locale locale) {
  //   // Include all of your supported language codes here
  //   return ['it', 'en', 'fr', 'es', 'de', 'en_us']
  //       .contains(locale.languageCode);
  // }

  @override
  bool isSupported(Locale locale) {
    return Languages.languages
        .map((e) => e.code)
        .toList()
        .contains(locale.languageCode);
  }

  @override
  bool shouldReload1(_AppLocalizationsDelegate old) => false;


  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await AppLocalizations.load(locale);
    return appLocalizations;
  }

}


class LanguageEntity {
  final String code;
  final String value;

  const LanguageEntity({
    required this.code,
    required this.value,
  });
}
class Languages {
  const Languages._();


 // 'it', 'en', 'fr', 'es', 'de', 'en_us'
  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'fr', value: 'French'),
    LanguageEntity(code: 'it', value: 'Italian'),
    LanguageEntity(code: 'es', value: 'Spanish'),
    LanguageEntity(code: 'de', value: 'Germany'),
  ];
}


