import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:ecobioweb/roots/trunk/branches/localisation/country/models/countryList.dart';
import 'package:ecobioweb/roots/trunk/branches/localisation/country/widget/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizations {
  // final Locale? locale;

  // String? languageCodeDevice;
  // String? currentCodeLang;
  static bool? isInitializedLang = true;

  static String? currentCodeLang;

  // AppLocalizations(this.locale);
  AppLocalizations();

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static Map<String, String> _localizedStrings = <String, String>{};

  // static Future<bool> load(Locale locale) async {
  static Future<bool> loadLanguageApp(String languageCode,
      bool isInitializedLang) async {
    ///SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isInitializedLang) {
      _localizedStrings.clear();
      // Load the language JSON file from the "language" folder
      // final jsonString =  await rootBundle.loadString('./assets/language/${locale.languageCode}.json');
      ///  final jsonString =  await rootBundle.loadString('./assets/language/${locale.languageCode.toString().toLowerCase()}.json');
      final jsonString = await rootBundle.loadString(
          'assets/language/${languageCode.toString().toLowerCase()}.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });
    }
    //Localizations.localeOf(context);
    return true;
  }

  // This method will be called from every widget which needs a localized text
  static String translate(String key) {
    return _localizedStrings[key].toString();
  }

  static initializeMessages(localeName) {}

  /*
  To Change Locale of App
   */
  static void saveLanguageApp(String currentCodeLangApp,bool isInitializedLang) async {
    if (isInitializedLang) {
      reloadLanguageAppToLocalUser(currentCodeLangApp, isInitializedLang);
    } else {
      setLangAppToLocalDevice();
    }
  }

  static Future<void> reloadLanguageAppToLocalUser(String currentCode, bool isInitialized) async {

    /// Save the new lang in preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (currentCode.isNotEmpty) {
      currentCodeLang = currentCode.toLowerCase();
      isInitializedLang = isInitialized;
    }

    /// TODO localeDefault "en_US"
    ///currentCodeLang = localeDefault.substring(0, 2);

    /// Reload lang of new language
    loadLanguageApp(currentCodeLang!, isInitializedLang!);

    CountryListPick(currentCodeLang: currentCodeLang,isInitialLang: isInitializedLang);



    /// save lang in sharedPref currentCodeLang="it"
    prefs.setString('currentCodeLang', currentCodeLang!);
  }

    ///  Fist load App set the linguage default of lang device
  static Future<void> setLangAppToLocalDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ///"en_US"
    String localeDefault = Intl.getCurrentLocale();

    ///it_IT
    Locale deviceLocale = window.locale; // or html.window.locale

    ///"it"
    String? languageCodeDevice = deviceLocale.languageCode;

    /// save lang in sharedPref currentCodeLang="it"
    /// Controllo se non è stato salvato un code lingue "it" prendo la lingue del dispositivi o del local

    /// code lingua actualle
    currentCodeLang = prefs.getString("currentCodeLang");

    /// SECONDE LOAD LAND
    if (currentCodeLang != null) {
      ///deviceLocale
      if (languageCodeDevice.isNotEmpty) {
        currentCodeLang = languageCodeDevice;
      } else {
        /// localeDefault "en_US"
        if (localeDefault.isNotEmpty) {
          currentCodeLang = localeDefault.substring(0, 2);
        }
      }
      loadLanguageApp(currentCodeLang!, isInitializedLang!);

      /// save lang in sharedPref currentCodeLang="it"
      prefs.setString('currentCodeLang', currentCodeLang!);

      isInitializedLang = true;


   // }
  }else{
      /// FIST LOAD LAND
      isInitializedLang = true;
      loadLanguageApp(languageCodeDevice, isInitializedLang!);
      /// save lang in sharedPref currentCodeLang="it"
      prefs.setString('currentCodeLang', languageCodeDevice);
    }
    }

}
// // LocalizationsDelegate is a factory for a set of localized resources
// // In this case, the localized strings will be gotten in an AppLocalizations object
// class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   // This delegate instance will never change (it doesn't even have fields!)
//   // It can provide a constant constructor.
//   const _AppLocalizationsDelegate();
//
//   // @override
//   // bool isSupported1(Locale locale) {
//   //   // Include all of your supported language codes here
//   //   return ['it', 'en', 'fr', 'es', 'de', 'en_us']
//   //       .contains(locale.languageCode);
//   // }
//
//   @override
//   bool isSupported(Locale locale) {
//     return Languages.languages
//         .map((e) => e.code)
//         .toList()
//         .contains(locale.languageCode);
//   }
//
//   @override
//   bool shouldReload1(_AppLocalizationsDelegate old) => false;
//
//
//   @override
//   bool shouldReload(covariant LocalizationsDelegate old) {
//     return false;
//   }
//
//   @override
//   // Future<AppLocalizations> load(Locale locale) async {
//   //   // AppLocalizations class is where the JSON loading actually runs
//   //
//   //   var prefs= await SharedPreferences.getInstance();
//   //
//   //   String languageCode=prefs.getString('languageCode')?? 'it';
//   //   String countryCode =prefs.getString('countryCode')??'IT';
//   //
//   //
//   //   AppLocalizations appLocalizations = AppLocalizations(locale);
//   //   await AppLocalizations.load(languageCode);
//   //   return appLocalizations;
//   // }
//
// }


// class LanguageEntity {
// final String code;
// final String value;
//
// const LanguageEntity({
// required this.code,
// required this.value,
// });
// }
// class Languages {
// const Languages._();
//
//
// // 'it', 'en', 'fr', 'es', 'de', 'en_us'
// static const languages = [
// LanguageEntity(code: 'en', value: 'English'),
// LanguageEntity(code: 'fr', value: 'French'),
// LanguageEntity(code: 'it', value: 'Italian'),
// LanguageEntity(code: 'es', value: 'Spanish'),
// LanguageEntity(code: 'de', value: 'Germany'),
// ];
// }


