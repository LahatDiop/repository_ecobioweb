import 'package:ecobioweb/roots/trunk/branches/favorites/provider/favorites_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/menu/menu_home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../cart/provider/cart_provider.dart';
import '../../cart/screens/cart_screen.dart';
import '../../commun_data_utils/utils/helper/padded.dart';
import '../../commun_data_utils/utils/text/app_text.dart';
import '../../commun_data_utils/utils/theme/app_theme.dart';
import '../../menu/navigation_bar/components/menu_navigation_components.dart';
import '../../products/components/product.dart';
import '../../products/screens/product_details_screen.dart';
import '../../search/widgets/search_bar_widget.dart';
import '../widgets/grocery_item_card_widget.dart';
import 'filter_screen.dart';


class FavouriteScreen extends StatelessWidget {
  TextEditingController textInputSearch =  TextEditingController();


  static  const String menuNavigationComponents = '/menuNavigationComponents';
  static  const String favouriteScreen = '/favouriteScreen';

// class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});

  // final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {


    return MultiProvider(providers:  [
      ChangeNotifierProvider<FavoriteProvider>(create: (_)=>FavoriteProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_)=>CartProvider()),
      ChangeNotifierProvider<AgricultureBiologicalProvider>(create: (_) => AgricultureBiologicalProvider()),
    ],
      child: Navigator(onGenerateRoute: (RouteSettings settings){

        return MaterialPageRoute(builder: (context){
          return FavouriteScreen();
        });
      },),

      builder: (context,child){

        final favoriteProvider=Provider.of<FavoriteProvider>(context);
        final cartProvider=Provider.of<CartProvider>(context);
        ///final agriBio=Provider.of<AgricultureBiologicalProvider>(context);
       /// var listProducts= context.read<AgricultureBiologicalProvider>().getData(tabIndex);


        List<Product>?  productsFavorite=FavoriteProvider().favoriteItems;

        // cartItems=context.read<CartProvider>().cartItems;
        // //  products =context.read<CartProvider>().products;
        // products =context.read<CartProvider>().getProducts();


        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: Navigator.canPop(context) ?
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                 size: 30,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
                : null,

            // leading: const BackButton(
            //   color: Colors.black,
            // ),

            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilterScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.sort,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: ( ) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavouriteScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.shopping_cart_checkout,
                    color: AppColors.greenColor,
                  ),
                ),
              ),
            ],
            ///Search
            ///Search
            title: Padded.padded(SearchBarWidget(textInputSearch)),

          ),

          // resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.grey.shade100,
            body:Builder(builder: (context){
              return   Column(
                  children:<Widget> [

                    /// Title Agriculture Biodynamic
                    /// createSubTitle(),
                    ///

                    Expanded(
                      // padding: const EdgeInsets.symmetric(horizontal: 20),
                      // height: MediaQuery.of(context).size.height * 100,
                      child: SingleChildScrollView(
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 3.0,
                          crossAxisSpacing: 0.0,
                          // I only need two card horizontally
                          children: productsFavorite.asMap().entries.map<Widget>((e) {
                            // GroceryItem groceryItem = e.value;
                            Product product = e.value;
                            return GestureDetector(
                              onTap: () {
                                onItemClicked(context, product);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: GroceryItemCardWidget(
                                  item: product,
                                  heroSuffix: "favorite_screen",
                                ),
                              ),
                            );
                          }).toList(), // add some space
                        ),
                      ),

                    ),
                  ]
              );
            }
            ),
        );
      },
    );


  }


  // void onItemClicked(BuildContext context, GroceryItem groceryItem) {
  void onItemClicked(BuildContext context, Product groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
          groceryItem,
          heroSuffix: "explore_screen",
        ),
      ),
    );
  }
}

void _back(BuildContext context) {
  Navigator.pushAndRemoveUntil<void>(
    context,
    MaterialPageRoute<void>(builder: (BuildContext context) => const MenuNavigationComponents ()),
    ModalRoute.withName('/'),
  );
}

void _back2(BuildContext context) {
  Navigator.pushAndRemoveUntil<void>(
    context,
    MaterialPageRoute<void>(builder: (BuildContext context) => const MenuNavigationComponents ()),
    ModalRoute.withName('/'),
  );
}
_navBackHome(BuildContext context){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => const MenuNavigationComponents(),
      ),
      ModalRoute.withName("/homeMenu")
  );
}
@override
  Widget build1(BuildContext context) {
    return Container(
      child: const Center(
        child: AppText(
          text: "No Favorite Items",
          fontWeight: FontWeight.w600,
          color: Color(0xFF7C7C7C),
        ),
      ),
    );
  }


