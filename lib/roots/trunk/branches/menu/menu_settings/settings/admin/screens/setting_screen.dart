

import 'package:ecobioweb/market/providers/market_provider.dart';
import 'package:ecobioweb/market/screens/market_screen.dart';
import 'package:ecobioweb/roots/trunk/branches/commun_data_utils/utils/string/helper_dev.dart';
import 'package:ecobioweb/roots/trunk/branches/commun_data_utils/utils/text/app_text.dart';
import 'package:ecobioweb/roots/trunk/branches/commun_data_utils/utils/text/app_text_tranlated.dart';
import 'package:ecobioweb/roots/trunk/branches/menu/menu_settings/settings/dashboard/screens/dashborard.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../market/components/market.dart';
import '../../../../../../../../market/data/market_data.dart';
import '../../../../../../../../market/widget/selection_market_detail.dart';
import '../../../../../cart/provider/cart_provider.dart';
import '../../../../../cart/screens/cart_screen.dart';
import '../../../../../commun_data_utils/utils/helper/padded.dart';
import '../../../../../commun_data_utils/utils/theme/app_theme.dart';
import '../../../../../database/storages/locale/shared_preferences_locale.dart';
import '../../../../../favorites/screens/favourite_screen.dart';
import '../../../../../favorites/screens/filter_screen.dart';
import '../../../../../languages/screens/languages_screen.dart';
import '../../../../../localisation/country/components/code_country.dart';
import '../../../../../localisation/country/components/code_countrys.dart';
import '../../../../../localisation/country/widget/country_list_pick.dart';
import '../../../../../localisation/translation/components/appLocalizations.dart';
import '../../../../../localisation/translation/widget/localizationLang.dart';
import '../../../../../search/widgets/search_bar_widget.dart';
import '../../../../menu_home/controllers/MenuAppController.dart';
import '../../auth/singin/models/app_singin.dart';
import '../../auth/singin/screens/login_screen.dart';
import '../../auth/singup/widgets/app_singup.dart';
import '../../dashboard/screens/dashborard_main_screen.dart';

import '../../info/messages/widget/message_save.dart';

import '../../payment/screens/payment.dart';
import '../../profile/screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/items_setting.dart';
import 'admin_screen.dart';

//-->import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class SettingScreen extends StatefulWidget {
 /// final List? elements;

  SettingScreen({Key? key,}) : super(key: key);

  // static const routeName = '/profileSettingScreen';

  // static  const String homeRoute = '/setting';
  static  const String settingsScreenRoute = '/SettingScreen';
  static const String secondPageRoute = '/items';

  static const String appSingUpPageRoute = '/itemsSingUp/';
  static  const String countryScreenRoute = '/country';

  // static const String UserPageRoute = '/setting/itemUser';
  //static const String AdministrationPageRoute = '/setting/itemAdmin';

  late ValueChanged<ItemSetting> itemSelectedCallback;
  late ItemSetting selectedItem;

  static Market? market;

  static CountryCode? initialSelection;

  static Market? initialMarketSelection;

 static String? initialSelectionLang;

  static String? currentCodeLang="" ;

  static bool? isInitialLang ;

  static List markets=[];

  static PreferredSizeWidget? appBar;
  @override
  _SettingScreenState createState() => _SettingScreenState();

}

class _SettingScreenState extends State<SettingScreen>  with TickerProviderStateMixin {

  SharedPreferencesLocale pref = SharedPreferencesLocale();
  late List markets;
  List elements = [];
  Market?   marketSelected;
 CountryCode? selectedItem;

  bool? isInitialLang;
  late String currentCodeLang;
  ValueChanged<CountryCode?>? onChanged;

  Market? currentMarketCode;
  CountryCode? currentCountryCode;

  List elementsCountryEnabled = [];

  TextEditingController textInputSearch =  TextEditingController();

  @override
 void initState(){
   super.initState();
    fetchCurrentCodeLang();
  //   fetchMarketLit();
  // //  fetchAppBar();
  //
  //   //fetchMarketLit();
  //   super.initState();
  //   /// fetchItems().whenComplete(() => setState(() {}));
  //
  // }

  // fetchAppBar(){
  //   SettingScreen.appBar=   AppBar(
  //     backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
  //     title: Text(AppLocalizations.translate('pickCountry').toString()),
  //
  //   );
 }

