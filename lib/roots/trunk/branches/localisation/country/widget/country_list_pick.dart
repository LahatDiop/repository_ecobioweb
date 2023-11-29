
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../database/storages/locale/shared_preferences_locale.dart';
import '../../translation/components/appLocalizations.dart';
import '../components/code_country.dart';
import '../components/code_countrys.dart';
import '../components/country_selection_theme.dart';
import '../components/selection_list.dart';
import '../screens/code_countries_en.dart';
export '../components/country_selection_theme.dart';

class CountryListPick extends StatefulWidget {


  const CountryListPick(
      {super.key, this.onChanged,
      this.initialSelection,
      this.appBar,
      this.pickerBuilder,
      this.countryBuilder,
      this.theme,
      this.useUiOverlay = true,
      this.useSafeArea = false});

  final String? initialSelection;
  final ValueChanged<CountryCode?>? onChanged;
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, CountryCode? countryCode)?
      pickerBuilder;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, CountryCode countryCode)?
      countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  @override
  // ignore: no_logic_in_create_state
  _CountryListPickState createState() {
    List<Map> jsonList = theme?.showEnglishName ?? true ? countriesEnglish : codes;

    //  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    //String languageCode=prefs.getString('languageCode')?? 'it';
    //String countryCode =prefs.getString('countryCode')??'IT';

    SharedPreferencesLocale sp= SharedPreferencesLocale();
    String languageCode =sp.fetchLocale().toString();



    bool? isEnabled;
    List elements = jsonList
        .map((s) => CountryCode(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              flagUri: 'assets/images/flags/${s['code'].toLowerCase()}.png',
              isEnabled:s['isEnabled'],
            ))
        .toList();

    // FILTRE THE LIST MARKET ENABLED : LIST CONTRY EANBLED
    List CountryEnabled = [];

    for (int i = 0; i < elements.length; i++) {
      String codeCountry = elements[i].code;
     // String countryEnabled = elements[i].isEnabled;

      String enabled="true";

      if(elements[i].isEnabled == enabled) {
        CountryEnabled.add(elements[i]);
      }
      // if (codeCountry == "IT" ||
      //     codeCountry == 'FR' ||
      //     codeCountry == 'ES' ||
      //     codeCountry == 'DE' ||
      //     codeCountry == 'SN' ||
      //     codeCountry == 'NG') {
      //   CountryEnabled.add(elements[i]);
      // }
    }
    return _CountryListPickState(CountryEnabled);
  }
}

class _CountryListPickState extends State<CountryListPick> {



  CountryCode? selectedItem;
  List elements = [];

  _CountryListPickState(this.elements);



  @override
  void initState() {

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) =>
              (e.code.toUpperCase() ==
                  widget.initialSelection!.toUpperCase()) ||
              (e.dialCode == widget.initialSelection),
          orElse: () => elements[0] as CountryCode);
    } else {
      /// check language default not set the fist element of list


      // for(var i in elements){
      //   if(languageCode.substring(3)== i.code){
      //     selectedItem = i;
      //     break;
      //   } {
      //      selectedItem = elements[0];
      //   }
      // }

      selectedItem = elements[0];
    }

    super.initState();
  }

  void _awaitFromSelectScreen(BuildContext context,
      PreferredSizeWidget? appBar, CountryTheme? theme) async {
    final result = await Navigator.push( context,
        MaterialPageRoute(
          builder: (context) => SelectionList(
            elements,
            selectedItem,
            appBar: widget.appBar ??
                AppBar(
                  backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                  title: Text(AppLocalizations.translate('pickCountry').toString()),

                ),
            theme: theme,
            countryBuilder: widget.countryBuilder,
            useUiOverlay: widget.useUiOverlay,
            useSafeArea: widget.useSafeArea,
          ),
        ));

    setState(() {
      selectedItem = result ?? selectedItem;
      widget.onChanged!(result ?? selectedItem);
      String codeContry = result.code;

    //  updateLang(codeContry);

      //  ChangeLanguage(codeContry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _awaitFromSelectScreen(context, widget.appBar, widget.theme);
      },
      child: widget.pickerBuilder != null
          ? widget.pickerBuilder!(context, selectedItem)
          : Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (widget.theme?.isShowFlag ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        selectedItem!.flagUri!,
                        // package: 'country_list_pick',
                        width: 32.0,
                      ),
                    ),
                  ),
                if (widget.theme?.isShowCode ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(selectedItem.toString()),
                    ),
                  ),
                if (widget.theme?.isShowTitle ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(selectedItem!.toCountryStringOnly()),
                    ),
                  ),
                if (widget.theme?.isDownIcon ?? true == true)
                  const Flexible(
                    child: Icon(Icons.keyboard_arrow_down),
                  )
              ],
            ),
    );
  }

  // void updateLang(String? codeLanguageChange) {
  //   if (codeLanguageChange == "DE") {
  //     //  setState(() {
  //     AppLocalizations.load(const Locale('de', 'DE'));
  //     //  });
  //     if (codeLanguageChange == "DE") {
  //       AppLocalizations.load(const Locale('de_DE'));
  //     } else if (codeLanguageChange == "IT") {
  //       AppLocalizations.load(const Locale('it_IT'));
  //     } else if (codeLanguageChange == "FR") {
  //       AppLocalizations.load(const Locale('fr_FR'));
  //       MyApp.of(context).setLocale(const Locale('fr_FR'));
  //     } else if (codeLanguageChange == "ES") {
  //       AppLocalizations.load(const Locale('es_ES'));
  //     } else if (codeLanguageChange == "SN") {
  //       AppLocalizations.load(const Locale('sn_SN'));
  //     } else if (codeLanguageChange == "NG") {
  //       AppLocalizations.load(const Locale('ng_NG'));
  //     }
  //
  //     checkLang(codeLanguageChange);
  //   }
  //
  // }

  void checkLang(locale) {

    // These delegates make sure that the localization data for the proper language is loaded
    localizationsDelegates: const [

      // THIS CLASS WILL BE ADDED LATER
      // A class which loads the translations from JSON files
      AppLocalizations.delegate,
      // Built-in localization of basic text for Material widgets
      GlobalMaterialLocalizations.delegate,

      GlobalCupertinoLocalizations.delegate,
      // Built-in localization for text direction LTR/RTL
      GlobalWidgetsLocalizations.delegate,
    ];
    // supportedLocales: AppLocalizations.supportedLocales,
    // Returns a locale which will be used by the app
    localeResolutionCallback: (locale, supportedLocales) {
      // Check if the current device locale is supported
      // for (var supportedLocale in supportedLocales) {
      //   if (supportedLocale.languageCode == locale!.languageCode &&
      //       supportedLocale.countryCode == locale.countryCode) {
      //     return supportedLocale;
      //   }
      // }
      // If the locale of the device is not supported, use the first one
      // from the list (English, in this case).
      return supportedLocales.first;
    };
  }


}
