mixin ToAlias {}

// ignore: provide_deprecation_message
@deprecated
class CElement = Language with ToAlias;

/// Country element. This is the element that contains all the information
class Language {
  /// the name of the country
  String? name;

  /// the flag of the country
  String? flagUri;

  /// the country code (IT,AF..)
  String? code;

  /// the dial code (+39,+93..)
  String? dialCode;

  String? isEnabled;

  Language({this.name, this.flagUri, this.code, this.dialCode,this.isEnabled});

  @override
  String toString() => "$dialCode";

  String toLongString() => "$dialCode $name";

  String toCountryStringOnly() => '$name';

 /// Language.name(this.isEnabled);
}
