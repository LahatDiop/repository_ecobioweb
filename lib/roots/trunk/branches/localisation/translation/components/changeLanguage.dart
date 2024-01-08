// import 'package:flutter/material.dart';
// import 'appLocalizations.dart';
//
// class ChangeLanguage extends StatefulWidget {
//   String? codeContry;
//
//   ChangeLanguage(String codeContry, {Key? key}) : super(key: key);
//   //changeLang(codeContry);
//   @override
//   _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
//   // ignore: no_logic_in_create_state
//   // _ChangeLanguageScreenState createState() {
//   //  changeLang(codeContry);
//   //  return _ChangeLanguageScreenState();
//   //}
//
//   @override
//   void initState() {
//  //  changeLang(codeContry);
//     //super.initState();
//   }
//
//  //  void changeLang(String? codeContry) {}
// }
//
// // void changeLang(String? codeLanguageChange) {
// //
// //   if (codeLanguageChange == "DE") {
// //     AppLocalizations.load(const Locale('de_DE'));
// //     MyApp.of(context).setLocale(const Locale('de_DE'));
// //   } else if (codeLanguageChange == "IT") {
// //     AppLocalizations.load(const Locale('it_IT'));
// //   } else if (codeLanguageChange == "FR") {
// //     AppLocalizations.load(const Locale('fr_FR'));
// //     MyApp.of(context).setLocale(const Locale('fr_FR'));
// //   } else if (codeLanguageChange == "ES") {
// //     AppLocalizations.load(const Locale('es_ES'));
// //     MyApp.of(context).setLocale(const Locale('es_ES'));
// //   } else if (codeLanguageChange == "SN") {
// //     AppLocalizations.load(const Locale('sn_SN'));
// //     MyApp.of(context).setLocale(const Locale('sn_SN'));
// //   } else if (codeLanguageChange == "NG") {
// //     AppLocalizations.load(const Locale('ng_NG'));
// //     MyApp.of(context).setLocale(const Locale('ng_NG'));
// //   }
// //}
//
// class _ChangeLanguageScreenState extends State<ChangeLanguage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           AppLocalizations.translate('localization').toString(),
//           style: const TextStyle(color: Colors.black),
//         ),
//         leading: const BackButton(
//           color: Colors.black,
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text(
//                 AppLocalizations.translate('countryLocation').toString(),
//                 style: const TextStyle(fontSize: 25),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 AppLocalizations.translate('agricolturaBio').toString(),
//                 style: const TextStyle(fontSize: 25),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 AppLocalizations.translate('slogan').toString(),
//                 style: const TextStyle(fontSize: 25),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /*   String? changeLang(String? codeContrySelected) {
//     if (codeContrySelected == "DE") {
//       AppLocalizations.load(const Locale('de', 'DE'));
//       // AppLocalizations.of(context)?.locale = const Locale('de', 'DE');
//     } else if (codeContrySelected == "IT") {
//       AppLocalizations.load(const Locale('it', 'IT'));
//     } else if (codeContrySelected == "FR") {
//       AppLocalizations.load(const Locale('fr', 'FR'));
//     } else if (codeContrySelected == "ES") {
//       AppLocalizations.load(const Locale('es', 'ES'));
//     } else if (codeContrySelected == "SN") {
//       AppLocalizations.load(const Locale('sn', 'SN'));
//     } else if (codeContrySelected == "NG") {
//       AppLocalizations.load(const Locale('ng', 'NG'));
//     }
//
//     return codeContrySelected;
// }*/
// }
