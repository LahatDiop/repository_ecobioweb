import 'dart:convert';

// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../products/components/product.dart';
// import '../modules/products/components/product.dart';


/* ------------------------------------INI MENU NAVIGATION BAR CONVEX------------------------------------- */

// Home--> category : Agricullture Bio, Produits bio, Apiculture bio , Hotel Bio, Vegane Bio
// Add --> new publication

class DataLoader extends StatefulWidget {
  const DataLoader({Key? key}) : super(key: key);

  @override
  DataLoaderAppSetting createState() => DataLoaderAppSetting();
}



class DataLoaderAppSetting extends State<DataLoader>  with TickerProviderStateMixin {

  late String category;
  late String categoryToLoad="agricultureBiological";

  bool isFlagLoaderEnabled = true;

  List<dynamic> cartItems = [];
  List<dynamic> cartItemsList = [];
  List<int> cartItemCount = [0, 0, 0, 0, 0, 0, 0, 0];

  Map<String, Product> mapProductsAgriBio = <String, Product>{};
  final Map <String, Product> _productItems={};

  var indexTab;


  @override
  void initState() {
    fetchItems(categoryToLoad, isFlagLoaderEnabled).whenComplete(() => setState(() {}));
    super.initState();
  }

  Future<void> fetchItems(String categoryToLoad,bool flagItemEnabled) async {
    cartItems.length;
    mapProductsAgriBio= _productItems;

/*
   if(mapProductsAgriBio.isEmpty){
      isLoadedlistProduct=true;
   }
   */
    if (flagItemEnabled && isFlagLoaderEnabled) {
      final String response =
      await rootBundle.loadString('../../assets/json/products.json');
      final data = await json.decode(response);
      //var indexTab = 0;
      cartItemsList = data['products'].map((data) => Product.fromJson(data)).toList();

      cartItemCount.add(cartItemsList.length);

      // quantityXArticlesAdd.clear();

      // ADD THE LIST OF PRODUCTS INTO THE MAP PRODUCT LIST
      for (var product in cartItemsList) {
        addListProductItems(product);
      }
      cartItemCount.add(cartItemsList.length);

      // Disabled flagItemEnabled per evitare di caticare la lista json per ogni click
      flagItemEnabled = false;
    }

    //cartItems.clear();
    for (var i in cartItemsList) {
           cartItems.add(i);
          category = i.category;
    }

    // Arrivo dalla home Tab default = 0 Fruits and Vegetable
    // TAB_0 --> FRUITS  AND VEGETABLE
    // if (indexTab == 0) {
    //   cartItems.clear();
    //   for (var i in cartItemsList) {
    //     cartItems.add(i);
    //      category = AppLocalizations.translate('fruitsVegetable').toString() .toLowerCase();
    //   }
    //   //flagItemEnabled = false;
    // } else
    //   // TAB_1 --> FRUITS
    // if (indexTab == 1) {
    //   cartItems.clear();
    //   for (var i in cartItemsList) {
    //     if (i.category.toString().toLowerCase() ==
    //         AppLocalizations.translate('fruits').toString().toLowerCase()) {
    //       cartItems.add(i);
    //       category = i.category.toString().toLowerCase();
    //     }
    //   }
    // } else {
    //   // TAB_0 --> VEGETABLE
    //   //if (indexTab == 2) {
    //   cartItems.clear();
    //   for (var i in cartItemsList) {
    //    // if (i.category.toString().toLowerCase() ==
    //     //    AppLocalizations.translate('vegetables').toString().toLowerCase()) {
    //       cartItems.add(i);
    //       category = i.category;
    //   //  }
    //   }
    // }
    // generateCodeProd();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  void addListProductItems(Product product) {

    if (_productItems.containsKey( product.codeProd)) {

    } else {
      _productItems.putIfAbsent(
          product.codeProd,
              () => Product(
              product.id,
              product.codeProd,
              product.name,
              product.description,
              product.price,
              product.quantityStock, product.quantity,
              product.category,
              product.brand,
              product.brandModel,
              product.codeEan,
              product.codeQr,
              product.country,
              product.city,
              product.currency,
              product.kilometer,
              product.imageURL,
              product.image,
              product.datePublication,
              product.dateUpdate,
              product.isFavorite,
              product.isEnabled));
    }

  }
}





/* ------------------------------------END MENU NAVIGATION BAR CONVEX------------------------------------- */
