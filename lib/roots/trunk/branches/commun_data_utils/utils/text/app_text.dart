import 'package:flutter/material.dart';

import '../../../localisation/translation/components/appLocalizations.dart';

class AppText extends StatelessWidget {
  final String? text;
  final String? value;
  final double fontSize;
  final int? maxLines;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;

  const AppText({
    super.key,
    required this.text,
    this.value,
    this.fontSize = 18,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      // getTranlated(text!),
      getTranlatedNotKey(text!),
      textAlign: textAlign == null ? null : TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
    );
  }

  /// Translate element of app if not value translated key return of text initale data
  String getTranlated(String text) {

    String dataTranslated =AppLocalizations.translate(text);
    String data="";
    if(dataTranslated =="null"){
       data=text;
    }else{
      data= dataTranslated;
    }
    return data;
  }

  /// Translate element of app if not value return of text initale
  String getTranlatedNotKey(String text) {
    String dataTranslated =AppLocalizations.translate(text);
    return dataTranslated;

  }

  static getText(String text) {
    String dataTranslated =AppLocalizations.translate(text);
    return dataTranslated;

  }


}
