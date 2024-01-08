import 'package:flutter/material.dart';

import '../../../localisation/translation/components/appLocalizations.dart';

class AppTextTranslated extends StatelessWidget {
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;

  const AppTextTranslated({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     getTranlate(text!),
   //  text!,
      textAlign: textAlign == null ? null : TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  String getTranlate(String text) {

    String data = AppLocalizations.translate(text).toString();
    return data;

  }
}
