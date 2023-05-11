import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  late final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static Map<String, String>? _localizedStrings;

  static Future<bool> load(Locale locale) async {
    // Load the language JSON file from the "language" folder
    String jsonString =
        await rootBundle.loadString('language/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  static String? translate(String key) {
    return _localizedStrings![key];
  }

  static initializeMessages(localeName) {}
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['it', 'en', 'fr', 'es', 'de', 'en_us']
        .contains(locale.languageCode);
  }

  @override
  bool isSupportedNew(Locale locale) {
    return locale.languageCode == "en" &&
        locale.countryCode == "it" &&
        locale.languageCode == "fr" &&
        locale.languageCode == "es" &&
        locale.languageCode == "de";
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await AppLocalizations.load(locale);
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
