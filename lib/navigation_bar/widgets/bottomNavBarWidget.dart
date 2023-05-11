import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        navigateToScreens(index);
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          //title: Text(
          label:'Home',
         /* title: Text(
            'Home',
            style: TextStyle(color: Color(0xFF545454)),
          ),*/
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.heart),
          // ignore: deprecated_member_use
          label:'Wish List',
         /* title: Text(
            'Wish List',
            style: TextStyle(color: Color(0xFF545454)),
          ),
          */
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.shoppingBag),
          label:'Cart',
        /*  title: Text(
            'Cart',
            style: TextStyle(color: Color(0xFF545454)),
          ),
          */
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.dashcube),
          label:'Dashboard',
         /* title: Text(
            'Dashboard',
            style: TextStyle(color: Color(0xFF545454)),
          ),
          */
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFFAA292E),
      onTap: _onItemTapped,
    );
  }

  int currentIndex = 0;
  void navigateToScreens(int index) {
    currentIndex = index;
  }

}
