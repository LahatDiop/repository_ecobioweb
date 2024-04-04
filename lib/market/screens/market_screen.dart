import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:ecobioweb/market/providers/market_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../../../market/components/market.dart';
import '../../roots/trunk/branches/business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../roots/trunk/branches/localisation/country/components/country_selection_theme.dart';
import '../../roots/trunk/branches/localisation/translation/components/appLocalizations.dart';
import '../../roots/trunk/branches/menu/menu_settings/settings/admin/screens/setting_screen.dart';
import '../widget/selection_market_detail.dart';

//import 'globals.dart' as globals;

class MarketScreen extends StatefulWidget {


  MarketScreen(
      {Key? key,
        this.elements,
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
        this.context, })
      : super(key: key);


  final List? elements;
  final PreferredSizeWidget? appBar;
  BuildContext? context;
  List<Market>? markets;

  final Market? marketSelected;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, Market)? marketBuilder;

  final bool useUiOverlay;
  final bool useSafeArea;
  bool? isInitialLang;
  bool? isInitialLoadMarket=true;
   final  String? currentCodeLang;

  @override
  _SelectionListMarketState createState() => _SelectionListMarketState(currentCodeLang);

}

class _SelectionListMarketState extends State<MarketScreen> {

  bool isInitialLoadMarket=true;

  Market? market ;

  late List countries;

  /// LIST MARKET  ENABLED
    List<Market> markets=[];

  /// LIST MARKET  ENABLED
  List<Market> marketsEnabledList=[];

  List<Market> marketsFilter=[];

  ///MAP MARKET ENABLED
   Map<String, Market> marketsEnabled = {};

  ///  LIST ALL MARKET
    List<Market> marketsAll=[];

  /// MAP ALL MARKET
   Map<String, Market> marketAll = {};

  /// MARKET SELECTED
   Market?  marketSelected;

  ///
   String? currentCodeMarket ;

  _SelectionListMarketState(this.currentCodeLang);

   String? currentCodeLang;

  List elements = [];
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

  PreferredSizeWidget? appBar;
  CountryTheme? theme;

  TextEditingController textInputSearch =  TextEditingController();

   /// ZAYNAB LAHAT BORRACCIA
  @override
  void initState() {
    // markets = widget.markets!;
    // markets.sort((a, b) {
    //   return a.name.compareTo(b.name.toString());
    // });
    //
    // elements=markets;
  //  selectedItem=widget.initialSelection;

    _controllerScroll = ScrollController();
    _controllerScroll!.addListener(_scrollListener);
    super.initState();
  }


