

import '../../auth/singin/models/app_singin.dart';
import '../../auth/singin/screens/login_screen.dart';
import '../../auth/singup/widgets/app_singup.dart';
import '../../info/messages/widget/message_save.dart';
import '../../localisation/country/models/country.dart';
import '../../localisation/translation/components/appLocalizations.dart';
import '../../localisation/translation/widget/localizationLang.dart';
import '../../payment/screens/payment.dart';
import '../../profile/screens/profileAdmin switch.dart';
import '../../profile/screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/items_setting.dart';

//-->import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  // static const routeName = '/profileSettingScreen';

  // static  const String homeRoute = '/setting';
  static  const String settingsScreenRoute = '/settingsScreenRoute';
  static const String secondPageRoute = '/items';

  static const String appSingUpPageRoute = '/itemsSingUp/';
  static  const String countryScreenRoute = '/country';

  // static const String UserPageRoute = '/setting/itemUser';
  //static const String AdministrationPageRoute = '/setting/itemAdmin';

  late ValueChanged<ItemSetting> itemSelectedCallback;
  late ItemSetting selectedItem;




  // _FirstPageSetting({
  //   required this.itemSelectedCallback,
  //   required this.selectedItem,
  // });

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // List<CustomerSetting> itemsList = <CustomerSetting>[];

  @override
  Widget build(BuildContext context) {
    var item;
    return Navigator(
      restorationScopeId: 'navigator',
       initialRoute: SettingScreen.settingsScreenRoute,
     // initialRoute:  router.Router.getRoutes(context),
      //initialRoute:  router.Router.getRoutesAbsoluto(context),
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
  }
}



class _FirstPageSetting extends StatelessWidget {




  final List<ItemSetting> items = <ItemSetting>[
    ItemSetting(
      /// 'Profile' 1
      title: AppLocalizations.translate('profile')?.toUpperCase(),
      subtitle: AppLocalizations.translate('profile')?.toLowerCase(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      builder: (context) => const ProfilePage(),
    ),
    ItemSetting(
      /// 'Login'2
      title: AppLocalizations.translate('login')?.toUpperCase(),
      subtitle: AppLocalizations.translate('login')?.toLowerCase(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      builder: (context) => const AppSignIn(),
    ),

    // CustomerSetting(
    //   /// 3 'Connection'
    //   title: AppLocalizations.translate('connectionPostgreSql')?.toLowerCase(),
    //   subtitle:
    //       AppLocalizations.translate('connectionPostgreSql')?.toLowerCase(),
    //   // builder: (context) => const ProfilePage(),
    //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
    // ),
    ItemSetting(
      /// 4.register
      title: AppLocalizations.translate('register')?.toUpperCase(),
      subtitle: AppLocalizations.translate('register')?.toLowerCase(),
      builder: (context) =>  const AppSingUp(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),


    ),

    /*  CustomerSetting(
      // 'Register'
      title: AppLocalizations.translate('register')?.toLowerCase(),
      subtitle: AppLocalizations.translate('subtitleRegister')?.toLowerCase(),
      // builder: (context) => const ProfilePage(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    */
    ItemSetting(
      /// 5.'Payment'
      title: AppLocalizations.translate('payment')?.toUpperCase(),
      subtitle: AppLocalizations.translate('payment')?.toLowerCase(),
      // builder: (context) => const PaymentPage(totalPrice: totalPrice),
      builder: (context) => const PaymentPage(totalPrice: 5),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),

    ItemSetting(
      /// 6.'Localization'
      title: AppLocalizations.translate('localization')?.toUpperCase(),
      subtitle:
      AppLocalizations.translate('localization')?.toLowerCase(),
       builder: (context) => const ProfilePage(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),

    ItemSetting(
      /// 7.'Admin'
      title: AppLocalizations.translate('administration')?.toUpperCase(),
      subtitle: AppLocalizations.translate('administration')?.toLowerCase(),
      builder: (context) => const ProfileAdmin(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
     ItemSetting(
      /// 8.'Country'
      title: AppLocalizations.translate('country')?.toUpperCase(),
      subtitle: AppLocalizations.translate('country')?.toLowerCase(),
       builder: (context) => const Country(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    ItemSetting(
      /// 9'MessageSave'
      title: AppLocalizations.translate('message')?.toUpperCase(),
      subtitle:
      AppLocalizations.translate('message')?.toLowerCase(),
      builder: (context) => const ProfileAdmin(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    // CustomerSetting(
    //   /// 10'ProfileLocalisation'
    //   title: AppLocalizations.translate('subtitleLoginRegister')?.toUpperCase(),
    //   subtitle:
    //       AppLocalizations.translate('subtitleLoginRegister')?.toLowerCase(),
    //   // builder: (context) => const ProfileLocalization()
    //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
    // ),

    /* CustomerSetting(
        // ''
      title: AppLocalizations.translate('profile')?.toUpperCase() ,
      title: 'ObjectBoxPage',
      subtitle: AppLocalizations.translate('')?.toLowerCase() ,'Database ObjectBox',
      // builder: (context) => const ProfileAdmin()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    */

    /*
    CustomerSetting(
        // ''
      title: AppLocalizations.translate('profile')?.toLowerCase() ,
      title: 'FirebasePage',
      subtitle: AppLocalizations.translate('')?.toLowerCase() , 'Database Firebase',
      // builder: (context) => const ProfileAdmin()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),*/
  ];


  late ValueChanged<ItemSetting> itemSelectedCallback;
  late ItemSetting selectedItem;

  // _FirstPageSetting({
  //   required this.itemSelectedCallback,
  //   required this.selectedItem,
  // });

  var totalPrice;

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
              if ( items.isNotEmpty &&  items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('profile')?.toUpperCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
              }
              ///'Login 2'
              if (items.isNotEmpty && items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('login')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AppSingUp(),
                ));
              }

              ///3.connectionPostgreSql
              // if (items.isNotEmpty && items[index].title.toString().toLowerCase() ==
              //     AppLocalizations.translate('connectionPostgreSql')
              //         ?.toLowerCase()) {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const ConnectionPostgresSql(),
              //   ));
              // }

              /*   if (items.isNotEmpty &&  items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('register')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InsertPostgreSql(),
                ));
              }
              */
              /// 4.REGISTER
              if (items.isNotEmpty &&  items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('register')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  LoginScreen(),

                  // old builder: (context) => const AppSingUp(),
                ));
              }

              ///5.PAYMENT
              if (items.isNotEmpty &&  items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('payment')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentPage(totalPrice: totalPrice),
                ));
              }
              //
              // /// 6.LOCALISATION
              if (items.isNotEmpty && items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('localization')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LocalizationLang(),
                ));
              }
              /// 7.ADMIN
              if (items.isNotEmpty && items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('administration')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileAdmin(),
                ));
              }
              //
              /// 8.COUNTRY
              if (items.isNotEmpty && items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('country')?.toLowerCase()) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Country(),

                ));
              }

              // /// 9.MESSAGE+
              if (items.isNotEmpty && items[index].title.toString().toUpperCase() ==
                  AppLocalizations.translate('message')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MessageSave(),
                ));
              }
              // /// 10.PROFILELOCALISATION
              // if (items.isNotEmpty && items[index].title.toString().toUpperCase() ==
              //     AppLocalizations.translate('subtitleLoginRegister')
              //         ?.toLowerCase()) {
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
