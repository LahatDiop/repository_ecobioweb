import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:analyzer/file_system/file_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../../market/components/market.dart';
import '../../roots/trunk/branches/business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../roots/trunk/branches/localisation/country/components/country_selection_theme.dart';
import '../../roots/trunk/branches/localisation/translation/components/appLocalizations.dart';
import '../../roots/trunk/branches/menu/menu_settings/settings/admin/screens/setting_screen.dart';
import '../providers/market_provider.dart';
//import 'globals.dart' as globals;

class SelectionMarketDetail extends StatefulWidget {


   SelectionMarketDetail(
      {Key? key,
      this.markets,
      this.marketSelected,
      this.isInitialLoadMarket,
      this.isInitialLang,
      this.currentCodeLang,
      this.appBar,
      this.theme,
      this.marketBuilder,
      this.useUiOverlay = true,
      this.useSafeArea = false,
      this.initialSelection, })
      : super(key: key);

  final PreferredSizeWidget? appBar;

  final Market? initialSelection;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, Market)? marketBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;
  bool? isInitialLang;

  final  String? currentCodeLang;
  // List<Market> markets=[];
   List<Market>? markets;
   final Market? marketSelected;
   final bool? isInitialLoadMarket;

  @override
  _SelectionListMarketState createState() => _SelectionListMarketState();
}

class _SelectionListMarketState extends State<SelectionMarketDetail> {
  //late List countries;
  /// LIST MARKET  ENABLED
  List<Market> markets=[];

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

  // Store dynamic changeable locale settings here, they change with the system changes
  late String currentDefaultSystemLocale;
  late List<Locale> currentSystemLocales;

  Market? selectedItem;

  // List elements = [];

  PreferredSizeWidget? appBar;
  CountryTheme? theme;

  /// MARKET SELECTED
  Market?  marketSelected;

  void _sendDataBack(BuildContext context,PreferredSizeWidget? appBar, CountryTheme? theme, Market marketSelected,List markets ) {
    selectedItem=marketSelected;
   /// elements
    Navigator.pop(context, marketSelected);
  }

  final List _alphabet =
      List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers:  [
      ChangeNotifierProvider<MarketProvider>(create: (_)=>MarketProvider()),
      ChangeNotifierProvider<AgricultureBiologicalProvider>(create: (_) => AgricultureBiologicalProvider()),
    ],
        child: Navigator(onGenerateRoute: (RouteSettings settings){

          return MaterialPageRoute(builder: (context){
            return SelectionMarketDetail();
          });
        },),

