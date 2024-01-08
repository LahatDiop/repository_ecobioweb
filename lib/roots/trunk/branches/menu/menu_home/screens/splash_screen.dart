import 'dart:async';
import 'dart:ui';

import 'package:ecobioweb/main.dart';
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

  @override
  void initState()  {
    super.initState();
    loadSplashScreenAsync();
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
    String? languageCodeDevice = deviceLocale.languageCode;

    AppLocalizations.saveLanguageApp(languageCodeDevice,isInitializedLang);

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
