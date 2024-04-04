

// import 'helpers.dart';
// import 'validator.dart';


import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:string_validator/string_validator.dart';

import 'String_helper.dart';


class HelperDev extends StringHelper{

  final Map<String, Object> _defaultNormalizeEmailOptions = {'lowercase': true};

  /// convert the input to a string

  String toStrings(Object? input) {
    if (input == null || (input is List && input.isEmpty)) {
      input = '';
    }
    return input.toString();
  }

  /// convert the input to a date, or null if the input is not a date
  DateTime? toDate(String str) {
    try {
      return DateTime.parse(str);
    } catch (e) {
      return null;
    }
  }

  /// convert the input to a float, or NAN if the input is not a float
  double toFloat(String str) {
    try {
      return double.parse(str);
    } catch (e) {
      return double.nan;
    }
  }

  /// convert the input to a float, or NAN if the input is not a float
  double toDouble(String str) {
    return toFloat(str);
  }

  /// convert the input to an integer, or NAN if the input is not an integer
  num toInt(String str, {int radix = 10}) {
    try {
      return int.parse(str, radix: radix);
    } catch (e) {
      try {
        return double.parse(str).toInt();
      } catch (e) {
        return double.nan;
      }
    }
  }

  /// convert the input to a boolean.
  ///
  /// Everything except for '0', 'false' and ''
  /// returns `true`. In `strict` mode only '1' and 'true' return `true`.
  static bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    str;
    return str != '0' && str != 'false' && str != '' && str!='null';
  }

  static bool boolFromString(String str)  {
    bool value=false;
    if (str.toLowerCase() == 'true') {
      value= true;
    } else if ((str.toLowerCase() == 'false') || (str.toUpperCase()=="null")) {
      value= false;
    }
    return value;
  }

  static bool boolIsNotEmptyNull(bool value)  {
    bool value=false;

    value == null ? false :value ?? false;

    if (value== true) {
      value= true;
    } else if ((value == false) || (value == "null")) {
      value= false;
    }
    return value;
  }

  /// trim characters (whitespace by default) from both sides of the input
  String trim(String str, [String? chars]) {
    RegExp pattern =
    (chars != null) ? RegExp('^[$chars]+|[$chars]+\$') : RegExp(r'^\s+|\s+$');
    return str.replaceAll(pattern, '');
  }

  /// trim characters from the left-side of the input
  String ltrim(String str, [String? chars]) {
    var pattern = chars != null ? RegExp('^[$chars]+') : RegExp(r'^\s+');
    return str.replaceAll(pattern, '');
  }

  /// trim characters from the right-side of the input
  String rtrim(String str, [String? chars]) {
    var pattern = chars != null ? RegExp('[$chars]+\$') : RegExp(r'\s+$');
    return str.replaceAll(pattern, '');
  }

  /// remove characters that do not appear in the whitelist.
  ///
  /// The characters are used in a RegExp and so you will need to escape
  /// some chars.
  String whitelist(String str, String chars) {
    return str.replaceAll(RegExp('[^$chars]+'), '');
  }

  /// remove characters that appear in the blacklist.
  ///
  /// The characters are used in a RegExp and so you will need to escape
  /// some chars.
  String blacklist(String str, String chars) {
    return str.replaceAll(RegExp('[$chars]+'), '');
  }

  /// remove characters with a numerical value < 32 and 127.
  ///
  /// If `keep_new_lines` is `true`, newline characters are preserved
  /// `(\n and \r, hex 0xA and 0xD)`.
  String stripLow(String str, [bool keepNewLines = false]) {
    String chars =
    keepNewLines == true ? '\x00-\x09\x0B\x0C\x0E-\x1F\x7F' : '\x00-\x1F\x7F';
    return blacklist(str, chars);
  }

  /// replace `<`, `>`, `&`, `'` and `"` with HTML entities
  String escape(String str) {
    return (str
        .replaceAll(RegExp(r'&'), '&amp;')
        .replaceAll(RegExp(r'"'), '&quot;')
        .replaceAll(RegExp(r"'"), '&#x27;')
        .replaceAll(RegExp(r'<'), '&lt;')
        .replaceAll(RegExp(r'>'), '&gt;'));
  }

  /// canonicalize an email address.
  ///
  /// `options` is a `Map` which defaults to
  /// `{ lowercase: true }`. With lowercase set to true, the local part of the
  /// email address is lowercased for all domains; the hostname is always
  /// lowercased and the local part of the email address is always lowercased
  /// for hosts that are known to be case-insensitive (currently only GMail).
  /// Normalization follows special rules for known providers: currently,
  /// GMail addresses have dots removed in the local part and are stripped of
  /// tags (e.g. `some.one+tag@gmail.com` becomes `someone@gmail.com`) and all
  /// `@googlemail.com` addresses are normalized to `@gmail.com`.
  String normalizeEmail(String email, [Map<String, Object>? options]) {
    options = merge(options, _defaultNormalizeEmailOptions);
    if (isEmail(email) == false) {
      return '';
    }

    List parts = email.split('@');
    parts[1] = parts[1].toLowerCase();

    if (options['lowercase'] == true) {
      parts[0] = parts[0].toLowerCase();
    }

    if (parts[1] == 'gmail.com' || parts[1] == 'googlemail.com') {
      if (options['lowercase'] == false) {
        parts[0] = parts[0].toLowerCase();
      }
      parts[0] = parts[0].replaceAll('.', '').split('+')[0];
      parts[1] = 'gmail.com';
    }
    return parts.join('@');
  }

  ///*******************************StringBuilder ***************************


  final RegExp _email = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

  final RegExp _ipv4Maybe = RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');
  final RegExp _ipv6 =
  RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$');

  final RegExp _surrogatePairsRegExp = RegExp(r'[\uD800-\uDBFF][\uDC00-\uDFFF]');

  final RegExp _alpha = RegExp(r'^[a-zA-Z]+$');
  final RegExp _alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
  final RegExp _numeric = RegExp(r'^-?[0-9]+$');
  final RegExp _int = RegExp(r'^(?:-?(?:0|[1-9][0-9]*))$');
  final RegExp _float =
  RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$');
  final RegExp _hexadecimal = RegExp(r'^[0-9a-fA-F]+$');
  final RegExp _hexColor = RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  final RegExp _base64 = RegExp(
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');

  final RegExp _creditCard = RegExp(
      r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$');

  final RegExp _isbn10Maybe = RegExp(r'^(?:[0-9]{9}X|[0-9]{10})$');
  final RegExp _isbn13Maybe = RegExp(r'^(?:[0-9]{13})$');

  final Map<String, RegExp> _uuid = {
    '3': RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-3[0-9A-F]{3}-[0-9A-F]{4}-[0-9A-F]{12}$'),
    '4': RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$'),
    '5': RegExp(
        r'^[0-9A-F]{8}-[0-9A-F]{4}-5[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$'),
    'all':
    RegExp(r'^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$')
  };

  final RegExp _multibyte = RegExp(r'[^\x00-\x7F]');
  final RegExp _ascii = RegExp(r'^[\x00-\x7F]+$');
  final RegExp _fullWidth =
  RegExp(r'[^\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]');
  final RegExp _halfWidth =
  RegExp(r'[\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]');

  /// check if the string matches the comparison
  bool equals(String str, Object? comparison) {
    return str == comparison.toString();
  }

  /// check if the string contains the substring
  bool contains(String str, String substring) {
    return str.contains(substring);
  }

  /// check if string matches the pattern.
  bool matches(String str, String pattern) {
    RegExp re = RegExp(pattern);
    return re.hasMatch(str);
  }

  /// check if the string is an email
  bool isEmail(String str) {
    return _email.hasMatch(str.toLowerCase());
  }

  /// check if the string contains only letters (a-zA-Z).
  bool isAlpha(String str) {
    return _alpha.hasMatch(str);
  }

  /// check if the string contains only numbers
  bool isNumeric(String str) {
    return _numeric.hasMatch(str);
  }

  /// check if the string contains only letters and numbers
  bool isAlphanumeric(String str) {
    return _alphanumeric.hasMatch(str);
  }

  /// check if a string is base64 encoded
  bool isBase64(String str) {
    return _base64.hasMatch(str);
  }

  /// check if the string is an integer
  bool isInt(String str) {
    return _int.hasMatch(str);
  }

  /// check if the string is a float
  bool isFloat(String str) {
    return _float.hasMatch(str);
  }

  /// check if the string is a hexadecimal number
  bool isHexadecimal(String str) {
    return _hexadecimal.hasMatch(str);
  }

  /// check if the string is a hexadecimal color
  bool isHexColor(String str) {
    return _hexColor.hasMatch(str);
  }

  /// check if the string is lowercase
  bool isLowercase(String str) {
    return str == str.toLowerCase();
  }

  /// check if the string is uppercase
  bool isUppercase(String str) {
    return str == str.toUpperCase();
  }

  /// check if the string is a URL
  ///
  /// `options` is a `Map` which defaults to
  /// `{ 'protocols': ['http','https','ftp'], 'require_tld': true,
  /// 'require_protocol': false, 'allow_underscores': false }`.
  bool isURL(String? input, [Map<String, Object>? options]) {
    var str = input;
    if (str == null ||
        str.isEmpty ||
        str.length > 2083 ||
        str.indexOf('mailto:') == 0) {
      return false;
    }

    final defaultUrlOptions = {
      'protocols': ['http', 'https', 'ftp'],
      'require_tld': true,
      'require_protocol': false,
      'allow_underscores': false,
    };

    options = merge(options, defaultUrlOptions);

    // String? protocol;
    // String user;
    // String pass;
    // // String auth;
    // String host;
    // String hostname;
    // String port;
    // String portStr;
    // String path;
    // String query;
    // String hash;
    // List<String> split;

    // check protocol
    var split = str.split('://');
    if (split.length > 1) {
      final protocol = shift(split);
      final protocols = options['protocols'] as List<String>;
      if (!protocols.contains(protocol)) {
        return false;
      }
    } else if (options['require_protocol'] == true) {
      return false;
    }
    str = split.join('://');

    // check hash
    split = str.split('#');
    str = shift(split);
    final hash = split.join('#');
    if (hash.isNotEmpty && RegExp(r'\s').hasMatch(hash)) {
      return false;
    }

    // check query params
    split = str?.split('?') ?? [];
    str = shift(split);
    final query = split.join('?');
    if (query != "" && RegExp(r'\s').hasMatch(query)) {
      return false;
    }

    // check path
    split = str?.split('/') ?? [];
    str = shift(split);
    final path = split.join('/');
    if (path != "" && RegExp(r'\s').hasMatch(path)) {
      return false;
    }

    // check auth type urls
    split = str?.split('@') ?? [];
    if (split.length > 1) {
      final auth = shift(split);
      if (auth != null && auth.contains(':')) {
        // final auth = auth.split(':');
        final parts = auth.split(':');
        final user = shift(parts);
        if (user == null || !RegExp(r'^\S+$').hasMatch(user)) {
          return false;
        }
        final pass = parts.join(':');
        if (!RegExp(r'^\S*$').hasMatch(pass)) {
          return false;
        }
      }
    }

    // check hostname
    final hostname = split.join('@');
    split = hostname.split(':');
    final host = shift(split);
    if (split.isNotEmpty) {
      final portStr = split.join(':');
      final port = int.tryParse(portStr, radix: 10);
      if (!RegExp(r'^[0-9]+$').hasMatch(portStr) ||
          port == null ||
          port <= 0 ||
          port > 65535) {
        return false;
      }
    }

    if (host == null ||
        !isIP(host) && !isFQDN(host, options) && host != 'localhost') {
      return false;
    }

    return true;
  }


  /// check if the string is a number that's divisible by another
  ///
  /// [n] is a String or an int.
  bool isDivisibleBy(String str, Object n) {
    assert(n is String || n is int);
    final int? number;
    if (n is int) {
      number = n;
    } else if (n is String) {
      number = int.tryParse(n);
    } else {
      return false;
    }
    if (number == null) return false;
    try {
      return double.parse(str) % number == 0;
    } catch (e) {
      return false;
    }
  }

  /// check if the string's length falls in a range
  /// If no max is given then any length above min is ok.
  ///
  /// Note: this function takes into account surrogate pairs.
  bool isLength(String str, int min, [int? max]) {
    List surrogatePairs = _surrogatePairsRegExp.allMatches(str).toList();
    int len = str.length - surrogatePairs.length;
    return len >= min && (max == null || len <= max);
  }

  /// check if the string's length (in bytes) falls in a range.
  bool isByteLength(String str, int min, [int? max]) {
    return str.length >= min && (max == null || str.length <= max);
  }

  /// check if the string is a UUID (version 3, 4 or 5).
  bool isUUID(String str, [Object? version]) {
    if (version == null) {
      version = 'all';
    } else {
      version = version.toString();
    }

    RegExp? pat = _uuid[version];
    return (pat != null && pat.hasMatch(str.toUpperCase()));
  }

  /// check if the string is a date
  bool isDate(String str) {
    return DateTime.tryParse(str) != null;
  }

  /// check if the string is a date that's after the specified date
  ///
  /// If `date` is not passed, it defaults to now.
  bool isAfter(String str, [String? date]) {
    DateTime referenceDate;
    if (date == null) {
      referenceDate = DateTime.now();
    } else if (isDate(date)) {
      referenceDate = DateTime.parse(date);
    } else {
      return false;
    }

    final strDate = DateTime.tryParse(str);
    if (strDate == null) return false;

    return strDate.isAfter(referenceDate);
  }

  /// check if the string is a date that's before the specified date
  ///
  /// If `date` is not passed, it defaults to now.
  bool isBefore(String str, [String? date]) {
    DateTime referenceDate;
    if (date == null) {
      referenceDate = DateTime.now();
    } else if (isDate(date)) {
      referenceDate = DateTime.parse(date);
    } else {
      return false;
    }

    final strDate = DateTime.tryParse(str);
    if (strDate == null) return false;

    return strDate.isBefore(referenceDate);
  }

  /// check if the string is in an array of allowed values
  bool isIn(String str, Object? values) {
    if (values == null) return false;
    if (values is String) {
      return values.contains(str);
    }
    if (values is! Iterable) return false;
    for (Object? value in values) {
      if (value.toString() == str) return true;
    }
    return false;
  }

  /// check if the string is a credit card
  bool isCreditCard(String str) {
    String sanitized = str.replaceAll(RegExp(r'[^0-9]+'), '');
    if (!_creditCard.hasMatch(sanitized)) {
      return false;
    }

    // Luhn algorithm
    int sum = 0;
    String digit;
    bool shouldDouble = false;

    for (int i = sanitized.length - 1; i >= 0; i--) {
      digit = sanitized.substring(i, (i + 1));
      int tmpNum = int.parse(digit);

      if (shouldDouble == true) {
        tmpNum *= 2;
        if (tmpNum >= 10) {
          sum += ((tmpNum % 10) + 1);
        } else {
          sum += tmpNum;
        }
      } else {
        sum += tmpNum;
      }
      shouldDouble = !shouldDouble;
    }

    return (sum % 10 == 0);
  }

  /// check if the string is an ISBN (version 10 or 13)
  bool isISBN(String str, [Object? version]) {
    if (version == null) {
      return isISBN(str, '10') || isISBN(str, '13');
    }

    version = version.toString();

    String sanitized = str.replaceAll(RegExp(r'[\s-]+'), '');
    int checksum = 0;

    if (version == '10') {
      if (!_isbn10Maybe.hasMatch(sanitized)) {
        return false;
      }
      for (int i = 0; i < 9; i++) {
        checksum += (i + 1) * int.parse(sanitized[i]);
      }
      if (sanitized[9] == 'X') {
        checksum += 10 * 10;
      } else {
        checksum += 10 * int.parse(sanitized[9]);
      }
      return (checksum % 11 == 0);
    } else if (version == '13') {
      if (!_isbn13Maybe.hasMatch(sanitized)) {
        return false;
      }
      var factor = [1, 3];
      for (int i = 0; i < 12; i++) {
        checksum += factor[i % 2] * int.parse(sanitized[i]);
      }
      return (int.parse(sanitized[12]) - ((10 - (checksum % 10)) % 10) == 0);
    }

    return false;
  }

  /// check if the string is valid JSON
  bool isJson(String str) {
    try {
      json.decode(str);
    } catch (e) {
      return false;
    }
    return true;
  }

  /// check if the string contains one or more multibyte chars
  bool isMultibyte(String str) {
    return _multibyte.hasMatch(str);
  }

  /// check if the string contains ASCII chars only
  bool isAscii(String str) {
    return _ascii.hasMatch(str);
  }

  /// check if the string contains any full-width chars
  bool isFullWidth(String str) {
    return _fullWidth.hasMatch(str);
  }

  /// check if the string contains any half-width chars
  bool isHalfWidth(String str) {
    return _halfWidth.hasMatch(str);
  }

  /// check if the string contains a mixture of full and half-width chars
  bool isVariableWidth(String str) {
    return isFullWidth(str) && isHalfWidth(str);
  }

  /// check if the string contains any surrogate pairs chars
  bool isSurrogatePair(String str) {
    return _surrogatePairsRegExp.hasMatch(str);
  }

  /// check if the string is a valid hex-encoded representation of a MongoDB ObjectId
  bool isMongoId(String str) {
    return (isHexadecimal(str) && str.length == 24);
  }

  /// check if the string is an IP (version 4 or 6)
  ///
  /// `version` is a String or an `int`.
  bool isIP(String str, [Object? version]) {
    assert(version == null || version is String || version is int);
    version = version.toString();
    if (version == 'null') {
      return isIP(str, 4) || isIP(str, 6);
    } else if (version == '4') {
      if (!_ipv4Maybe.hasMatch(str)) {
        return false;
      }
      var parts = str.split('.');
      parts.sort((a, b) => int.parse(a) - int.parse(b));
      return int.parse(parts[3]) <= 255;
    }
    return version == '6' && _ipv6.hasMatch(str);
  }

  /// check if the string is a fully qualified domain name (e.g. domain.com).
  ///
  /// `options` is a `Map` which defaults to `{ 'require_tld': true, 'allow_underscores': false }`.
  bool isFQDN(String str, [Map<String, Object>? options]) {
    final defaultFqdnOptions = {'require_tld': true, 'allow_underscores': false};

    options = merge(options, defaultFqdnOptions);
    final parts = str.split('.');
    if (options['require_tld'] as bool) {
      var tld = parts.removeLast();
      if (parts.isEmpty || !RegExp(r'^[a-z]{2,}$').hasMatch(tld)) {
        return false;
      }
    }

    for (final part in parts) {
      if (options['allow_underscores'] as bool) {
        if (part.contains('__')) {
          return false;
        }
      }
      if (!RegExp(r'^[a-z\\u00a1-\\uffff0-9-]+$').hasMatch(part)) {
        return false;
      }
      if (part[0] == '-' ||
          part[part.length - 1] == '-' ||
          part.contains('---')) {
        return false;
      }
    }
    return true;
  }


}

