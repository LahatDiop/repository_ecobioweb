import 'package:ecobioweb/roots/trunk/branches/cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../commun_data_utils/utils/button/app_button.dart';
import '../../../commun_data_utils/utils/text/app_text.dart';
import '../../../commun_data_utils/utils/theme/app_theme.dart';
import '../../navigation_bar/components/menu_navigation_components.dart';
import '../controllers/MenuAppController.dart';

class WelcomeScreen extends StatelessWidget {
  final String imagePath = "assets/images/home/welcome_image.png";

  bool _disposed = false;

  void dispose() {
    _disposed = true;
    dispose();
  }

  void notifyListeners() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {


    return MultiProvider(providers:  [
      ///ChangeNotifierProvider<WelcomeScreen>(create: (_)=>WelcomeScreen()),
      ChangeNotifierProvider(
        create: (context) => MenuAppController(),
      ),
    ],
      child: Navigator(onGenerateRoute: (RouteSettings settings){

        return MaterialPageRoute(builder: (context){
          return WelcomeScreen();
        });
      },),

      builder: (context,child){
       /// int tabIndex=0;

             return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),
                    icon(),
                    const SizedBox(
                      height: 20,
                    ),
                    welcomeTextWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    sloganText(),
                    const SizedBox(
                      height: 40,
                    ),
                    getButton(context),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ));
      },
    );

  }
  Widget build1(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                icon(),
                const SizedBox(
                  height: 20,
                ),
                welcomeTextWidget(),
                const SizedBox(
                  height: 10,
                ),
                sloganText(),
                const SizedBox(
                  height: 40,
                ),
                getButton(context),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }

  Widget icon() {
    String iconPath = "assets/icons/app_icon.svg";
    return SvgPicture.asset(
      iconPath,
      width: 48,
      height: 56,
    );
  }

  Widget welcomeTextWidget() {
    return const Column(
      children: [
        AppText(
          text: "welcome",
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        AppText(
          text: "to our store Ecobio",
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget sloganText() {
    return AppText(
      text: "Get your grecories as fast as in hour",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xffFCFCFC).withOpacity(0.7),
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Get Started",
      fontWeight: FontWeight.w600,
      padding: const EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        onGetStartedClicked(context);
      },
    );
  }

  void onGetStartedClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(
         MaterialPageRoute(
      builder: (BuildContext context) {
        // return DashboardScreen();
        return const MenuNavigationComponents();
      },
    ));
  }
}
