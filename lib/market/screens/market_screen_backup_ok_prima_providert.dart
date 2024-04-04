import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:analyzer/file_system/file_system.dart';
import 'package:ecobioweb/market/providers/market_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../market/components/market.dart';
import '../../roots/trunk/branches/cart/screens/cart_screen.dart';
import '../../roots/trunk/branches/commun_data_utils/utils/helper/padded.dart';
import '../../roots/trunk/branches/commun_data_utils/utils/theme/app_theme.dart';
import '../../roots/trunk/branches/favorites/screens/favourite_screen.dart';
import '../../roots/trunk/branches/favorites/screens/filter_screen.dart';
import '../../roots/trunk/branches/localisation/country/components/code_country.dart';
import '../../roots/trunk/branches/localisation/country/components/country_selection_theme.dart';
import '../../roots/trunk/branches/localisation/translation/components/appLocalizations.dart';
import '../../roots/trunk/branches/search/widgets/search_bar_widget.dart';
//import 'globals.dart' as globals;

class MarketScreen extends StatefulWidget {


  MarketScreen(
      {Key? key,
     ///   this.elements,
        this.markets,
        this.initialMarketSelection,
       /// this.initialSelection,
        this.isInitialLang,
        this.currentCodeLang,
        this.appBar,
        this.theme,
        this.countryBuilder,
        this.useUiOverlay = true,
        this.useSafeArea = false, })
      : super(key: key);

  final PreferredSizeWidget? appBar;

  final List? markets;
 // final List? elements;

 /// final CountryCode? initialSelection;
  final Market? initialMarketSelection;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, CountryCode)? countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;
  bool? isInitialLang;
  final  String? currentCodeLang;

  @override
  _SelectionListMarketState createState() => _SelectionListMarketState();
}

class _SelectionListMarketState extends State<MarketScreen> {
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

  // Store dynamic changeable locale settings here, they change with the system changes
  late String currentDefaultSystemLocale;
  late List<Locale> currentSystemLocales;

  // CountryCode? selectedItem;

     Market?  initialMarketSelection;

  List elements = [];

  PreferredSizeWidget? appBar;
  CountryTheme? theme;

  TextEditingController textInputSearch =  TextEditingController();

  //final LocalStorage storage = new LocalStorage('localstorage_app');

  @override
  void initState() {
    countries = widget.markets!;
    countries.sort((a, b) {
      return a.name.compareTo(b.name.toString());
    });
    // // elements=countries;
    // // selectedItem=widget.initialSelection;
    ///_awaitFromSelectScreen(context, widget.appBar,theme);
    // _controllerScroll = ScrollController();
    // _controllerScroll!.addListener(_scrollListener);
    super.initState();
  }
  // /// LIST CONTRY - CHANGE LANGUAGE CONTRY
  // void _awaitFromSelectScreen(BuildContext context,
  //     PreferredSizeWidget? appBar, CountryTheme? theme) async {
  //   final result = await Navigator.push( context,
  //       MaterialPageRoute(
  //         builder: (context) => SelectionList(
  //           widget.elements,
  //           widget.initialSelection,
  //           appBar: widget.appBar ??
  //               AppBar(
  //                 backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
  //                 title: Text(AppLocalizations.translate('pickCountry').toString()),
  //
  //               ),
  //           theme: theme,
  //           countryBuilder: widget.countryBuilder,
  //           useUiOverlay: widget.useUiOverlay,
  //           useSafeArea: widget.useSafeArea,
  //         ),
  //       )
  //   );
  //
  //   setState(() {
  //     selectedItem = result ?? selectedItem!;
  //   });
  // }
  void _sendDataBack(BuildContext context,PreferredSizeWidget? appBar, CountryTheme? theme, Market initialSelection,List elements ) {
    initialMarketSelection=initialSelection;
    /// elements
    Navigator.pop(context, initialSelection);
  }