  fetchMarketLit(){


     CountryTheme? theme;
    List<Map> jsonList = theme?.showEnglishName ?? true ? marketData : marketData;

    List elements = jsonList
        .map((s) => Market(
      name: s['name'],
      code: s['code'],
      dialCode: s['dial_code'],
      flagUri: 'assets/images/flags/${s['code'].toLowerCase()}.png',
      isEnabled: HelperDev.boolFromString(s['isEnabled'].toString())
    )).toList();

    // FILTRE THE LIST MARKET ENABLED : LIST CONTRY EANBLED
    List marketEnabled = [];

    for (int i = 0; i < elements.length; i++) {
      String codeCountry = elements[i].code;
       bool isMarketEnable= elements[i].isEnabled;

        if(isMarketEnable) {
           marketEnabled.add(elements[i]);
        }
    }
    /// ZAYNAB LAHAT BORRACCIA



 ///    marketEnabled=elements;

    // countries = elements;
     markets = marketEnabled;
     markets.sort((a, b) {
      return a.name.toString().compareTo(b.name.toString());
    });

    SettingScreen.markets=markets;

     currentCodeLang= SettingScreen.currentCodeLang.toString();
     setSelectedItem(currentCodeLang);


    // _awaitFromSelectScreen(context, appBar, theme);
  }


  Future <void> setSelectedItem(String currentCodeLang) async {
    for(Market marketCode in SettingScreen.markets){
      if(marketCode.code.toString().toLowerCase() == currentCodeLang.toString().toLowerCase()){
        elementsCountryEnabled.add(marketCode);
        currentMarketCode =marketCode;
        /// this.initialSelection!=countryCode;
        marketSelected = currentMarketCode;
        SettingScreen.initialMarketSelection=marketSelected;
        break;
        ///elements.setRange(start, end, iterable)
      }
    }

    marketSelected;
  }
Future<String?> fetchCurrentCodeLang() async{

 /// super.initState();
  var prefs= await SharedPreferences.getInstance();
  /// code lingua actualle
  String? currentCodeLangDefault = prefs.getString("currentCodeLang");

  /// code lingua actualle
  SettingScreen.currentCodeLang = currentCodeLangDefault.toString().toLowerCase();



  if(SettingScreen.currentCodeLang!.isNotEmpty){
    SettingScreen.isInitialLang=true;
  }
   currentCodeLang=currentCodeLangDefault.toString().toLowerCase();

  return SettingScreen.currentCodeLang;

}