        builder: (context,child){

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
          search = AppLocalizations.translate('search');
          search_point =
          // AppLocalizations.of(context)!.translate('search_point');
          AppLocalizations.translate('search_point');
          last_pick = AppLocalizations.translate('last_picks');
          //search_point = Translation.search(context)!;

          /// GIULIA   61247358290   2+1=7

          final marketProvider=Provider.of<MarketProvider>(context);

          /// UPDAT E MARKET ON CHANGE
          var updatProvider=context.read<MarketProvider>().updateMarketSelected(widget.marketSelected);

          marketSelected=context.read<MarketProvider>().marketSelected;
          /// LOADER DATA MARKET : if i have load the list market the fist run

        ///  isInitialLoadMarket = context.read<MarketProvider>().isInitialLoadMarket;

          // if(isInitialLoadMarket){
          //   var marketsEnabledGet= context.read<MarketProvider>().getDataMarket(context,currentCodeLang);
          // }

          /// LIST MARKET ENABLED
          // markets= context.read<MarketProvider>().markets;
          //
          // markets.sort((a,b){
          //   return a.name.compareTo(b.name.toString());
          // });



          return Scaffold(
            appBar: AppBar(
              // backgroundColor: const Color.fromRGBO(250, 101, 243, 105),
              // toolbarHeight: 60.0,
              toolbarHeight: 50.0,
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  //   Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                  // Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                  Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                  );
                },
              ),
              /// title: SearchBarWidget(textInputSearch),
              // title: Padded.padded(SearchBarWidget(textInputSearch)),

            ),

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
                                      widget.marketSelected!.flagUri!,
                                      // package: 'country_list_pick',
                                      width: 32.0,
                                    ),
                                    title: Text(widget.marketSelected!.name),
                                    subtitle:const Text("Mercato Abilitato") ,
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
                        // SliverList(
                        //   delegate: SliverChildBuilderDelegate((context, index) {return widget.marketBuilder != null ? widget.marketBuilder!( context, markets.elementAt(index)): getListCountry(markets.elementAt(index));
                        //   }, childCount: markets.length),
                        // )
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
                              children: [...List.generate(_alphabet.length, (index) => _getAlphabetItem(index))],
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }),
            ),
          );

         // return widget.useSafeArea ? SafeArea(child: scaffold) : scaffold;
        }
    );


  }

  @override
  Widget buildOK(BuildContext context) {

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
    search = AppLocalizations.translate('search');
    search_point =
        // AppLocalizations.of(context)!.translate('search_point');
        AppLocalizations.translate('search_point');
    last_pick = AppLocalizations.translate('last_picks');
    //search_point = Translation.search(context)!;

    Widget scaffold = Scaffold(
     appBar: widget.appBar,
     //  appBar: AppBar(
     //    title: Text(AppLocalizations.translate("back").toString()),
     //    backgroundColor: const Color.fromARGB(255, 50, 172, 34),
     //    leading: BackButton(
     //      color: Colors.black,
     //      onPressed: () {
     //        //   Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
     //        // Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
     //        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
     //        );
     //      },
     //    ),
     //  ),
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
                                widget.marketSelected!.flagUri!,
                                // package: 'country_list_pick',
                                width: 32.0,
                              ),
                              title: Text(widget.marketSelected!.name),
                              subtitle:const Text("Mercato Abilitato") ,
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
                    delegate: SliverChildBuilderDelegate((context, index) {return widget.marketBuilder != null ? widget.marketBuilder!( context, markets.elementAt(index)): getListCountry(markets.elementAt(index));
                    }, childCount: markets.length),
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
                        children: [...List.generate(_alphabet.length, (index) => _getAlphabetItem(index))],
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

  Widget getListCountry(Market market) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          leading: Image.asset(
            market.flagUri!,
            //    package: 'country_list_pick',
            width: 30.0,
          ),
          title: Text(market.name!),

          //  onTap: () async { await homeController.setLanguage("EN") .then((value) async { await context .setLocale( const Locale( "en")); }) },
        /// CHANGE MERCATO

          onTap: () {

            String? currentCodeLangApp = market.code;
            String? nameLanguageCodeChange = market.name;
            bool isInitializedLang=true;

             selectedItem=market;


           //AppLocalizations.saveLanguageApp(currentCodeLangApp!,true);

        _sendDataBack(context,widget.appBar, widget.theme, market,markets);
              //   sendDataBack(context, e);
              //  Utils.updateLocalLanguage(context, codeLanguage);
            }
          //},
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
              for (var i = 0; i < markets.length; i++) {
                if (_text.compareTo( markets[i].name.toUpperCase()[0]) == 0) {
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
      markets = widget.markets
          !.where((e) =>
              e.code.contains(s) ||
              e.dialCode!.contains(s) ||
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
          for (var i = 0; i < markets.length; i++) {
            if (_text
                    
                    .compareTo(markets[i].name.toUpperCase()[0]) ==
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
    if (scrollPosition < markets.length) {
      String? countryName = markets.elementAt(scrollPosition).name;
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

    // List<Market> market = json.decode(globals.marketJson);
    //
    // market[0] = true as Market;
    // // market[0]['companyName'] = "NewCompany";
    // globals.marketJson = json.encode(market);
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


  @override
  void didChangeLocales(List<Locale> locale) {
    // This is run when system locales are changed
   // super.didChangeLocales(locale);
    // Update state with the new values and redraw controls
    setState(() {
      setCurrentValues();
    });
  }


  // Here we read the current locale values
  void setCurrentValues() {
    currentSystemLocales = WidgetsBinding.instance.window.locales;
    currentDefaultSystemLocale = Platform.localeName;
  }


  //  changeLang(String? codeLanguageChange) async {
  //
  //    var prefs= await SharedPreferences.getInstance();
  //
  //    /// Controllo se non è stato salvato un code lingue "it" prendo la lingue del dispositivi o del local
  //
  //    /// code lingua actualle
  //    String? currentCodeLang = prefs.getString("currentCodeLang");
  //
  //
  //    ///"en_US"
  //    String localeDefault = Intl.getCurrentLocale();
  //    ///it_IT
  //    Locale deviceLocale = window.locale;// or html.window.locale
  //    ///"it"
  //    String languageCodeDevice = deviceLocale.languageCode;
  //
  //   // String defaultSystemLocale=Platform.localeName;
  //   // AppLocalizations appLocalizations = AppLocalizations(defaultSystemLocale as Locale);
  //    //   if(defaultSystemLocale != codeLanguageChange ){
  //             /// update app if you change a linguage
  //    AppLocalizations.loadLanguageApp(languageCode,true);
  //
  //
  // }
}
