//
// import 'package:flutter/material.dart';
// import '../../../../../../market/components/market.dart';
// import '../../../menu/menu_settings/settings/admin/screens/setting_screen.dart';
// import '../../translation/components/appLocalizations.dart';
// import '../components/code_country.dart';
// import '../components/code_countrys.dart';
// import '../components/country_selection_theme.dart';
// import '../components/selection_list.dart';
// import '../screens/code_countries_en.dart';
// export '../components/country_selection_theme.dart';
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import '../widget/country_list_pick.dart';
//
// // ignore: must_be_immutable
// class CountryList extends StatefulWidget {
//   CountryList({super.key,
//     this.initialSelection,
//     this.initialSelectionCountryCode,
//     this.onChanged,
//     this.appBar,
//     this.pickerBuilder,
//     this.theme,
//     this.countryBuilder,
//     this.useUiOverlay = true,
//     this.useSafeArea = false,
//   });
//
//   final String? initialSelection;
//   final CountryCode? initialSelectionCountryCode;
//   final ValueChanged<CountryCode?>? onChanged;
//   final PreferredSizeWidget? appBar;
//   final Widget Function(BuildContext context, CountryCode? countryCode)?
//       pickerBuilder;
//   final CountryTheme? theme;
//   final Widget Function(BuildContext context, CountryCode countryCode)?
//       countryBuilder;
//   final bool useUiOverlay;
//   final bool useSafeArea;
//
//   List? elements;
//
//   @override
//   // ignore: no_logic_in_create_state
//   _CountryListState createState() {
//     List<Map> jsonList =
//         // ignore: unnecessary_this
//         this.theme?.showEnglishName ?? true ? countriesEnglish : codes;
//
//     List elementsContry = jsonList
//         .map((s) => CountryCode(
//               name: s['name'],
//               code: s['code'],
//               dialCode: s['dial_code'],
//               // flagUri: '../assets/images/flags/${s['code'].toLowerCase()}.png',
//                 flagUri: '.../flags/${s['code'].toLowerCase()}.png',
//               isEnabled: s['isEnabled'],
//             ))
//         .toList();
//
//     // FILTRE THE LIST MARKET ENABLED : LIST CONTRY EANBLED
//     // ignore: non_constant_identifier_names
//     List CountryEnabled = [];
//
//     for (int i = 0; i < elementsContry.length; i++) {
//       String codeCountry = elementsContry[i].code;
//
//       if (codeCountry == "IT" ||
//           codeCountry == 'FR' ||
//           codeCountry == 'ES' ||
//           codeCountry == 'DE' ||
//           codeCountry == 'SN' ||
//           codeCountry == 'NG') {
//         CountryEnabled.add(elementsContry[i]);
//
//         elements = CountryEnabled;
//       }
//     }
//     return _CountryListState(CountryEnabled);
//   }
// }
//
// class _CountryListState extends State<CountryList> {
//   //late List countries;
//   final TextEditingController _controller = TextEditingController();
//   ScrollController? _controllerScroll;
//   var diff = 0.0;
//
//   var posSelected = 0;
//   var height = 0.0;
//   late var _sizeheightcontainer;
//   late var _heightscroller;
//   var _text;
//   var _oldtext;
//   final _itemsizeheight = 50.0;
//   double _offsetContainer = 0.0;
//
//   bool isShow = true;
//
//   String search = "";
//   String search_point = "";
//   String last_pick = "";
//
//   //final LocalStorage storage = new LocalStorage('localstorage_app');
//   final List _alphabet =
//       List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));
//
//   CountryCode? selectedItem;
//   List elements = [];
//
//   late List countries;
//
//   //late List countries;
//
//   _CountryListState(this.elements);
//
//   @override
//   void initState() {
//     if (widget.initialSelection != null) {
//       selectedItem = elements.firstWhere(
//           (e) =>
//               (e.code.toUpperCase() ==
//                   widget.initialSelection!.toUpperCase()) ||
//               (e.dialCode == widget.initialSelection),
//           orElse: () => elements[0] as CountryCode);
//     } else {
//       selectedItem = elements[0];
//     }
//
//     countries = widget.elements!;
//     countries.sort((a, b) {
//       return a.name.toString().compareTo(b.name.toString());
//     });
//     // _controllerScroll = ScrollController();
//     //  _controllerScroll!.addListener(_scrollListener);
//
//     super.initState();
//   }
//
//   /* @override
//   void initState() {
//     countries = widget.elements!;
//     countries.sort((a, b) {
//       return a.name.toString().compareTo(b.name.toString());
//     });
//     _controllerScroll = ScrollController();
//     _controllerScroll!.addListener(_scrollListener);
//     super.initState();
//   }
// */
//   void _awaitFromSelectScreen(BuildContext conmetext,
//       PreferredSizeWidget? appBar, CountryTheme? theme) async {
//     final result = await Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SelectionList(
//             elements,
//             selectedItem,
//             appBar: widget.appBar ??
//                 AppBar(
//                   backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//                   title: Text(
//                       AppLocalizations.translate('back')),
//                   //  title: const Text("Select Country"),
//                 ),
//             theme: theme,
//             countryBuilder: widget.countryBuilder,
//             useUiOverlay: widget.useUiOverlay,
//             useSafeArea: widget.useSafeArea,
//           ),
//         ));
//
//     setState(() {
//       selectedItem = result ?? selectedItem;
//       widget.onChanged!(result ?? selectedItem);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _controllerScroll = ScrollController();
//     _controllerScroll!.addListener(_scrollListener);
//
//     if (widget.useUiOverlay) {
//       SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//         statusBarColor: Colors.white,
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarColor: Colors.white,
//         systemNavigationBarIconBrightness: Brightness.dark,
//         statusBarBrightness: !kIsWeb ? Brightness.dark : Brightness.light,
//       ));
//     }
//     height = MediaQuery.of(context).size.height;
//     search = AppLocalizations.translate('search');
//     search_point =
//         // AppLocalizations.of(context)!.translate('search_point').toString();
//         AppLocalizations.translate('search_point');
//     last_pick = AppLocalizations.translate('last_pick');
//     //search_point = Translation.search(context)!;
//
//     Widget scaffold = Scaffold(
//       appBar: widget.appBar,
//       body: Container(
//         color: const Color(0xfff4f4f4),
//         child: LayoutBuilder(builder: (context, contrainsts) {
//           diff = height - contrainsts.biggest.height;
//           _heightscroller = (contrainsts.biggest.height) / _alphabet.length;
//           _sizeheightcontainer = (contrainsts.biggest.height);
//           // var flagUri;
//           //return Stack(
//           return Scaffold(
//             // return MaterialApp(
//             //  debugShowCheckedModeBanner: false,
//             //  home: Scaffold(
//             appBar: AppBar(
//               title: Text(AppLocalizations.translate("back")),
//               // leading: const BackButton(color: Colors.black),
//               backgroundColor: const Color.fromARGB(255, 50, 172, 34),
//               leading: BackButton(
//                 color: Colors.black,
//                 onPressed: () {
//                   //Navigator.push(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
//                  //  Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
//                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
//                   );
//                 },
//               ),
//             ),
//             body: Stack(
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   CustomScrollView(
//                     controller: _controllerScroll,
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     slivers: [
//                       SliverToBoxAdapter(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Text(
//                             widget.theme?.searchText ?? search,
//                             style: TextStyle(
//                                 color:
//                                     widget.theme?.labelColor ?? Colors.black),
//                           ),
//                         ),
//                         Container(
//                           color: Colors.white,
//                           child: TextField(
//                             controller: _controller,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                               enabledBorder: InputBorder.none,
//                               errorBorder: InputBorder.none,
//                               disabledBorder: InputBorder.none,
//                               contentPadding: const EdgeInsets.only(
//                                   left: 15, bottom: 0, top: 0, right: 15),
//                               hintText:
//                                   widget.theme?.searchHintText ?? search_point,
//                             ),
//                             onChanged: _filterElements,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Text(
//                             widget.theme?.lastPickText ?? search_point,
//                             style: TextStyle(
//                                 color:
//                                     widget.theme?.labelColor ?? Colors.black),
//                           ),
//                         ),
//                         Container(
//                           color: Colors.white,
//                           child: Material(
//                             color: Colors.transparent,
//                             child: ListTile(
//                               leading: Image.asset(
//                                 widget.initialSelectionCountryCode!.flagUri!,
//                                 // package: 'country_list_pick',
//                                 width: 32.0,
//                               ),
//                               title: Text(
//                                   widget.initialSelectionCountryCode!.name!),
//                               trailing: const Padding(
//                                 padding: EdgeInsets.only(right: 20.0),
//                                 child: Icon(Icons.check, color: Colors.green),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                       ],
//                     ),
//                   ),
//                       SliverList(
//                         delegate: SliverChildBuilderDelegate((context, index) {
//                           return widget.countryBuilder != null
//                               ? widget.countryBuilder!(
//                                   context, countries.elementAt(index))
//                               : getListCountry(countries.elementAt(index));
//                         }, childCount: countries.length),
//                       )
//                     ],
//                   ),
//                   if (isShow == true)
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onVerticalDragUpdate: _onVerticalDragUpdate,
//                         onVerticalDragStart: _onVerticalDragStart,
//                         child: Container(
//                           height: 20.0 * 30,
//                           color: Colors.transparent,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [...List.generate(_alphabet.length,
//                                     (index) => _getAlphabetItem(index))],
//                           ),
//                         ),
//                       ),
//                     ),
//                 ]),
//           );
//         }),
//       ),
//     );
//     return widget.useSafeArea ? SafeArea(child: scaffold) : scaffold;
//   }
//
//   @override
//   Widget build1(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         _awaitFromSelectScreen(context, widget.appBar, widget.theme);
//       },
//       child: widget.pickerBuilder != null
//           ? widget.pickerBuilder!(context, selectedItem)
//           : Flex(
//               direction: Axis.horizontal,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 if (widget.theme?.isShowFlag ?? true == true)
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Image.asset(
//                         selectedItem!.flagUri!,
//                         // package: 'country_list_pick',
//                         width: 32.0,
//                       ),
//                     ),
//                   ),
//                 if (widget.theme?.isShowCode ?? true == true)
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Text(selectedItem.toString()),
//                     ),
//                   ),
//                 if (widget.theme?.isShowTitle ?? true == true)
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Text(selectedItem!.toCountryStringOnly()),
//                     ),
//                   ),
//                 if (widget.theme?.isDownIcon ?? true == true)
//                   const Flexible(
//                     child: Icon(Icons.keyboard_arrow_down),
//                   )
//               ],
//             ),
//     );
//   }
//
//   void _filterElements(String s) {
//     s = s.toUpperCase();
//     setState(() {
//       countries = widget.elements!
//           .where((e) =>
//               e.code.contains(s) ||
//               e.dialCode.contains(s) ||
//               e.name.toUpperCase().contains(s))
//           .toList();
//     });
//   }
//
//   Widget getListCountry2(CountryCode e) {
//     return TextButton(
//       onPressed: () {
//         _awaitFromSelectScreen(context, widget.appBar, widget.theme);
//       },
//       child: widget.pickerBuilder != null
//           ? widget.pickerBuilder!(context, selectedItem)
//           : Flex(
//               direction: Axis.horizontal,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 if (widget.theme?.isShowFlag ?? true == true)
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Image.asset(
//                         selectedItem!.flagUri!,
//                         // package: 'country_list_pick',
//                         width: 32.0,
//                       ),
//                     ),
//                   ),
//                 if (widget.theme?.isShowCode ?? true == true)
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Text(selectedItem.toString()),
//                     ),
//                   ),
//                 if (widget.theme?.isShowTitle ?? true == true)
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Text(selectedItem!.toCountryStringOnly()),
//                     ),
//                   ),
//                 if (widget.theme?.isDownIcon ?? true == true)
//                   const Flexible(
//                     child: Icon(Icons.keyboard_arrow_down),
//                   )
//               ],
//             ),
//     );
//   }
//
//   Widget getListCountry(CountryCode e) {
//     return Container(
//       height: 50,
//       color: Colors.white,
//       child: Material(
//         color: Colors.transparent,
//         child: ListTile(
//           leading: Image.asset(
//             e.flagUri!,
//             //    package: 'country_list_pick',
//             width: 30.0,
//           ),
//           title: Text(e.name!),
//
//           //  onTap: () async { await homeController.setLanguage("EN") .then((value) async { await context .setLocale( const Locale( "en")); }) },
//           onTap: () {
//             String codeLanguage = e.code.toString();
//
//             _awaitFromSelectScreen(context, widget.appBar, widget.theme);
//
//             _sendDataBack(context, e);
//             //  Utils.updateLocalLanguage(context, codeLanguage);
//
//             //---> Market Info
//             market();
//
//             //Add Favorites
//             //favoriteMarket();
//             //  updateJson();
//             //    readJsonData();
//
//             //String id = "110";
//             // String name = "Italia";
//
//             // setBookmark(id, name);
//
//             //  String? languageLocal = const Utils().languageLocalApp(context);
//             // var fromSubtags = const Locale.fromSubtags(languageCode: 'de');
//             // final language=await _getLanguage();
//             // language change user: if the new linguage is not defaultt change the linguage   APP
//
//             String? codeLanguageChange = e.code;
//             String? nameLanguageCodeChange = e.name;
//
//             // ChangeLanguage(codeLanguageChange);
//             // if (codeLanguageChange == "DE") {
//             // AppLocalizations.load(const Locale('de_DE'));
//             // MyApp.of(context).setLocale(const Locale('de_DE'));
//             // } else if (codeLanguageChange == "IT") {
//             // AppLocalizations.load(const Locale('it_IT'));
//             // } else if (codeLanguageChange == "FR") {
//             // AppLocalizations.load(const Locale('fr_FR'));
//             // MyApp.of(context).setLocale(const Locale('fr_FR'));
//             // } else if (codeLanguageChange == "ES") {
//             // AppLocalizations.load(const Locale('es_ES'));
//             // MyApp.of(context).setLocale(const Locale('es_ES'));
//             // } else if (codeLanguageChange == "SN") {
//             // AppLocalizations.load(const Locale('sn_SN'));
//             // MyApp.of(context).setLocale(const Locale('sn_SN'));
//             // } else if (codeLanguageChange == "NG") {
//             // AppLocalizations.load(const Locale('ng_NG'));
//             // MyApp.of(context).setLocale(const Locale('ng_NG'));
//             // }
//               //  setState(() {
//               //  AppLocalizations.load(const Locale('en', 'EN'));
//               // locale = const Locale('en', 'EN');
//               //  MyApp.of(context).setLocale(context, locale);
//               // MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'de',));
//               //});
//            // }
//
//             // MyApp.of(context).setLocale(const Locale.fromSubtags(languageCode: 'de')),
//           },
//         ),
//       ),
//     );
//   }
//
//   void _sendDataBack(
//       BuildContext context, CountryCode initialSelectionCountryCode) {
//     Navigator.pop(context, initialSelectionCountryCode);
//   }
//
//   Future<void> market() async {
//     List<dynamic> marketList = [];
//     final String response =
//         await rootBundle.loadString('../../assets/json/market.json');
//     final data = await json.decode(response);
//
//     marketList = data['market'].map((data) => Market.fromJson(data)).toList();
//
//     for (var i in marketList) {
//       if (i.name == "Italia") {
//         print(i.name);
//       } else if (i.name == "Germany") {
//         print(i.name);
//       } else if (i.name == "France") {
//         print(i.name);
//       } else if (i.name == "Senegal") {
//         print(i.name);
//       } else if (i.name == "Nigeria") {
//         print(i.name);
//       }
//     }
//     setState(() {
//       marketList = data['market'].map((data) => Market.fromJson(data)).toList();
//     });
//   }
//
//   void _onVerticalDragUpdate(DragUpdateDetails details) {
//     setState(() {
//       if ((_offsetContainer + details.delta.dy) >= 0 &&
//           (_offsetContainer + details.delta.dy) <=
//               (_sizeheightcontainer - _heightscroller)) {
//         _offsetContainer += details.delta.dy;
//         posSelected =
//             ((_offsetContainer / _heightscroller) % _alphabet.length).round();
//         _text = _alphabet[posSelected];
//         if (_text != _oldtext) {
//           for (var i = 0; i < countries.length; i++) {
//             if (_text
//                     .toString()
//                     .compareTo(countries[i].name.toString().toUpperCase()[0]) ==
//                 0) {
//               _controllerScroll!.jumpTo((i * _itemsizeheight) + 15);
//               break;
//             }
//           }
//           _oldtext = _text;
//         }
//       }
//     });
//   }
//
//   void _onVerticalDragStart(DragStartDetails details) {
//     _offsetContainer = details.globalPosition.dy - diff;
//   }
//
//   _scrollListener() {
//     int scrollPosition =
//         (_controllerScroll!.position.pixels / _itemsizeheight).round();
//     if (scrollPosition < countries.length) {
//       String? countryName = countries.elementAt(scrollPosition).name;
//       setState(() {
//         posSelected =
//             countryName![0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
//       });
//     }
//
//     if ((_controllerScroll!.offset) >=
//         (_controllerScroll!.position.maxScrollExtent)) {}
//     if (_controllerScroll!.offset <=
//             _controllerScroll!.position.minScrollExtent &&
//         !_controllerScroll!.position.outOfRange) {}
//   }
//
//   _getAlphabetItem(int index) {
//     return Expanded(
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             posSelected = index;
//             _text = _alphabet[posSelected];
//             if (_text != _oldtext) {
//               for (var i = 0; i < countries.length; i++) {
//                 if (_text.toString().compareTo(
//                         countries[i].name.toString().toUpperCase()[0]) ==
//                     0) {
//                   _controllerScroll!.jumpTo((i * _itemsizeheight) + 10);
//                   break;
//                 }
//               }
//               _oldtext = _text;
//             }
//           });
//         },
//         child: Container(
//           width: 40,
//           height: 20,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: index == posSelected
//                 ? widget.theme?.alphabetSelectedBackgroundColor ?? Colors.blue
//                 : Colors.transparent,
//             shape: BoxShape.circle,
//           ),
//           child: Text(
//             _alphabet[index],
//             textAlign: TextAlign.center,
//             style: (index == posSelected)
//                 ? TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color:
//                         widget.theme?.alphabetSelectedTextColor ?? Colors.white)
//                 : TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: widget.theme?.alphabetTextColor ?? Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }
