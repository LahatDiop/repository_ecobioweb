



import 'package:flutter/foundation.dart';

import '../components/language.dart';


class LanguageProvider  with ChangeNotifier,DiagnosticableTreeMixin {

  // LanguageProvider({super.key, required super.create});


  bool _disposed = false;



  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  /// language objet
  late Language language;

   /// Language selected
  static Language? _language;

  ///LANGUAGE SELECTED
   static Language? _languageSelected;

  ///  LIST ALL LANGUAGES
  final List<Language> _languages=[];

  List<Language> get  languages{
    return _languages;
  }

  ///MAP MARKET ENABLED
   final Map<String, Language> _languageEnabled={};

  Map<String, Language> get languageEnabled => _languageEnabled;

  //  Map<String, Language> get languageEnabled {
  //    return {..._languageEnabled};
  // }


  /// MAP ALL MARKET
  static Map<String,Language> _languagesAll ={};













// Language findByProductCode(String code) {
  //   return languages.firstWhere((element) => element.codeProd.toString() == code);
  // }


}