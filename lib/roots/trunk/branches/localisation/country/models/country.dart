import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../market/components/market.dart';
import '../../../menu/menu_settings/settings/admin/screens/setting_screen.dart';
import '../../translation/components/appLocalizations.dart';
import '../components/code_country.dart';
import '../screens/code_countries_en.dart';
import '../widget/country_list_pick.dart';
import 'code_contry.dart';

//void main() => runApp(Country());

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
 // late CountryCode initialSelection;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    //Get local default App

    //  AppLocalizations.load(locale).lahat
    //local default
   // String? defaultLocal = Localizations.localeOf(context).toString();

   //String codeCountry = defaultLocal.substring(3);

    // GET DialCode country
 //   String dialCode = codeLocalDefaultApp(defaultLocal.toString());

    //---> Market Info
    //market();

   // return Scaffold(

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: const [
        //   // THIS CLASS WILL BE ADDED LATER
        //   // A class which loads the translations from JSON files
        //   AppLocalizations.delegate,
        //   // Built-in localization of basic text for Material widgets
        //   GlobalMaterialLocalizations.delegate,
        //
        //   GlobalCupertinoLocalizations.delegate,
        //   // Built-in localization for text direction LTR/RTL
        //   GlobalWidgetsLocalizations.delegate,
        // ],


        home: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.translate("back").toString()),
            backgroundColor: const Color.fromARGB(255, 50, 172, 34),
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
               //   Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                 // Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                );
              },
            ),
          ),

      // appBar: AppBar(
      //   title: Text(AppLocalizations.translate("back").toString()),
      //   backgroundColor: const Color.fromARGB(255, 50, 172, 34),
      //   leading: BackButton(
      //     color: Colors.black,
      //       onPressed: () {
      //       //  Navigator.pop(context);
      //       // sendDataBack(context,initialSelectionCountryCode);
      //         Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
      //       );
      //     },
      //   ),
      // ),
      // appBar: AppBar(
      //   title: Text(AppLocalizations.translate("back").toString()),
      //   // leading: const BackButton(color: Colors.black),
      //   backgroundColor: const Color.fromARGB(255, 50, 172, 34),
      //
      // ),
      // appBar: AppBar(
      //   leading: IconButton(
      //    // color: widget.appController.themeController.appBlackDeepColor,
      //     tooltip: 'Back laka',
      //     alignment: Alignment.centerLeft,
      //    // icon: (widget.appController.deviceIsAndroid) ? const Icon(Icons.arrow_back) : const Icon(Icons.arrow_back_ios),
      //     icon: const Icon(Icons.backspace),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         // MaterialPageRoute(builder: (context) =>  ShowSessionsPage(widget.appController)),
      //         MaterialPageRoute(builder: (context) =>  SettingScreen()),
      //       );
      //     },
      //   ),
      // ),

      body: Center(
        child: CountryListPick(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 48, 153, 53),
            title: Text(AppLocalizations.translate("pickCountry").toString()),
            // title: Text('Pick your country'),
          ),
          // if you need custom picker use this
          //  pickerBuilder: (context, CountryCode? countryCode) {
          //      return Row(
          //        children: [
          //          // Image.asset(
          //          //   countryCode?.flagUri != null?, package: 'country_list_pick',
          //          // ),
          //             //  Text(countryCode?.code),
          //         //  Text(countryCode?.dialCode),
          //         Text(AppLocalizations.translate('pickCountry').toString())        ],
          //
          //      );
          //    },

          theme: CountryTheme(
            isShowFlag: true,
            isShowTitle: true,
            isShowCode: true,
            isDownIcon: true,
            showEnglishName: false,
            labelColor: Colors.blueAccent,
          ),

          //  Country default Italia
          // initialSelection: '+39',
      //    initialSelection: dialCode,

          // or
          // initialSelection: 'US'
          onChanged: (CountryCode? code) {
            print('Country Choice');
            print(code!.name);
            print(code.code);
            print(code.dialCode);
            print(code.flagUri);
          },
        ),
      ),
        ),
    );
    // );
  }

// RETURN CODE DEFAULT APP FROM JSON LIST COUNTRY
  String codeLocalDefaultApp(String languageLocal) {
    String codeDefaultCountry = "";

    List<Map> jsonList = countriesEnglish;

    List<Map> codeContrieJsonList =CodeContry().codeCountriesEnglish;

    List elements = jsonList.map((s) => CountryCode(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              // flagUri: '/images/flags/${s['code'].toLowerCase()}.png',
              flagUri: '.../flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    // FILTRE THE LIST MARKET ENABLED
    List countryEnabled = [];

    for (int i = 0; i < elements.length; i++) {
      String codeCountry = elements[i].code;

      if (languageLocal == codeCountry.toLowerCase()) {
        codeDefaultCountry = elements[i].dialCode;
      }
    }

    return codeDefaultCountry;
  }

  Future<void> market() async {
    List<dynamic> marketList = [];
    final String response =
        await rootBundle.loadString('../../assets/json/market.json');
    final data = await json.decode(response);

    marketList = data['market'].map((data) => Market.fromJson(data)).toList();

    for (var i in marketList) {
      if (i.name == "Italia") {
        print(i.name);
      } else if (i.name == "Germany") {
        print(i.name);
      } else if (i.name == "France") {
        print(i.name);
      } else if (i.name == "Spangna") {
        print(i.name);
      } else if (i.name == "Senegal") {
        print(i.name);
      } else if (i.name == "Nigeria") {
        print(i.name);
      }
    }
    setState(() {
      marketList = data['market'].map((data) => Market.fromJson(data)).toList();
    });
  }

  void sendDataBack1(BuildContext context) {
    Navigator.pop(context);
    //  Localizations.localeOf(context);
    // Localizations.maybeLocaleOf(context);
  }

  void sendDataBack(
      BuildContext context, CountryCode initialSelectionCountryCode) {
    Navigator.pop(context, initialSelectionCountryCode);
  }

// @override
// Widget buildOKORigine(BuildContext context) {
//   //Get local default App
//   String? defaultLocal = Localizations.localeOf(context).toString();
//
//   String codeCountry = defaultLocal.substring(3);
//
//   // GET DialCode country
//   String dialCode = codeLocalDefaultApp(codeCountry);
//
//   //---> Market Info
//   //market();
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.translate("countryLocation").toString()),
//         backgroundColor: Colors.amber,
//       ),
//       body: Center(
//         child: CountryListPick(
//           appBar: AppBar(
//             backgroundColor: Colors.amber,
//             title: Text(AppLocalizations.translate("pickCountry").toString()),
//           ),
//           // if you need custom picker use this
//           // pickerBuilder: (context, CountryCode countryCode) {
//           //   return Row(
//           //     children: [
//           //       Image.asset(
//           //         countryCode.flagUri,
//           //         package: 'country_list_pick',
//           //       ),
//           //       Text(countryCode.code),
//           //       Text(countryCode.dialCode),
//           //     ],
//           //   );
//           // },
//           theme: CountryTheme(
//             isShowFlag: true,
//             isShowTitle: true,
//             isShowCode: true,
//             isDownIcon: true,
//             showEnglishName: false,
//             labelColor: Colors.blueAccent,
//           ),
//           //  Country default Italia
//           // initialSelection: '+39',
//           initialSelection: dialCode,
//           // or
//           // initialSelection: 'US'
//           onChanged: (CountryCode? code) {
//             // ignore: avoid_print
//             print('Country Choice');
//             print(code!.name);
//             print(code.code);
//             print(code.dialCode);
//             print(code.flagUri);
//           },
//         ),
//       ),
//     ),
//   );
// }
}
