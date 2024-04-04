
import 'package:ecobioweb/roots/trunk/branches/favorites/screens/favourite_screen.dart';
import 'package:ecobioweb/roots/trunk/branches/menu/menu_home/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../roots/trunk/branches/menu/menu_settings/settings/admin/screens/setting_screen.dart';
import '../../roots/trunk/branches/menu/navigation_bar/components/menu_navigation_components.dart';

abstract class Router{
  static String home ="/";
  // static String homeMenu ="/menu";
  static String items="/items";
  // static  const String settingsScreenRoute = '/settingsScreenRoute';
  //  static  const String menuNavigationComponents = '/menuNavigationComponents';
  //  static  const String favouriteScreen = '/favouriteScreen';



  static Map<String, WidgetBuilder> getRoutes(context){
    return{
         home:(context) => SplashScreen(),

      // home:(context) =>const MenuNavigationComponents(),
     ///   home:(context) => SplashScreen(),
      /// homeMenu:(context) => const MenuNavigationComponents(),
      // favouriteScreen:(context) => FavouriteScreen(),
      // menuNavigationComponents:(context) => const MenuNavigationComponents(),
      //  settingsScreenRoute:(context)=>  SettingScreen(),
      // items:(context) => ItemsPage(),
    };
  }

  // static getRoutesAbsoluto(context){
  //   return{
  //     home:(context) =>const MenuNavigationComponents(),
  //     // items:(context) => ItemsPage(),
  //   };
  // }
}