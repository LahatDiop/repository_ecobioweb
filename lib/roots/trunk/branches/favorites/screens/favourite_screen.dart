import 'package:ecobioweb/roots/trunk/branches/favorites/provider/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../commun_data_utils/utils/text/app_text.dart';
import '../../products/components/product.dart';
import '../../products/screens/product_details_screen.dart';
import '../widgets/grocery_item_card_widget.dart';
import 'filter_screen.dart';

class FavouriteScreen extends StatelessWidget {
// class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});
   // FavouriteScreen({this.productsFavorite, super.key});
  // List<Product>?  productsFavorite=[];

   List<Product>?  productsFavorite=FavoriteProvider().favoriteItems;
  @override
  Widget build(BuildContext context) {

    //  var ListProductFromJson=  context.read<AgricultureBiologicalProvider>().getData(_tabController.index.toInt());
    //
    // List<Product>  products = context.read<AgricultureBiologicalProvider>().products;



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
        ],
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: const AppText(
            text: "Favorites",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      body: Column(
          children:<Widget> [
            /// Title Agriculture Biodynamic
           /// createSubTitle(),
            Expanded(
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              // height: MediaQuery.of(context).size.height * 100,
              child: SingleChildScrollView(
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 0.0,
                  // I only need two card horizontally
                  children: productsFavorite!.asMap().entries.map<Widget>((e) {
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
      ),
      // body: SingleChildScrollView(
      //   child: StaggeredGrid.count(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 3.0,
      //     crossAxisSpacing: 0.0,
      //     // I only need two card horizontally
      //     children: productsFavorite!.asMap().entries.map<Widget>((e) {
      //       // GroceryItem groceryItem = e.value;
      //       Product product = e.value;
      //       return GestureDetector(
      //         onTap: () {
      //           onItemClicked(context, product);
      //         },
      //         child: Container(
      //           padding: const EdgeInsets.all(10),
      //           child: GroceryItemCardWidget(
      //             item: product,
      //             heroSuffix: "favorite_screen",
      //           ),
      //         ),
      //       );
      //     }).toList(), // add some space
      //   ),
      // ),
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


