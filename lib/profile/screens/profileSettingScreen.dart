
import 'package:ecobioweb/profile/screens/profileAdmin%20switch.dart';
import 'package:ecobioweb/profile/screens/profileLocalization.dart';
import 'package:ecobioweb/profile/screens/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../payment/screens/payment.dart';
import '../../auth/singin/models/app_singin.dart';
import '../../auth/singup/widgets/app_singup.dart';
import '../../database/connection_postgreSql.dart';
import '../../info/messages/widget/message_save.dart';
import '../../localisation/country/models/country.dart';
import '../../localisation/translation/components/appLocalizations.dart';
import '../../localisation/translation/widget/localizationLang.dart';
import '../components/customerSetting.dart';

//-->import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class ProfileSettingScreen extends StatefulWidget {
  static const String homeRoute = '/setting';
  static const String secondPageRoute = '/setting/item';
  // static const String UserPageRoute = '/setting/itemUser';
  //static const String AdministrationPageRoute = '/setting/itemAdmin';

  const ProfileSettingScreen({Key? key}) : super(key: key);
  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {
    var item;
    return Navigator(
      restorationScopeId: 'navigator',
      initialRoute: ProfileSettingScreen.homeRoute,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ProfileSettingScreen.homeRoute:
            return _NoAnimationCupertinoPageRoute<void>(
              // title: GalleryLocalizations.of(context).demoCupertinoNavigationBarTitle,
              title: "Setting",
              settings: settings,
              builder: (context) => _FirstPageSetting(
                itemSelectedCallback: (CustomerSetting value) {},
                selectedItem: item,
              ),
              //builder: (context) => ProfilePage(),
            );
            break;
          case ProfileSettingScreen.secondPageRoute:
            final arguments = settings.arguments as Map<dynamic, dynamic>;
            final title = arguments['pageTitle'] as String;
            return CupertinoPageRoute<void>(
              title: title,
              settings: settings,
              builder: (context) => _SecondPage(),
            );
            break;
        }
        return null;
      },
    );
  }
}

class _FirstPageSetting extends StatelessWidget {
  final List<CustomerSetting> items = <CustomerSetting>[
    CustomerSetting(
      /// 'Profile' 1
      title: AppLocalizations.translate('profile')?.toLowerCase(),
      subtitle: AppLocalizations.translate('subtitleSetting')?.toLowerCase(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      // builder: (context) => const ProfilePage(),
    ),
    CustomerSetting(
      /// 'Login'2
      title: AppLocalizations.translate('login')?.toLowerCase(),
      subtitle: AppLocalizations.translate('subtitleLogin')?.toLowerCase(),
      // builder: (context) => const ProfilePage(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    CustomerSetting(
      /// 3 'Connection'
      title: AppLocalizations.translate('connectionPostgreSql')?.toLowerCase(),
      subtitle:
          AppLocalizations.translate('connectionPostgreSql')?.toLowerCase(),
      // builder: (context) => const ProfilePage(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    CustomerSetting(
      /// 4.register
      title: AppLocalizations.translate('register')?.toLowerCase(),
      subtitle: AppLocalizations.translate('register')?.toLowerCase(),
      // builder: (context) => const ProfilePage(),
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
    CustomerSetting(
      /// 5.'Payment'
      title: AppLocalizations.translate('payment')?.toLowerCase(),
      subtitle: AppLocalizations.translate('subtitlePayment')?.toLowerCase(),
      // builder: (context) => const ProfilePage(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),

    CustomerSetting(
      /// 6.'Localization'
      title: AppLocalizations.translate('language')?.toLowerCase(),
      subtitle:
          AppLocalizations.translate('subtitleLocalization')?.toLowerCase(),
      // builder: (context) => const ProfilePage()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    CustomerSetting(
      /// 7.'Admin'
      title: AppLocalizations.translate('admin')?.toLowerCase(),
      subtitle:
          AppLocalizations.translate('subtitleAdministration')?.toLowerCase(),
      // builder: (context) => const ProfileAdmin()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    CustomerSetting(
      /// 8.'Country'
      title: AppLocalizations.translate('country')?.toLowerCase(),
      subtitle: AppLocalizations.translate('subtitleCountry')?.toLowerCase(),
      // builder: (context) => const Country()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    CustomerSetting(
      /// 9'MessageSave'
      title: AppLocalizations.translate('message')?.toLowerCase(),
      subtitle:
          AppLocalizations.translate('subtitleMessageDatabase')?.toLowerCase(),
      // builder: (context) => const ProfileAdmin()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),
    CustomerSetting(
      /// 10'ProfileLocalisation'
      title: AppLocalizations.translate('subtitleLoginRegister')?.toLowerCase(),
      subtitle:
          AppLocalizations.translate('subtitleLoginRegister')?.toLowerCase(),
      // builder: (context) => const ProfileLocalization()
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    ),

    /* CustomerSetting(
        // ''
      title: AppLocalizations.translate('profile')?.toLowerCase() ,
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

  late ValueChanged<CustomerSetting> itemSelectedCallback;
  late CustomerSetting selectedItem;

  var totalPrice;

  //static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  //static FirebaseAnalyticsObserver observer =
  //  FirebaseAnalyticsObserver(analytics: analytics);

  _FirstPageSetting({
    required this.itemSelectedCallback,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
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
            title: Text(items[index].title.toString()),
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
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('profile')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
              }
              ///'Login 2'
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('login')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AppSignIn(),
                ));
              }

              ///3.connectionPostgreSql
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('connectionPostgreSql')
                      ?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ConnectionPostgresSql(),
                ));
              }

              /*   if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('register')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InsertPostgreSql(),
                ));
              }
              */
              /// 4.REGISTER
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('register')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AppSingUp(),
                ));
              }

              ///5.PAYMENT
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('payment')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentPage(totalPrice: totalPrice),
                ));
              }

              /// 6.LOCALISATION
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('language')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LocalizationLang(),
                ));
              }
              /// 7.ADMIN
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('admin')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileAdmin(),
                ));
              }

              /// 8.COUNTRY
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('country')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Country(),
                ));
              }
              /// 9.MESSAGE
                if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('message')?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MessageSave(),
                ));
              }
              /// 10.PROFILELOCALISATION
              if (items[index].title.toString().toLowerCase() ==
                  AppLocalizations.translate('subtitleLoginRegister')
                      ?.toLowerCase()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileLocalization(),
                ));
              }

              /*if (items[index].title == "ObjectBoxPage") {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CounterObjectBox(),
                ));
              }
              */
              /* if (items[index].title == "FirebasePage") {
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
               if (items[index].title == "CountryList") {
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

/*class _UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> settingsList = [
      "User",
      "Password",
      "Message",
      "Privacy",
      "Altro"
    ];

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(), // child: Container());
        // second category
        child: Column(
          children: <Widget>[
            CustomUser(
              // CustomUser(
              thumbnail: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 243, 236, 238)),
              ),
              description: 'Customer User',
              favorite: 'favorite',
              username: 'Zaynab', // cognome nome
              email: 'zaynab@gmail.com',
              password: '1222',
              statusProducer: 'ON', // produttore
              statusCustomer: 'ON', // cliente
              messages: 'Benvenuto',
              enabled: true,
              // thumbnail:
              publishDate: '25/12/2022',
              //IconData: Icon.,
              // ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: settingsList.map((sections) {
                  return Card(child: ListTile(title: Text(sections)));
                  const Icon(Icons.arrow_forward_ios_sharp);

                  SizeBox(
                    const Text('vbbb'),
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }
}
*/
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
