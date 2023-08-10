
import 'package:ecobioweb/settings/admin/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../menu/components/menuNavigationComponents.dart';

abstract class Router{
  static String home ="/";
  static String items="/items";
  static  const String settingsScreenRoute = '/settingsScreenRoute';

  static Map<String, WidgetBuilder> getRoutes(context){
    return{
      home:(context) =>const MenuNavigationComponents(),
      settingsScreenRoute:(context)=>  SettingScreen(),
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