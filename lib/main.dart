

import 'dart:io';
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:ecobioweb/loader/data_loader.dart';
import 'package:ecobioweb/roots/trunk/branches/database/sqlLite/connection_db_sqlite_services.dart';
import 'package:ecobioweb/roots/trunk/branches/database/sqlLite/database_helper.dart';
import 'package:ecobioweb/roots/trunk/branches/database/sqlLite/db_helper_sqlite.dart';
import 'package:ecobioweb/roots/trunk/branches/menu/menu_home/controllers/MenuAppController.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:theme_provider/theme_provider.dart';


import 'package:ecobioweb/shared/root/root.dart' as router;

import 'roots/trunk/branches/database/storages/locale/shared_preferences_locale.dart';


//import 'objectbox.g.dart';
//import 'objectbox.g.dart' if (dart.library.html) 'objectbox.g.dart';

//import 'myapp/sources-that-use-objectbox.dart' if (dart.library.html) 'myapp/sources-that-dont-use-objectbox.dart';

//C:\Lahat\Projet App\EcoBio\ecobio\ecobio\.dart_tool\flutter_gen\gen_l10n\app_localizations.dart

//-----------------------------INITE SQLLITE------------------------------------

// conectionDbSqlLite();
//-----------------------------END SQLLITEL------------------------------------

// ------------------------- INIT OBJECTBOX DATABASE------------------------------
// Using ObjectBox Database
/// Provides access to the ObjectBox Store throughout the app.
/* late ObjectBox objectbox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}*/
// ----------------------------END OBJECTBOX DATABASE---------------------------

//-----------------------------INITE POSTGRESQL------------------------------------

//-----------------------------END POSTGRESQL------------------------------------

Future<void> main() async {

  // await DBHelper().initDatabase();
 ///DatabaseHelper();

  // WidgetsFlutterBinding.ensureInitialized();


  //-----------------------------INITE SQLLITE------------------------------------

  // ConnectionDbSqlLiteServices conn = ConnectionDbSqlLiteServices();
  //   conn.db;
 WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
        sqfliteFfiInit();


      // Change the default factory. On iOS-/Android, if not using `sqlite_flutter_lib` you can forget
      // this step, it will use the sqlite version available on the system.
      databaseFactory = databaseFactoryFfi;
  }


     ///Initialize db main
  DatabaseHelper databaseHelper = DatabaseHelper();
     var initDB= databaseHelper.database;


//-----------------------------END SQLLITEL------------------------------------


  // Implementation param save small data
  SharedPreferences.getInstance().then((instance) async{
    SharedPreferences pref =await SharedPreferences.getInstance();


    // Get the initial locale values
    ///   final String defaultSystemLocale = Platform.localeName;
   /// final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;

    // save language Locale into SharedPreference

    // Locale locale = const Locale(defaultSystemLocale,'IT');
    // Locale locale = Locale(defaultSystemLocale,"+39");


    SharedPreferencesLocale saveLanguageLocale = SharedPreferencesLocale();
    //  saveLanguageLocale.setLocale(pref, context, locale,defaultSystemLocale);




    /// LOAD PRODUCT AGRICULTURE BIOLOGIQUE
    // loadProductAgricultureBio();
    //
    //
    // if(!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)){
    //   // setWindowTitle('Pokédex by Alan Santos');
    //   // setWindowMinSize(const Size(1366, 768));
    //
    // }
    runApp(MyApp(pref));
  });

}


void loadProductAgricultureBio() {
  DataLoader dataLoader= const DataLoader();

  dataLoader.createState().initState();
}







//ConnectionPostgresSql pgr = const ConnectionPostgresSql();

//const ConnectionPostgresSql();

/*var databaseConnection = PostgreSQLConnection("localhost", 5432, "ecobio",
      username: "postgres",
      password: "root",
      queryTimeoutInSeconds: 3600,
      timeoutInSeconds: 3600);

  initDatabaseConnection() async {
    databaseConnection.open().then((value) {
      debugPrint("Database Connected!");
    });
  }
*/

