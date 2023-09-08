
import 'package:flutter/material.dart';
import '../../category/widgets/homeListElementsMenu.dart';
import '../../home/screens/wishListScreen.dart';
import '../../search/screen/searchScreen.dart';
import '../../settings/admin/screens/setting_screen.dart';
import '../../shopping/screens/shopping_cart_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


/* ------------------------------------INI MENU NAVIGATION BAR CONVEX------------------------------------- */

// Home--> category : Agricullture Bio, Produits bio, Apiculture bio , Hotel Bio, Vegane Bio
// Add --> new publication

class MenuNavigation extends StatefulWidget {
  const MenuNavigation({Key? key}) : super(key: key);

  @override
  _HomePageAppSetting createState() => _HomePageAppSetting();
}

const _kPages = <String, IconData>{
  'Home': Icons.home,
  'Search': Icons.search,
  'Categorty': Icons.category,
  'Buy': Icons.shopping_cart,
  'Setting': Icons.settings_applications,
  // 'Add': Icons.add,
  // 'Search': Icons.search,

  // 'people': Icons.people,
  // 'map': Icons.map,
};

class _HomePageAppSetting extends State<MenuNavigation> {
  //Elements list menu navigation bar
  final List<Widget> pagesContainer = [
    // HOME 1
    const HomeCategoryViewScreen(),
    //const HomeScreen(),

    // SEARCHE 2
    //SearchWidget(),
    const SearchScreen(),

    // LOCALIZATION
    //const GestionLocalization(),
    const WishListScreen(),

    // CATEGORY 3

    // list agri

    // SubCategoryScreen(
    //    slug: '',
    //  ),

    //BY SHOPPING 3
     ShoppingCartScreen(),

    //ADD NEW PUBLICATION
    // const PublicationScreen(),

    // const HomeScreen()

    //PROFILE 5
     SettingScreen(),

    // ProfilePage(),
  ];

  TabStyle _tabStyle = TabStyle.fixed;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //length: 6,
      length: _kPages.length,

      initialIndex: 0, // home page initial = 0
      child: Scaffold(
        /*  appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          //leading: const Icon(Icons.close),
          title: const Text('Setting Profile',
              style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        */
        body: Column(
          children: [
            // TODO back _buildStyleSelector(),
            const Divider(),
            Expanded(
              child: TabBarView(
                /* children: [
                  // for (final icon in _kPages.values) Icon(icon, size: 64),
                  for (final icon in _kPages.values) Icon(icon, size: 64),
                  
                ],*/

                children: pagesContainer,
              ),
            ),
          ],
          //  children: pagesContainer,
        ),

        /*  body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),*/
        // BUTTON MENU BAR
        bottomNavigationBar: ConvexAppBar.badge(
          // Optional badge argument: keys are tab indices, values can be
          // String, IconData, Color or Widget.
          /*badge=*/
          const <int, dynamic>{5: '99+'},
          style: _tabStyle,
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          // ignore: avoid_print
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }

  // Select style enum from dropdown menu:
  Widget _buildStyleSelector() {
    final dropdown = DropdownButton<TabStyle>(
      value: _tabStyle,
      onChanged: (newStyle) {
        if (newStyle != null) setState(() => _tabStyle = newStyle);
      },
      items: [
        for (final style in TabStyle.values)
          DropdownMenuItem(
            value: style,
            child: Text(style.toString()),
          )
      ],
    );
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      title: const Text('Bio Market:'),
      trailing: dropdown,
    );
  }
} /* ------------------------------------END MENU NAVIGATION BAR CONVEX------------------------------------- */
