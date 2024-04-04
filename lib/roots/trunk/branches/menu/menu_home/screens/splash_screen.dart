import 'dart:async';
import 'dart:ui';

import 'package:ecobioweb/main.dart';
import 'package:ecobioweb/market/providers/market_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/languages/provider/language_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/localisation/country/widget/countries.dart';
import 'package:ecobioweb/roots/trunk/branches/managements/roles/provider/roles_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/managements/users/provider/users_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/menu/menu_home/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../commun_data_utils/utils/theme/app_theme.dart';
import '../../../localisation/country/widget/country_list_pick.dart';
import '../../../localisation/translation/components/appLocalizations.dart';
import '../../navigation_bar/components/menu_navigation_components.dart';

/// Home Page initial app
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  String? languageCodeDevice;


  @override
  void initState()  {
    super.initState();
    loadSplashScreenAsync();
    /// 1. Load  Markets
      MarketProvider marketProvider=MarketProvider();
      marketProvider.getDataMarket(context, languageCodeDevice);

      /// 2. Load Countries Enabled
      Countries countries =Countries();
        countries.loaderData();

        ///Load Roles
       RolesProvider rolesProvider =RolesProvider();
         rolesProvider.initilizeLoadListRoles();

    ///3. load Languages
    LanguageProvider languageProvider =LanguageProvider();
    // languageProvider.languages;

  ///Load User
  //   UsersProvider usersProvider =UsersProvider();
  //   usersProvider.initializeDb()


  }

  void loadSplashScreenAsync()  {
    String? currentCodeLang;
    bool? isInitializedLang=false;
    /// Load Lang
    //  AppLocalizations appLocalizations=AppLocalizations();

    ///"en_US"
    String localeDefault = Intl.getCurrentLocale();
    ///it_IT
    Locale deviceLocale = window.locale;// or html.window.locale

    ///"it"
       languageCodeDevice = deviceLocale.languageCode;

    AppLocalizations.saveLanguageApp(languageCodeDevice!,isInitializedLang);

    const delay = Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }


  void onTimerFinished() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) {
      //  return const MenuNavigationComponents();
       return WelcomeScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}

Widget splashScreenIcon() {
  String iconPath = "assets/icons/splash_screen_icon.svg";
  return SvgPicture.asset(
    iconPath,
  );
}