// conectionDbSqlLite();

//    ConnectionSqlLite();

// database = await openDatabase(
//   //  by default path for database on the device is /data/data/<your app id>/databases/<your database file.db>
//     join(await getDatabasesPath(), 'ofs_sms_database.db'),
//     version: 1, onCreate: (Database ddatabase, int version) async {
//   await database?.execute(
//       "CREATE TABLE smslogs(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, employeeID TEXT, department TEXT, module TEXT, message TEXT, safeUnsafeStatus TEXT, contactNo Text, dateTime INTEGER)");
// });

// Database? database;

/* var databasesPath = await getDatabasesPath();
 String path = join(databasesPath, '../../assets/database/ecobio_data.db');
// databaseExists(path);

  ///
  /// Check if a database exists at a given path.
  ///
  Future<bool> databaseExists(String path) => databaseFactory.databaseExists(path);



  // Check if the database exists
  var exists = await databaseExists(path);

  if (!exists) {
    // Should happen only the first time you launch your application
    print("Creating new copy from asset");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", "database.db"));
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
   // await File(path).writeAsBytes(bytes, flush: true);

  } else {
    print("Opening existing database");
  }
// open the database
  database = await openDatabase(path, readOnly: true);

  */
//}

// ----------------------------INIT DATABASE ---------------------------

//---------------- APP NORMALE----------------------
/*void main() {
  runApp(const MyApp());
}

*/
//--------------------------------------------
// ----------------------------END DATABASE---------------------------
class MyApp extends StatelessWidget {
  //MyApp({Key? key}) : super(key: key);
  final SharedPreferences prefs;

  // final Locale _locale = const Locale('it', 'it');
  const MyApp(this.prefs, {super.key});



//DataLoader dataLoader =  const DataLoader();

  // This widget is the root of your application.
  @override
  Widget build2222(BuildContext context) {
    final currentWidth=MediaQuery.of(context).size.width;
    final botToastBuilder = BotToastInit();

    return MaterialApp(
   ///   debugShowCheckedModeBanner: false,
     // title: 'Flutter Admin Panel',
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: bgColor,
      //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      //       .apply(bodyColor: Colors.white),
      //   canvasColor: secondaryColor,
      // ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        child: MaterialApp(
        title: 'ecobioWEB',
        builder: (context, child) {
          child = botToastBuilder(context, child);
          return child;
        },

        ///Localization implement language App
        // List all of the app's supported locales here
        supportedLocales: const [
          // Locale('it'), // Italien
          // Locale('en'), // English
          // Locale('fr'), // Franch
          // Locale('es'), // Spanish
          // Locale('de'), // Germany

          Locale('it', 'IT'),
          Locale('fr', 'FR'),
          Locale('en', 'US'),
          Locale('es', 'ES'),
          Locale('de', 'DE'),

        ],

        // These delegates make sure that the localization data for the proper language is loaded
        localizationsDelegates: const [
          // THIS CLASS WILL BE ADDED LATER
          // A class which loads the translations from JSON files
          //AppLocalizations.delegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,

          GlobalCupertinoLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
        ],

        // supportedLocales: AppLocalizations.supportedLocales,
        // Returns a locale which will be used by the app
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }

          // AppLocalizations.saveLanguageApp(context, supportedLocales.first.toString(),true);
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },


        /// INITIALIZED LANGUAGE APP SETTING SCREEN

        //var  countryListPickd=  CountryListPick.createStateInizialize();


        // theme: lightTheme,
        /// navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        /// Route pagina inizial app
        routes: router.Router.getRoutes(context),
        initialRoute: "/",


        // DataLoader,

        //  DataLoader(),
        // dataLoader.createState().initState();

        // home: const MenuNavigationComponents(),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //  DataLoader(),
    //ok dataLoader.createState().initState();
    // GetItRegister.register();

    final currentWidth=MediaQuery.of(context).size.width;
    final botToastBuilder = BotToastInit();