  final List _alphabet =
  List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers:  [
      ChangeNotifierProvider<MarketProvider>(create: (_)=>MarketProvider()),
      // ChangeNotifierProvider<AgricultureBiologicalProvider>(create: (_) => AgricultureBiologicalProvider()),
    ],
      child: Navigator(onGenerateRoute: (RouteSettings settings){

        return MaterialPageRoute(builder: (context){
          return MarketScreen();
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


        // int tabIndex=0;
        // final cartProvider=Provider.of<CartProvider>(context);
        // final agriBio=Provider.of<AgricultureBiologicalProvider>(context);
        //
        // var listProducts= context.read<AgricultureBiologicalProvider>().getData(tabIndex);
        //
        // cartItems=context.read<CartProvider>().cartItems;
        // //  products =context.read<CartProvider>().products;
        // products =context.read<CartProvider>().getProducts();


       // return Scaffold(

          body:
          // Builder(builder: (context){
          //   return
            //  Column(
                //children:<Widget> [

                  /// Title Agriculture Biodynamic
                  /// createSubTitle(),

              return   Container(
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
                                            widget.initialMarketSelection!.flagUri!,
                                            // package: 'country_list_pick',
                                            width: 32.0,
                                          ),
                                          title: Text(widget.initialMarketSelection!.name),
                                          subtitle:const Text("Mercato Abilitato ") ,
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
                                delegate: SliverChildBuilderDelegate((context, index) {return widget.countryBuilder != null ? widget.countryBuilder!( context, countries.elementAt(index)): getListCountry(countries.elementAt(index));
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
                                    children: [...List.generate(_alphabet.length, (index) => _getAlphabetItem(index))],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                  );
                  // Expanded(
                  //   // padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   // height: MediaQuery.of(context).size.height * 100,
                  //   child: SingleChildScrollView(
                  //     child: StaggeredGrid.count(
                  //       crossAxisCount: 2,
                  //       mainAxisSpacing: 3.0,
                  //       crossAxisSpacing: 0.0,
                  //       // I only need two card horizontally
                  //       children: productsFavorite.asMap().entries.map<Widget>((e) {
                  //         // GroceryItem groceryItem = e.value;
                  //         Product product = e.value;
                  //         return GestureDetector(
                  //           onTap: () {
                  //             onItemClicked(context, product);
                  //           },
                  //           child: Container(
                  //             padding: const EdgeInsets.all(10),
                  //             child: GroceryItemCardWidget(
                  //               item: product,
                  //               heroSuffix: "favorite_screen",
                  //             ),
                  //           ),
                  //         );
                  //       }).toList(), // add some space
                  //     ),
                  //   ),
                  // ),
               // ]
           // );
           // }
         // ),
       // );
      },
    );

  }

  // @override
  // Widget buildFist(BuildContext context) {
  //
  //   if (widget.useUiOverlay) {
  //     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //       statusBarColor: Colors.white,
  //       statusBarIconBrightness: Brightness.dark,
  //       systemNavigationBarColor: Colors.white,
  //       systemNavigationBarIconBrightness: Brightness.dark,
  //       statusBarBrightness: !kIsWeb ? Brightness.dark : Brightness.light,
  //     ));
  //   }
  //   height = MediaQuery.of(context).size.height;
  //   search = AppLocalizations.translate('search');
  //   search_point =
  //   // AppLocalizations.of(context)!.translate('search_point');
  //   AppLocalizations.translate('search_point');
  //   last_pick = AppLocalizations.translate('last_picks');
  //   //search_point = Translation.search(context)!;
  //
  //   Widget scaffold = Scaffold(
  //     appBar: widget.appBar,
  //     //  appBar: AppBar(
  //     //    title: Text(AppLocalizations.translate("back").toString()),
  //     //    backgroundColor: const Color.fromARGB(255, 50, 172, 34),
  //     //    leading: BackButton(
  //     //      color: Colors.black,
  //     //      onPressed: () {
  //     //        //   Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
  //     //        // Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
  //     //        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
  //     //        );
  //     //      },
  //     //    ),
  //     //  ),
  //     body: Container(
  //       color: const Color(0xfff4f4f4),
  //       child: LayoutBuilder(builder: (context, contrainsts) {
  //         diff = height - contrainsts.biggest.height;
  //         _heightscroller = (contrainsts.biggest.height) / _alphabet.length;
  //         _sizeheightcontainer = (contrainsts.biggest.height);
  //         return Stack(
  //           children: <Widget>[
  //             CustomScrollView(
  //               controller: _controllerScroll,
  //               physics: const AlwaysScrollableScrollPhysics(),
  //               slivers: [
  //                 SliverToBoxAdapter(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.all(15.0),
  //                         child: Text(
  //                           widget.theme?.searchText ?? search,
  //                           style: TextStyle(
  //                               color:
  //                               widget.theme?.labelColor ?? Colors.black),
  //                         ),
  //                       ),
  //                       Container(
  //                         color: Colors.white,
  //                         child: TextField(
  //                           controller: _controller,
  //                           decoration: InputDecoration(
  //                             border: InputBorder.none,
  //                             focusedBorder: InputBorder.none,
  //                             enabledBorder: InputBorder.none,
  //                             errorBorder: InputBorder.none,
  //                             disabledBorder: InputBorder.none,
  //                             contentPadding: const EdgeInsets.only(
  //                                 left: 15, bottom: 0, top: 0, right: 15),
  //                             hintText:
  //                             widget.theme?.searchHintText ?? search_point,
  //                           ),
  //                           onChanged: _filterElements,
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(15.0),
  //                         child: Text(
  //                           widget.theme?.lastPickText ?? search_point,
  //                           style: TextStyle(
  //                               color:
  //                               widget.theme?.labelColor ?? Colors.black),
  //                         ),
  //                       ),
  //                       Container(
  //                         color: Colors.white,
  //                         child: Material(
  //                           color: Colors.transparent,
  //                           child: ListTile(
  //                             leading: Image.asset(
  //                               widget.initialMarketSelection!.flagUri!,
  //                               // package: 'country_list_pick',
  //                               width: 32.0,
  //                             ),
  //                             title: Text(widget.initialMarketSelection!.name),
  //                             subtitle:const Text("Mercato Abilitato ") ,
  //                             trailing: const Padding(
  //                               padding: EdgeInsets.only(right: 20.0),
  //                               child: Icon(Icons.check, color: Colors.green),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(height: 15),
  //                     ],
  //                   ),
  //                 ),
  //                 SliverList(
  //                   delegate: SliverChildBuilderDelegate((context, index) {return widget.countryBuilder != null ? widget.countryBuilder!( context, countries.elementAt(index)): getListCountry(countries.elementAt(index));
  //                   }, childCount: countries.length),
  //                 )
  //               ],
  //             ),
  //             if (isShow == true)
  //               Align(
  //                 alignment: Alignment.centerRight,
  //                 child: GestureDetector(
  //                   onVerticalDragUpdate: _onVerticalDragUpdate,
  //                   onVerticalDragStart: _onVerticalDragStart,
  //                   child: Container(
  //                     height: 20.0 * 30,
  //                     color: Colors.transparent,
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [...List.generate(_alphabet.length, (index) => _getAlphabetItem(index))],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //           ],
  //         );
  //       }),
  //     ),
  //   );
  //   return widget.useSafeArea ? SafeArea(child: scaffold) : scaffold;
  // }

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
              elements=countries;
              initialMarketSelection=market;


              //AppLocalizations.saveLanguageApp(currentCodeLangApp!,true);

              _sendDataBack(context,widget.appBar, widget.theme, initialMarketSelection!,elements);
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
              for (var i = 0; i < countries.length; i++) {
                if (_text.compareTo( countries[i].name.toUpperCase()[0]) == 0) {
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
      countries = widget.markets
      !.where((e) =>
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

                .compareTo(countries[i].name.toUpperCase()[0]) ==
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
