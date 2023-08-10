



import 'dart:ui';

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocale{

  /*
    To Change Locale of App
    Locale default, Platform.localeName,
   */
  void setLocale(SharedPreferences pref, Context context,Locale newLocale, String defaultSystemLocale,) {
    pref.setString('languageCode', newLocale.languageCode);
    pref.setString('countriCode', "");
    pref.setString('defaultsSistemLocale', "");
  }


/*
  To get local from SharedPreferences if exists
 */
  Future<Locale> fetchLocale() async{
    var prefs= await SharedPreferences.getInstance();

    String languageCode=prefs.getString('languageCode')?? 'it';
    String countryCode =prefs.getString('countryCode')??'IT';

    return Locale(languageCode,countryCode);

  }
}