    return ThemeProvider(
      //   initTheme:this.prefs.getBool("greenTheme") ?? false ? greenTheme : greenTheme,
      //      saveThemesOnChange: false, // per adesso non serve salvarlo
        saveThemesOnChange: false,
        loadThemeOnInit: false,

        onInitCallback: (controller, previouslySavedThemeFuture) async {
          final view = View.of(context);
          String? savedTheme = await previouslySavedThemeFuture;
          if (savedTheme != null) {
            controller.setTheme(savedTheme);
          } else {
            Brightness platformBrightness =
            // ignore: use_build_context_synchronously
            view.platformDispatcher.platformBrightness;
            if (platformBrightness == Brightness.dark) {
              controller.setTheme('default_light_theme');
            } else {
              controller.setTheme('default_light_theme'); 
            }
            controller.forgetSavedTheme();
          }
          /// LOAD PRODUCT AGRICULTURE BIOLOGIQUE
          // loadProductAgricultureBio();

        },

        child: MaterialApp(
          title: 'ecobioWEB',
          builder: (context, child) {
            child = botToastBuilder(context, child);
            return child;
          },



          ///Localization implement language App
          // List all of the app's supported locales here
          supportedLocales: const [
            // Locale('it'), // Italien
            // Locale('en'), // English
            // Locale('fr'), // Franch
            // Locale('es'), // Spanish
            // Locale('de'), // Germany

            Locale('it', 'IT'),
            Locale('fr', 'FR'),
            Locale('en', 'US'),
            Locale('es', 'ES'),
            Locale('de', 'DE'),

          ],

          // These delegates make sure that the localization data for the proper language is loaded
          localizationsDelegates: const [
            // THIS CLASS WILL BE ADDED LATER
            // A class which loads the translations from JSON files
            //AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,

            GlobalCupertinoLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
          ],

          // supportedLocales: AppLocalizations.supportedLocales,
          // Returns a locale which will be used by the app
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }

            // AppLocalizations.saveLanguageApp(context, supportedLocales.first.toString(),true);
            // If the locale of the device is not supported, use the first one
            // from the list (English, in this case).
            return supportedLocales.first;
          },


          /// INITIALIZED LANGUAGE APP SETTING SCREEN

          //var  countryListPickd=  CountryListPick.createStateInizialize();


          // theme: lightTheme,
         /// navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          /// Route pagina inizial app
          routes: router.Router.getRoutes(context), 
          initialRoute: "/",


          // DataLoader,

          //  DataLoader(),
          // dataLoader.createState().initState();

          // home: const MenuNavigationComponents(),
          //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        )
    );
  }

  static of(BuildContext context) {
  }



    // state?.setState((){
    //   state._locale=newLocale;
    // });
  }




/*
  To Change Locale of App
   */
// void setLocale(BuildContext context,Locale newLocale) async {
//   // _MainAppState? state =context.findAncestorStateOfType<_MainAppState>();
//  // _MainAppState? state =context.findAncestorStateOfType<_MainAppState>();
//
//   var prefs =await SharedPreferences.getInstance();
//   prefs.setString('languageCode', newLocale.languageCode);
//   prefs.setString('countryCode', newLocale.countryCode!);
//
//   // state?.setState((){
//   //   state._locale=newLocale;
//   // });
// }

// void loadProductAgricultureBio() {
//   DataLoader dataLoader= const DataLoader();
//
//   dataLoader.createState().initState();
// }
//}


/*abstract class AppLocalizations {

AppLocalizations(String locale) : localeName = intl){

    final String localeName; 
    Static AppLocalizations? of(BuildContext()){
      return Localizations.of<AppLocalizations>(context);
    }

    static const LocalizationsDelegate(<AppLocalizations>)
  }
}
*/
/*
class LocalizationSystemPage extends StatefulWidget {
  const LocalizationSystemPage({Key? key}) : super(key: key);

  @override
  _LocalizationSystemPage createState() => _LocalizationSystemPage();
}

class _LocalizationSystemPage {


}*/
//************************************



int currentIndex = 0;
void navigateToScreens(int index) {
  currentIndex = index;
}