  // Future<void> fetchItems() async {
  //
  //   /// code lingua actualle
  //   SettingScreen.currentCodeLang = pref.fetchCurrentCodeLang().toString();
  //
  //   if(SettingScreen.currentCodeLang!.isNotEmpty){
  //     SettingScreen.isInitialLang=true;
  //   }
  //
  //   CountryListPick(isInitialLang: SettingScreen.isInitialLang, currentCodeLang: SettingScreen.currentCodeLang);
  // }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers:  [
      ChangeNotifierProvider<MenuAppController>(create: (_)=>MenuAppController()),
     // ChangeNotifierProvider<AgricultureBiologicalProvider>(create: (_) => AgricultureBiologicalProvider()),
    ],
      // child: Navigator(onGenerateRoute: (RouteSettings settings){
      //
      //   return MaterialPageRoute(builder: (context){
      //     return SettingScreen();
      //   });
      // },),

      builder: (context,child){
        // int tabIndex=0;
        // final cartProvider=Provider.of<CartProvider>(context);
        // final agriBio=Provider.of<AgricultureBiologicalProvider>(context);
        //
        // var listProducts= context.read<AgricultureBiologicalProvider>().getData(tabIndex);
        //
        // cartItems=context.read<CartProvider>().cartItems;
        // //  products =context.read<CartProvider>().products;
        // products =context.read<CartProvider>().getProducts();


        return Scaffold(
          key: context.read<MenuAppController>().scaffoldKey,

          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey.shade100,
          body: Builder(
            ///key: index,
            builder: (context) {
              return Navigator(

                restorationScopeId: 'navigator',
                initialRoute: SettingScreen.settingsScreenRoute,
                // initialRoute:  router.Router.getRoutes(context),
                //  initialRoute:  router.Router.getRoutesAbsoluto(context),
                onGenerateRoute: (settings) {
                  if (settings.name case SettingScreen.settingsScreenRoute) {
                    return _NoAnimationCupertinoPageRoute<void>(
                      // title: GalleryLocalizations.of(context).demoCupertinoNavigationBarTitle,
                      title: "Setting",
                      settings: settings,
                      builder: (context) => _FirstPageSetting(
                        // itemSelectedCallback: (CustomerSetting value) {},
                        // selectedItem: item,
                          CupertinoPageRoute<void>(

                            settings: settings,
                            builder: (context) =>  SettingScreen(),
                          )

                      ),
                      //  builder: (context) => _FirstPageSetting(),
                    );
                    //    break;
                  }
                  return null;
                },
              );
            },

          ),
        );
      },
    );

  }

  /// LIST CONTRY - CHANGE LANGUAGE CONTRY
  // void _awaitFromSelectScreen(BuildContext context,
  //     PreferredSizeWidget? appBar, CountryTheme? theme) async {
  //   final result = await Navigator.push( context,
  //       MaterialPageRoute(
  //         builder: (context) => SelectionListMarket(
  //           elements,
  //           selectedItem,
  //           appBar: widget.appBar ??
  //               AppBar(
  //                 backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
  //                 title: Text(AppLocalizations.translate('pickCountry').toString()),
  //
  //               ),
  //           theme: theme,
  //           countryBuilder: widget.countryBuilder,
  //           useUiOverlay: widget.useUiOverlay,
  //           useSafeArea: widget.useSafeArea, elements: [],
  //         ),
  //       )
  //   );
  //
  //   setState(() {
  //     selectedItem = result ?? selectedItem!;
  //   });
  // }
}



class _FirstPageSetting extends StatelessWidget {

  late ValueChanged<ItemSetting> itemSelectedCallback;
  late ItemSetting selectedItem;

  static bool? isInitialLang=SettingScreen.isInitialLang;
  static String? currentCodeLang=SettingScreen.currentCodeLang;

  // _FirstPageSetting({
  //   required this.itemSelectedCallback,
  //   required this.selectedItem,
  // });

  var totalPrice;



