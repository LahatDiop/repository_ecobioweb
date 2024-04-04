
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../commun_data_utils/utils/helper/subtitle.dart';
import '../../../database/storages/locale/shared_preferences_locale.dart';
import '../../../menu/menu_settings/settings/admin/screens/setting_screen.dart';
import '../../translation/components/appLocalizations.dart';
import '../components/code_country.dart';
import '../components/code_countrys.dart';
import '../components/country_selection_theme.dart';
import '../components/selection_list.dart';
import '../screens/code_countries_en.dart';
export '../components/country_selection_theme.dart';

class CountryListPick extends StatefulWidget {

  CountryListPick(
      {super.key,
        this.onChanged,
        this.initialSelection,
        this.isInitialLang,
        this.currentCodeLang,
        this.appBar,
        this.pickerBuilder,
        this.countryBuilder,
        this.theme,
        this.useUiOverlay = true,
        this.useSafeArea = false});

  CountryCode? initialSelection;
   String? currentCodeLang;
  bool? isInitialLang;

  static bool? isInitializedLang = true;
  final ValueChanged<CountryCode?>? onChanged;
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, CountryCode? countryCode)?
  pickerBuilder;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, CountryCode countryCode)?
  countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  // ignore: no_logic_in_create_state
  CountryListPickState createState()  {

 ///List<Map> jsonListaa = theme?.showEnglishName ?? true ? countriesEnglish : codes;
    List<Map> jsonList = theme?.showEnglishName ?? true ? codes : codes;

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
    List countryEnabled = [];

    for (int i = 0; i < elements.length; i++) {
      String codeCountry = elements[i].code;
      // String countryEnabled = elements[i].isEnabled;

      String enabled="true";

      if(elements[i].isEnabled !="null" && elements[i].isEnabled == enabled) {
        countryEnabled.add(elements[i]);
      }
    }
    return CountryListPickState(countryEnabled,currentCodeLang);
  }
}

class CountryListPickState extends State<CountryListPick> {

  CountryListPickState(this.elements, this.currentCodeLang);

  late List countries;
  late List elements;
  CountryCode? selectedItem;

  CountryCode? initialSelection;
  // bool? initialSelectionLang;
  bool? isInitialLang;
  String? currentCodeLang;
  ValueChanged<CountryCode?>? onChanged;
  CountryCode? currentCountryCode;

  List elementsCountryEnabled = [];

  final TextEditingController _controller = TextEditingController();
  ScrollController? _controllerScroll;

  @override
  ///1
  void initState() {
    super.initState();

    countries = elements;
    countries.sort((a, b) {
      return a.name.toString().compareTo(b.name.toString());
    });

     setSelectedItem(currentCodeLang!);

 ///  _awaitFromSelectScreen(context, widget.appBar, widget.theme);
  }
  Future <void> setSelectedItem(String currentCodeLang) async {
    for(CountryCode countryCode in elements){
      if(countryCode.code.toString().toLowerCase() == currentCodeLang.toString().toLowerCase()){
        elementsCountryEnabled.add(countryCode);
        currentCountryCode =countryCode;
        /// this.initialSelection!=countryCode;
        selectedItem = currentCountryCode;
        break;
        ///elements.setRange(start, end, iterable)
      }
    }

    selectedItem;
  }

  /// LIST CONTRY - CHANGE LANGUAGE CONTRY
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
        )
    );

    setState(() {
      selectedItem = result ?? selectedItem!;
    });
  }
  /// PAGE INIATIAL LANGUANGE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.translate('back'),
          style: const TextStyle(color: Colors.black),
        ),


        leading: Navigator.canPop(context)
            ? IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 47,
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
            : null,

        
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Container(
        //     child: const Icon(
        //       Icons.keyboard_backspace,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children:<Widget> [
              Center(
                child:  SubTitle.createSubTitleCenter("country"),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Center(
                child:  TextButton(
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
                ),

              ),
            ],
          )
      ),
    );


  }





// String checkLangInitialized() {
//
//   SharedPreferencesLocale pref = SharedPreferencesLocale();
//   /// code lingua actualle
//   String? currentCodeLang = pref.fetchCurrentCodeLang().toString();
//
//   return currentCodeLang;
// }


}
