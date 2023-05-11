import 'dart:convert';
import 'dart:io';

import 'package:analyzer/file_system/file_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../market/components/market.dart';
import '../../translation/components/appLocalizations.dart';
import '../widget/country_list_pick.dart';
import 'code_country.dart';
import "/commonUtils/globals.dart" as globals;

class SelectionList extends StatefulWidget {
  const SelectionList(this.elements, this.initialSelection,
      {Key? key,
      this.appBar,
      this.theme,
      this.countryBuilder,
      this.useUiOverlay = true,
      this.useSafeArea = false})
      : super(key: key);

  final PreferredSizeWidget? appBar;
  final List elements;
  final CountryCode? initialSelection;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, CountryCode)? countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  @override
  _SelectionListState createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {
  late List countries;
  final TextEditingController _controller = TextEditingController();
  ScrollController? _controllerScroll;
  var diff = 0.0;

  var posSelected = 0;
  var height = 0.0;
  late var _sizeheightcontainer;
  late var _heightscroller;
  var _text;
  var _oldtext;
  final _itemsizeheight = 50.0;
  double _offsetContainer = 0.0;

  bool isShow = true;

  String search = "";
  String search_point = "";
  String last_pick = "";

  //final LocalStorage storage = new LocalStorage('localstorage_app');

  @override
  void initState() {
    countries = widget.elements;
    countries.sort((a, b) {
      return a.name.toString().compareTo(b.name.toString());
    });
    _controllerScroll = ScrollController();
    _controllerScroll!.addListener(_scrollListener);
    super.initState();
  }

  void _sendDataBack(BuildContext context, CountryCode initialSelection) {
    Navigator.pop(context, initialSelection);
  }

  final List _alphabet =
      List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));

  @override
  Widget build(BuildContext context) {
    if (widget.useUiOverlay) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: !kIsWeb ? Brightness.dark : Brightness.light,
      ));
    }
    height = MediaQuery.of(context).size.height;
    search = AppLocalizations.translate('search').toString();
    search_point =
        // AppLocalizations.of(context)!.translate('search_point').toString();
        AppLocalizations.translate('search_point').toString();
    last_pick = AppLocalizations.translate('last_pick').toString();
    //search_point = Translation.search(context)!;

    Widget scaffold = Scaffold(
      appBar: widget.appBar,
      body: Container(
        color: const Color(0xfff4f4f4),
        child: LayoutBuilder(builder: (context, contrainsts) {
          diff = height - contrainsts.biggest.height;
          _heightscroller = (contrainsts.biggest.height) / _alphabet.length;
          _sizeheightcontainer = (contrainsts.biggest.height);
          return Stack(
            children: <Widget>[
              CustomScrollView(
                controller: _controllerScroll,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            widget.theme?.searchText ?? search,
                            style: TextStyle(
                                color:
                                    widget.theme?.labelColor ?? Colors.black),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 0, top: 0, right: 15),
                              hintText:
                                  widget.theme?.searchHintText ?? search_point,
                            ),
                            onChanged: _filterElements,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            widget.theme?.lastPickText ?? search_point,
                            style: TextStyle(
                                color:
                                    widget.theme?.labelColor ?? Colors.black),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Image.asset(
                                widget.initialSelection!.flagUri!,
                                // package: 'country_list_pick',
                                width: 32.0,
                              ),
                              title: Text(widget.initialSelection!.name!),
                              trailing: const Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Icon(Icons.check, color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return widget.countryBuilder != null
                          ? widget.countryBuilder!(
                              context, countries.elementAt(index))
                          : getListCountry(countries.elementAt(index));
                    }, childCount: countries.length),
                  )
                ],
              ),
              if (isShow == true)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragStart: _onVerticalDragStart,
                    child: Container(
                      height: 20.0 * 30,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [...List.generate(_alphabet.length,
                                (index) => _getAlphabetItem(index))],
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
    return widget.useSafeArea ? SafeArea(child: scaffold) : scaffold;
  }

  Widget getListCountry(CountryCode e) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          leading: Image.asset(
            e.flagUri!,
            //    package: 'country_list_pick',
            width: 30.0,
          ),
          title: Text(e.name!),

          //  onTap: () async { await homeController.setLanguage("EN") .then((value) async { await context .setLocale( const Locale( "en")); }) },
          onTap: () {
            String? codeLanguageChange = e.code;
            String? nameLanguageCodeChange = e.name;

            //   _sendDataBack(context, e);

            //String codeLanguage = e.code.toString();

            changeLang(codeLanguageChange);

            _sendDataBack(context, e);
            //  Utils.updateLocalLanguage(context, codeLanguage);

            //---> Market Info
            //market();

            //Add Favorites
            //favoriteMarket();
            //  updateJson();
            //    readJsonData();

            //String id = "110";
            // String name = "Italia";

            // setBookmark(id, name);

            //  String? languageLocal = const Utils().languageLocalApp(context);
            // var fromSubtags = const Locale.fromSubtags(languageCode: 'de');
            // final language=await _getLanguage();
            // language change user: if the new linguage is not defaultt change the linguage   APP

            //  setState(() {
            //  AppLocalizations.load(const Locale('en', 'EN'));
            // locale = const Locale('en', 'EN');
            //  MyApp.of(context).setLocale(context, locale);
            // MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'de',));
            //});
            // }

            // MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'de')),
          },
        ),
      ),
    );
  }

  //void main() {
  //  runApp(const MyApp());
  // }

  _getAlphabetItem(int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            posSelected = index;
            _text = _alphabet[posSelected];
            if (_text != _oldtext) {
              for (var i = 0; i < countries.length; i++) {
                if (_text.toString().compareTo(
                        countries[i].name.toString().toUpperCase()[0]) ==
                    0) {
                  _controllerScroll!.jumpTo((i * _itemsizeheight) + 10);
                  break;
                }
              }
              _oldtext = _text;
            }
          });
        },
        child: Container(
          width: 40,
          height: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index == posSelected
                ? widget.theme?.alphabetSelectedBackgroundColor ?? Colors.blue
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            _alphabet[index],
            textAlign: TextAlign.center,
            style: (index == posSelected)
                ? TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        widget.theme?.alphabetSelectedTextColor ?? Colors.white)
                : TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: widget.theme?.alphabetTextColor ?? Colors.black),
          ),
        ),
      ),
    );
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      countries = widget.elements
          .where((e) =>
              e.code.contains(s) ||
              e.dialCode.contains(s) ||
              e.name.toUpperCase().contains(s))
          .toList();
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if ((_offsetContainer + details.delta.dy) >= 0 &&
          (_offsetContainer + details.delta.dy) <=
              (_sizeheightcontainer - _heightscroller)) {
        _offsetContainer += details.delta.dy;
        posSelected =
            ((_offsetContainer / _heightscroller) % _alphabet.length).round();
        _text = _alphabet[posSelected];
        if (_text != _oldtext) {
          for (var i = 0; i < countries.length; i++) {
            if (_text
                    .toString()
                    .compareTo(countries[i].name.toString().toUpperCase()[0]) ==
                0) {
              _controllerScroll!.jumpTo((i * _itemsizeheight) + 15);
              break;
            }
          }
          _oldtext = _text;
        }
      }
    });
  }

  void _onVerticalDragStart(DragStartDetails details) {
    _offsetContainer = details.globalPosition.dy - diff;
  }

  _scrollListener() {
    int scrollPosition =
        (_controllerScroll!.position.pixels / _itemsizeheight).round();
    if (scrollPosition < countries.length) {
      String? countryName = countries.elementAt(scrollPosition).name;
      setState(() {
        posSelected =
            countryName![0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
      });
    }

    if ((_controllerScroll!.offset) >=
        (_controllerScroll!.position.maxScrollExtent)) {}
    if (_controllerScroll!.offset <=
            _controllerScroll!.position.minScrollExtent &&
        !_controllerScroll!.position.outOfRange) {}
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

  Future<void> favoriteMarket() async {
    List<dynamic> marketList = [];
    final String response =
        await rootBundle.loadString('../../assets/json/market.json');
    final data = await json.decode(response);

    marketList = data['market'].map((data) => Market.fromJson(data)).toList();

    /*FutureBuilder<Market>(
      future: jsonToObject(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var object = snapshot.data;
          object!.isFavorite = true;
          return Text(json.encode(object.toJson()));
        } else {
          return const Text("Loading...");
        }
      },
    );
    */
  }

  Future<List<Market>> readJsonData() async {
    //read json file
    //final jsondata = await rootBundle.rootBundle.loadString('assets/data.json');
    final String jsondata =
        await rootBundle.loadString('../../assets/json/market.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    //map json and initialize using DataModel
    return list.map((e) => Market.fromJson(e)).toList();
  }

  updateJson() async {
    // var rawJSON = await json.decode(await DefaultAssetBundle.of(context).loadString('../../assets/json/market.json'));

    List<Market> market = json.decode(globals.marketJson);

    market[0] = true as Market;
    // market[0]['companyName'] = "NewCompany";
    globals.marketJson = json.encode(market);
  }

  Future setBookmark(String id, String name) async {
    //  String questionId = "110";
    // String name = "Italia";
    File jsonFile;
    Directory dir;
    String fileName = "Reading.json";
    bool fileExists = false;
    List<Map> fileContent;

    List<dynamic> marketList = [];
    final String response =
        await rootBundle.loadString('../../assets/json/market.json');
    final data = await json.decode(response);

    marketList = data['market'].map((data) => Market.fromJson(data)).toList();

    // update the list
    marketList.firstWhere((question) => question.id == id).bookmark = name;
    // and write it
    // jsonFile = new File(dir.path + "/" + fileName);
    jsonFile = data;
    // fileExists = jsonFile.existsSync();
    fileExists = jsonFile.exists;
    if (fileExists) {
      setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    }

    jsonFile.writeAsStringSync(json.encode(marketList));
  }

  void changeLang(String? codeLanguageChange) {
    if (codeLanguageChange == "DE") {
      setState(() {
        AppLocalizations.load(const Locale('de', 'DE'));
      });

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
