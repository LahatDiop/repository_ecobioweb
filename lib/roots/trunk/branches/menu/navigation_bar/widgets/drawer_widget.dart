import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../menu_home/screens/wish_list_screen.dart';
import '../../menu_settings/settings/auth/singin/models/app_singin.dart';

/*
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_ecommerce_app/screens/WishListScreen.dart';
import 'package:flutter_ecommerce_app/components/AppSignIn.dart';

*/

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createDrawerHeader(),
            /*  _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage2()),
                    )),
                    */
            _createDrawerItem(
                icon: FontAwesomeIcons.user,
                text: 'Sign In',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AppSignIn()),
                    )),
            _createDrawerItem(
                icon: Icons.favorite_border,
                text: 'Wish List',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WishListScreen()),
                    )),
            _createDrawerItem(
                icon: Icons.call,
                text: 'Contact Us',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmptyWishListScreen()),
                    )),
          ],
        ),
      ),
    );
  }
}

Widget _createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Stack(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Image.asset(
              'assets/images/inspiration/ic_app_icon.png',
              width: 130,
              height: 130,
            ),
          ),
        ),
        const Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Developed for learing purpose by 'TARIKUL'",
                style: TextStyle(
                    color: Color(0xFF545454),
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

Widget _createDrawerItem(
    {required IconData icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: const Color(0xFF808080),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF484848)),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
