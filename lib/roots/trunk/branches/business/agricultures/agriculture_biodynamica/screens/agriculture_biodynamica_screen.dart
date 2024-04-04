import 'package:ecobioweb/roots/trunk/branches/cart/provider/cart_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/cart/screens/cart_screen.dart';
import 'package:ecobioweb/roots/trunk/branches/commun_data_utils/utils/theme/app_theme.dart';
import 'package:ecobioweb/roots/trunk/branches/favorites/provider/favorites_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/favorites/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../../cart/components/cart_item.dart';
import '../../../../commun_data_utils/utils/helper/padded.dart';
import '../../../../commun_data_utils/utils/helper/subtitle.dart';
import '../../../../commun_data_utils/utils/text/app_text.dart';
import '../../../../favorites/screens/filter_screen.dart';
import '../../../../favorites/widgets/grocery_item_card_widget.dart';
import '../../../../products/components/product.dart';
import '../../../../products/screens/product_details_screen.dart';
import '../../../../search/widgets/search_bar_widget.dart';
import '../provider/agriculture_biodynamica_provider.dart';



class AgricultureBiodynamicaScreen extends StatelessWidget {

  Function? onPress;

  AgricultureBiodynamicaScreen({this.productsFavorite, super.key});

  List<Product> products = [];

  Map<String, CartItem> cartItems={};

  Map<String, Product> productItems = {};

  // List<Product>?  productsFavorite=FavoriteProvider().itemsFavorites;

  List<Product>?  productsFavorite=FavoriteProvider().itemsFavoritesList;

  Map<String, Product> itemsFavorite=FavoriteProvider().favorites;

  TextEditingController textInputSearch =  TextEditingController();

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
            automaticallyImplyLeading: true,
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
            title: Padded.padded(SearchBarWidget(textInputSearch)),
          ),

          body: Column(
              children:<Widget> [
                /// Title Agriculture Biodynamic
                SubTitle.createSubTitle("agricultureBiodynamic"),
                Expanded(
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  // height: MediaQuery.of(context).size.height * 100,
                  child: SingleChildScrollView(

                    child:products.isNotEmpty?

                    // child: StaggeredGrid.count(
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 3.0,
                      crossAxisSpacing: 0.0,

                      // I only need two card horizontally
                      children: products.asMap().entries.map<Widget>((e) {
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
  }

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

// Widget addFavoriteWidget(BuildContext context, Product product,onPress) {
//   return FavoriteToggleIcon(product: product, favorite: product.isFavorite,);
// }

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


