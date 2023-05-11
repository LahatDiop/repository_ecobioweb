import 'package:flutter/material.dart';
import '../../translation/components/appLocalizations.dart';
import '../components/code_country.dart';
import '../components/code_countrys.dart';
import '../components/country_selection_theme.dart';
import '../components/selection_list.dart';
import '../screens/code_countries_en.dart';
export '../components/country_selection_theme.dart';

class CountryListPick extends StatefulWidget {
  const CountryListPick(
      {this.onChanged,
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
    List<Map> jsonList =
        // ignore: unnecessary_this
        this.theme?.showEnglishName ?? true ? countriesEnglish : codes;

    List elements = jsonList
        .map((s) => CountryCode(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              flagUri: '/images/flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    // FILTRE THE LIST MARKET ENABLED : LIST CONTRY EANBLED
    List CountryEnabled = [];

    for (int i = 0; i < elements.length; i++) {
      String codeCountry = elements[i].code;

      if (codeCountry == "IT" ||
          codeCountry == 'FR' ||
          codeCountry == 'ES' ||
          codeCountry == 'DE' ||
          codeCountry == 'SN' ||
          codeCountry == 'NG') {
        CountryEnabled.add(elements[i]);
      }
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
      selectedItem = elements[0];
    }

    super.initState();
  }

  void _awaitFromSelectScreen(BuildContext conmetext,
      PreferredSizeWidget? appBar, CountryTheme? theme) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectionList(
            elements,
            selectedItem,
            appBar: widget.appBar ??
                AppBar(
                  backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                  title: Text(
                      AppLocalizations.translate('pickCountry').toString()),
                  //  title: const Text("Select Country"),
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

      updateLang(codeContry);

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

  void updateLang(String? codeLanguageChange) {
    if (codeLanguageChange == "DE") {
      //  setState(() {
      AppLocalizations.load(const Locale('de', 'DE'));
      //  });

      // AppLocalizations.of(context)?.locale = const Locale('de', 'DE');
    } else if (codeLanguageChange == "IT") {
      AppLocalizations.load(const Locale('it', 'IT'));
    } else if (codeLanguageChange == "FR") {
      AppLocalizations.load(const Locale('fr', 'FR'));
    } else if (codeLanguageChange == "ES") {
      AppLocalizations.load(const Locale('es', 'ES'));
    } else if (codeLanguageChange == "SN") {
      AppLocalizations.load(const Locale('sn', 'SN'));
    } else if (codeLanguageChange == "NG") {
      AppLocalizations.load(const Locale('ng', 'NG'));
    }
  }
}
