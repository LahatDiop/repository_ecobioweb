



import 'package:flutter/material.dart';

import '../../../localisation/translation/components/appLocalizations.dart';
import '../theme/app_theme.dart';

class SubTitle{

 static createSubTitle(String name) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      alignment: Alignment.topLeft,
      child:
      Text(
        AppLocalizations.translate(name).toString(),
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ),
    );
  }

 static createSubTitleUpperCase(String name) {
   return Container(
     padding: const EdgeInsets.symmetric( horizontal: 20),
     alignment: Alignment.center,
     child:
     Text(
       AppLocalizations.translate(name).toString().toUpperCase(),
       style: const TextStyle(
           color: Colors.black,
           fontSize: 20,
           fontFamily: 'Quicksand',
           fontWeight: FontWeight.bold),
     ),
   );
 }

 Widget subTitle(String text) {
   return Row(
     children: [
       Text(
         text,
         style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
       ),
       const Spacer(),
        Text(
         AppLocalizations.translate(text).toString(),
         style: const TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold,
             color: AppColors.primaryColor),
       ),
     ],
   );
 }
}