  void _sendDataBack(BuildContext context,PreferredSizeWidget? appBar, CountryTheme? theme, Market initialSelection,List markets ) {
    marketSelected=initialSelection;
    /// elements
    Navigator.pop(context, initialSelection);
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
          return MarketScreen();
        });
      },
      ),

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

          /// LOADER DATA MARKET : if i have load the list market the fist run

        isInitialLoadMarket = context.read<MarketProvider>().isInitialLoadMarket;

        if(isInitialLoadMarket){
          var marketsEnabledGet= context.read<MarketProvider>().getDataMarket(context,currentCodeLang);
        }

          /// LIST MARKET ENABLED
          markets= context.read<MarketProvider>().markets;

          markets.sort((a,b){
            return a.name.compareTo(b.name.toString());
          });

        marketsEnabledList= context.read<MarketProvider>().markets;

        marketsEnabledList.sort((a,b){
          return a.name.compareTo(b.name.toString());
        });

        //   marketsEnabledLis=markets;
        //
        // // markets=marketsFilter;
           if(marketsFilter.isNotEmpty){
             markets=marketsFilter;
           }

          marketSelected=context.read<MarketProvider>().marketSelected;

          /// LIST ALL MARKET
          marketsAll= context.read<MarketProvider>().marketsList;

          ///MAP MARKET ENABLED
          marketsEnabled=context.read<MarketProvider>().marketsEnabled;

          /// MAP ALL MARKET
          marketAll =context.read<MarketProvider>().marketsAll;


     //  Widget scaffold = Scaffold(
         // appBar: widget.appBar,
          //     appBar: AppBar(
          //       title: Text(AppLocalizations.translate("back").toString()),
          //       backgroundColor: const Color.fromARGB(255, 50, 172, 34),
          //       leading: BackButton(
          //         color: Colors.black,
          //         onPressed: () {
          //           //   Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
          //           // Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
          //           Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
          //           );
          //         },
          //       ),
          //     ),
         return Container(
            color: const Color(0xfff4f4f4),
            child: LayoutBuilder(builder: (context, contrainsts) {
              diff = height - contrainsts.biggest.height;
              _heightscroller = (contrainsts.biggest.height) / _alphabet.length;
              _sizeheightcontainer = (contrainsts.biggest.height);
              return Stack(
                children: <Widget>[

                  // Flexible(
                  //   flex: 1,
                  //   child: InkWell(
                  //     child: Container(
                  //       child: const Align(
                  //         alignment: Alignment.topLeft,
                  //         child: Icon(Icons.close),
                  //       ),
                  //     ),
                  //     onTap: () {
                  //       // Navigator.pop(context);
                  //       Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()));
                  //     },
                  //   ),
                  // ),
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
                                child:Column(
                                    children:<Widget> [
                                      ListTile(
                                        leading: Image.asset(
                                          marketSelected!.flagUri!,
                                          // package: 'country_list_pick',
                                          width: 32.0,
                                        ),
                                        title: Text("${marketSelected!.name}   ${marketSelected!.dialCode!}" ),
                                        // subtitle: Text(marketSelected!.dialCode!),
                                        trailing: const Padding(
                                          padding: EdgeInsets.only(right: 20.0),
                                          child: Icon(Icons.check, color: Colors.green),
                                        ),

                                      ),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   children:<Widget>[
                                      //     Container(
                                      //       margin: const EdgeInsets.only(left: 30),
                                      //       child:
                                      //       Text( marketSelected!.dialCode!,),
                                      //     ),
                                      //
                                      //   ],
                                      // )
                                    ],
                                )

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
          );
       // );
       //return widget.useSafeArea ? SafeArea(child: scaffold) : scaffold;

    }
    );
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
             title: Text("${market.name}  : ${market.dialCode}" ),

            //  onTap: () async { await homeController.setLanguage("EN") .then((value) async { await context .setLocale( const Locale( "en")); }) },
            /// CHANGE MERCATO

            onTap: () {

              String? currentCodeLangApp = market.code;
              String? nameLanguageCodeChange = market.name;
              bool isInitializedLang=true;
              ///UPDATE MARKET SELECTED

              if(marketSelected==market){
                return;
              }
              marketSelected=market;


           //   _sendDataBack(context,widget.appBar, widget.theme, marketSelected!,markets);
               /// UPDATE MARKET ON CHANGE IN  THE CLASS SelectionMarketDetail

              _awaitFromSelectMarketScreen(context, widget.appBar, widget.theme);
              //AppLocalizations.saveLanguageApp(currentCodeLangApp!,true);


              //   sendDataBack(context, e);
              //  Utils.updateLocalLanguage(context, codeLanguage);
            }
          //},
        ),
      ),
    );
  }

  /// LIST CONTRY - CHANGE LANGUAGE CONTRY
  void _awaitFromSelectMarketScreen(BuildContext context, PreferredSizeWidget? appBar, CountryTheme? theme) async {
    final result = await Navigator.push( context,
        MaterialPageRoute(
          builder: (context) => SelectionMarketDetail(
            markets: markets,
            marketSelected: marketSelected,
            appBar: widget.appBar ??
                AppBar(
                  backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                  title: Text(AppLocalizations.translate('pickCountry').toString()),

                ),
            theme: theme,
            marketBuilder: widget.marketBuilder,
            useUiOverlay: widget.useUiOverlay,
            useSafeArea: widget.useSafeArea,
          ),
        )
    );

    setState(() {
      marketSelected = result ?? marketSelected!;
    });
  }


  _getAlphabetItem(int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            posSelected = index;
            _text = _alphabet[posSelected];
            if (_text != _oldtext) {
              for (var i = 0; i < markets.length; i++) {
                if (_text.compareTo(markets[i].name.toUpperCase()[0]) == 0) {
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

    // Search empty get all list enabled
    if((s.isEmpty) || (s=="") || (s== " ")){
         marketsFilter.clear();
     setState(() {
        markets=marketsEnabledList;

      });

    }else{

      // Search filter from code, dialCode,name to all list markets enabled
     setState(() {
        marketsFilter = markets.where((e) =>
        e.code.contains(s) ||
            e.dialCode!.contains(s) ||
            e.name.toUpperCase().contains(s))
            .toList();
        if(marketsFilter.isNotEmpty){
          markets=marketsFilter;
        } else{
          markets=marketsEnabledList;
        }
     });

    }

 //
 //    markets;
 //    marketsFilter;
 //    marketsEnabledList;
 // ///   markets=marketsFilter;
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
      String? marketName = markets.elementAt(scrollPosition).name;
      setState(() {
        posSelected =
            marketName![0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
      });
    }

    if ((_controllerScroll!.offset) >=
        (_controllerScroll!.position.maxScrollExtent)) {}
    if (_controllerScroll!.offset <=
        _controllerScroll!.position.minScrollExtent &&
        !_controllerScroll!.position.outOfRange) {}
  }



}
