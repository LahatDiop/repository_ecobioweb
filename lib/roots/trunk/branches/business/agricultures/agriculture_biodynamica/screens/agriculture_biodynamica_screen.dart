import 'package:ecobioweb/roots/trunk/branches/cart/provider/cart_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/cart/screens/cart_screen.dart';
import 'package:ecobioweb/roots/trunk/branches/commun_data_utils/utils/theme/app_theme.dart';
import 'package:ecobioweb/roots/trunk/branches/favorites/provider/favorites_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/favorites/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../../cart/components/cart_item.dart';
import '../../../../commun_data_utils/utils/text/app_text.dart';
import '../../../../favorites/screens/filter_screen.dart';
import '../../../../favorites/widgets/grocery_item_card_widget.dart';
import '../../../../localisation/translation/components/appLocalizations.dart';
import '../../../../menu/menu_search/screens/search_screen.dart';
import '../../../../products/components/product.dart';
import '../../../../products/screens/product_details_screen.dart';
import '../provider/agriculture_biodynamica_provider.dart';



class AgricultureBiodynamicaScreen extends StatelessWidget {



  AgricultureBiodynamicaScreen({this.productsFavorite, super.key});

  List<Product> products = [];

  Map<String, CartItem> cartItems={};

  Map<String, Product> productItems = {};

  // List<Product>?  productsFavorite=FavoriteProvider().itemsFavorites;

   List<Product>?  productsFavorite=FavoriteProvider().itemsFavoritesList;

  Map<String, Product> itemsFavorite=FavoriteProvider().favorites;

  TextEditingController textInputSearch =  TextEditingController();

  // AppLocalizations appLocalizations=  AppLocalizations("");

  @override
  Widget build(BuildContext context) {


    return MultiProvider(providers:  [
       ChangeNotifierProvider<AgricultureBiodynamicaProvider>(create: (_)=>AgricultureBiodynamicaProvider()),
       ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ],
        child: Navigator(onGenerateRoute: (RouteSettings settings){

          return MaterialPageRoute(builder: (context){
            return AgricultureBiodynamicaScreen();
          });
        },),

      builder: (context,child){
           int tabIndex=0;
      final agricultureBiodynamicProvider=Provider.of<AgricultureBiodynamicaProvider>(context);
        var listProductsBioDynamica = context.read<AgricultureBiodynamicaProvider>().getData(tabIndex);

        cartItems=context.read<CartProvider>().cartItems;

        products =context.read<AgricultureBiodynamicaProvider>().products;
       productItems =context.read<AgricultureBiodynamicaProvider>().productItems;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 25),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
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
            title: TextField(
              controller:textInputSearch ,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  filled: true,
                  // fillColor: Colors.white70,
                  fillColor: Colors.green.shade100,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    // borderSide:  const BorderSide(color: Colors.white),
                    borderSide:  const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:  const BorderSide(color: Colors.white),
                    borderRadius:  BorderRadius.circular(25.7),
                  ),

                  hintText: AppLocalizations.translate("search_point"),
                  labelText: "",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    color: const Color.fromRGBO(90, 25, 72, 1),
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch(products, textInputSearch.value.text.toString()));
                    },
                  )
              ),
              style: const TextStyle(color: Colors.black, fontSize: 15.0),
            ),

          ),

          body: Column(
            children:<Widget> [
              /// Title Agriculture Biodynamic
                 createSubTitle(),
                Expanded(
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  // height: MediaQuery.of(context).size.height * 100,
                  child: SingleChildScrollView(

                    child:products.isNotEmpty?

                    // child: StaggeredGrid.count(
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3.0,
                      crossAxisSpacing: 0.0,

                      // I only need two card horizontally
                      children: products.asMap().entries.map<Widget>((e) {
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
                              heroSuffix: "agriculture_biodynamica_screen",
                            ),
                          ),
                        );
                      }).toList(), // add some space
                    ):Container(),
                  ),

                  ),
                ]
          ),

        );
      },
    );


    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     centerTitle: true,
    //     automaticallyImplyLeading: false,
    //     leading: GestureDetector(
    //       onTap: () {
    //         Navigator.pop(context);
    //       },
    //       child: Container(
    //         padding: const EdgeInsets.only(left: 25),
    //         child: const Icon(
    //           Icons.arrow_back_ios,
    //           color: Colors.black,
    //         ),
    //       ),
    //     ),
    //     actions: [
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => FilterScreen()),
    //           );
    //         },
    //         child: Container(
    //           padding: const EdgeInsets.only(right: 25),
    //           child: const Icon(
    //             Icons.sort,
    //             color: Colors.black,
    //           ),
    //         ),
    //       ),
    //     ],
    //     title: Container(
    //       padding: const EdgeInsets.symmetric(
    //         horizontal: 25,
    //       ),
    //       child: const AppText(
    //         text: "Favorites",
    //         fontWeight: FontWeight.bold,
    //         fontSize: 20,
    //       ),
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //
    //     child:productsFavorite!.isNotEmpty?
    //
    //     // child: StaggeredGrid.count(
    //      StaggeredGrid.count(
    //       crossAxisCount: 2,
    //       mainAxisSpacing: 3.0,
    //       crossAxisSpacing: 0.0,
    //
    //                 // I only need two card horizontally
    //       children: productsFavorite!.asMap().entries.map<Widget>((e) {
    //         // GroceryItem groceryItem = e.value;
    //         Product groceryItem = e.value;
    //         return GestureDetector(
    //           onTap: () {
    //             onItemClicked(context, groceryItem);
    //           },
    //           child: Container(
    //             padding: const EdgeInsets.all(10),
    //             child: GroceryItemCardWidget(
    //               item: groceryItem,
    //               heroSuffix: "explore_screen",
    //             ),
    //           ),
    //         );
    //       }).toList(), // add some space
    //     ):Container(),
    //   ),
    // );
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
  /// Agriculture Biodynamic
  createSubTitle() {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      alignment: Alignment.topLeft,
      child:
      Text(
        AppLocalizations.translate('agricultureBiodynamic').toString(),
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ),
    );
  }




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