  final List<ItemSetting> items = <ItemSetting>[
    ItemSetting(
      /// 'Profile' 1
      title: AppLocalizations.translate('profile'),
      subtitle: AppLocalizations.translate('profile'),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      builder: (context) => const ProfilePage(),
    ),
    ItemSetting(
      /// 'Login'2
      title: AppLocalizations.translate('login'),
      subtitle: AppLocalizations.translate('login'),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      builder: (context) => const AppSignIn(),
    ),

    // CustomerSetting(
    //   /// 3 'Connection'
    //   title: AppLocalizations.translate('connectionPostgreSql'),
    //   subtitle:
    //       AppLocalizations.translate('connectionPostgreSql'),
    //   // builder: (context) => const ProfilePage(),
    //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
    // ),
    ItemSetting(
      /// 4.register
      title: AppLocalizations.translate('register'),
      subtitle: AppLocalizations.translate('register'),
      builder: (context) =>  const AppSingUp(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),


    ),

    /*  CustomerSetting(
      // 'Register'
      title: AppLocalizations.translate('register'),
      subtitle: AppLocalizations.translate('subtitleRegister'),
      // builder: (context) => const ProfilePage(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    */
    ItemSetting(
      /// 5.'Payment'
      title: AppLocalizations.translate('payment'),
      subtitle: AppLocalizations.translate('payment'),
      // builder: (context) => const PaymentPage(totalPrice: totalPrice),
      builder: (context) => const PaymentPage(totalPrice: 5),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),

    ItemSetting(
      /// 6.'Localization'
      title:  AppText.getText("localization"),
      subtitle: AppText.getText("localization"),
       builder: (context) => const ProfilePage(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),

    ItemSetting(
      /// 7.'Admin'
      title:  AppText.getText("administration"),
      subtitle: AppText.getText("administration"),
      builder: (context) => const AdminScreen(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    /// DASHBOARD
    ItemSetting(
      /// 8.'Country' :languages
      title:  AppText.getText("dashboard"),
      subtitle: AppText.getText("dashboard"),
       builder: (context) =>Dashboard() ,
     /// builder: (context) =>MainScreen() ,
      ///builder: (context) =>DashborardMainScreen() ,

      // builder: (context) =>   CountryListPick(isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
     ItemSetting(
      /// 8.'Country' :languages
      title:  AppText.getText("languages"),
      subtitle: AppText.getText("languages"),
       builder: (context) =>   LanguageScreen (isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),
       // builder: (context) =>   CountryListPick(isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    ItemSetting(
      /// 9.'Market'
      title:  AppText.getText("market"),
      subtitle: AppText.getText("market"),
      builder: (context) => MarketScreen(context:context, currentCodeLang: SettingScreen.currentCodeLang),
      ///builder: (context) => MarketScreen(markets:SettingScreen.markets,initialMarketSelection: SettingScreen.initialMarketSelection, isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),

      ///  builder: (context) => const Market(),
      // builder: (context) =>  CountryListPick(initialSelectionLang: currentCodeLang),
      // builder: (context) =>   SelectionListMarket(elements: SettingScreen.elements,initialSelection: SettingScreen.initialSelection, isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),

      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    ItemSetting(
      /// 10'MessageSave'
      title: AppLocalizations.translate('message'),
      subtitle:
      AppLocalizations.translate('message'),
      builder: (context) => const AdminScreen(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    // CustomerSetting(
    //   /// 10'ProfileLocalisation'
    //   title: AppLocalizations.translate('subtitleLoginRegister'),
    //   subtitle:
    //       AppLocalizations.translate('subtitleLoginRegister'),
    //   // builder: (context) => const ProfileLocalization()
    //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
    // ),

    /* CustomerSetting(
        // ''
      title: AppLocalizations.translate('profile') ,
      title: 'ObjectBoxPage',
      subtitle: AppLocalizations.translate('') ,'Database ObjectBox',
      // builder: (context) => const AdminScreen()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    */

    /*
    CustomerSetting(
        // ''
      title: AppLocalizations.translate('profile') ,
      title: 'FirebasePage',
      subtitle: AppLocalizations.translate('') , 'Database Firebase',
      // builder: (context) => const ProfileAdmin()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),*/
  ];






  _FirstPageSetting(CupertinoPageRoute<void> cupertinoPageRoute);


  @override
  Widget build(BuildContext context) {

     return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item =items[index];

        return Card(
          // <-- Card
          color: const Color.fromARGB(255, 252, 250, 249),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Color.fromARGB(255, 78, 233, 142))),
          //  );
          //color: Colors.white,
          //child: ...
//)

          child: ListTile(
            // title: Text(items[index].title.toString()),
            subtitle: Text(items[index].subtitle.toString()),
            // trailing: const Icon(Icons.arrow_forward_ios_outlined),
            trailing: const IconTheme(
              data: IconThemeData(color: Color.fromARGB(255, 78, 233, 142)),
              child: Icon(Icons.arrow_forward_ios_outlined),
            ),
            // shape: RoundedRectangleBorder(
            //   borderRadius: Borderadius.circular(15.0),
            //    side:
            //      const BorderSide(color: Color.fromARGB(255, 78, 233, 142))),
            onTap: () {
              /// Profile 1
              if (items.isNotEmpty && items[index].title.toString() == AppText.getText("profile")) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
              }
              ///'Login 2'
               if (items.isNotEmpty && items[index].title.toString() == AppText.getText("login")) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AppSingUp(),
                ));
              }

              ///3.connectionPostgreSql
              // if (items.isNotEmpty && items[index].title.toString() ==
              //     AppLocalizations.translate('connectionPostgreSql')
              //         ) {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const ConnectionPostgresSql(),
              //   ));
              // }

              /*   if (items.isNotEmpty &&  items[index].title.toString() ==
                  AppLocalizations.translate('register')) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InsertPostgreSql(),
                ));
              }
              */
              /// 4.REGISTER
               if (items.isNotEmpty && items[index].title.toString() == AppText.getText("register")) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  LoginScreen(),

                  // old builder: (context) => const AppSingUp(),
                ));
              }

              ///5.PAYMENT
              if (items.isNotEmpty && items[index].title.toString() == AppText.getText("payment")) {
              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentPage(totalPrice: totalPrice),
                          ));
                        }
                        //
       // /// 6.LOCALISATION
          if (items.isNotEmpty && items[index].title.toString() == AppText.getText("localization")) {
          Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LocalizationLang(),
                      ));
                    }
                    /// 7.ADMIN
          if (items.isNotEmpty && items[index].title.toString() == AppText.getText("administration")) {
          Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminScreen(),
                      ));
                    }
                    //
              /// DASHBOARD
            if (items.isNotEmpty && items[index].title.toString() == AppText.getText("dashboard")) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>Dashboard() ,
                 /// builder: (context) =>MainScreen() ,
               /// builder: (context) =>DashborardMainScreen() ,
              ));
            }

              /// 8.COUNTRY
              if (items.isNotEmpty && items[index].title.toString() == AppText.getText("languages")) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>   LanguageScreen (isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),
                 ///  builder: (context) =>  CountryListPick(currentCodeLang: SettingScreen.currentCodeLang,isInitialLang: SettingScreen.isInitialLang,appBar: SettingScreen.appBar,),
                //  builder: (context) =>   CountryListPick(initialSelection: SettingScreen.initialSelection,isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),
                 /// builder: (context) =>  CountryListPick(),
                ));
              }
              /// 9.Market
            if (items.isNotEmpty && items[index].title.toString() == AppText.getText("market")) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MarketScreen(context:context, currentCodeLang: SettingScreen.currentCodeLang),
                          ///builder: (context) => MarketScreen(markets:SettingScreen.markets,initialMarketSelection: SettingScreen.initialMarketSelection, isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),

                  // builder: (context) =>   MarketScreen(isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),
                 //    builder: (context) =>   SelectionListMarket(elements: SettingScreen.elements,initialSelection: SettingScreen.initialSelection, isInitialLang:SettingScreen.isInitialLang ,currentCodeLang: SettingScreen.currentCodeLang),



                ));
              }
              // /// 10.MESSAGE+
               if (items.isNotEmpty && items[index].title.toString() == AppText.getText("message")) {
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MessageSave(),
                    ));
                }
              // /// 10.PROFILELOCALISATION
              // if (items.isNotEmpty && items[index].title.toString() ==
              //     AppLocalizations.translate('subtitleLoginRegister')
              //         ) {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => ProfileLocalization(),
              //   ));
              // }

              /*if (items.isNotEmpty && items[index].title == "ObjectBoxPage") {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CounterObjectBox(),
                ));
              }
              */
              /* if (items.isNotEmpty && items[index].title == "FirebasePage") {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FirebasePage(
                    analytics: analytics,
                    observer: observer,
                    title: 'FirebasePage',
                  ),
                ));
              }*/

              /*
              CountryList
              Country
              CountryListPick
               if (items.isNotEmpty && items[index].title == "CountryList") {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Country(),
                ));
              }*/
            },
          ),
        );
      },
    );
  }

}
/// ------------------------------------------------------------------------------------------------------------------------------------------------------


// class checkJson{
//
//   Map<String, dynamic> dataCustomerMap = jsonDecode("source");
//
//   var item = CustomerSetting.fromJson(dataCustomerMap);
//
//   String jsonCustom = jsonEncode(item);
//
// }
// TEST



/*class Item {
  Item({
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final String title;
  final String subtitle;
  final Icon trailing;
}
*/
class SizeBox {
  SizeBox(Text text);
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(), child: Container());
  }
}

// CupertinoPageRoute without any transition animations.
class _NoAnimationCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  _NoAnimationCupertinoPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    required String title,
  }) : super(
    builder: builder,
    settings: settings,
    title: title,
    // leading: Icon(Icons.label),
  );

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child;
  }
}
