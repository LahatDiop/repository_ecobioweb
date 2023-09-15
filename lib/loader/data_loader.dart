import 'dart:convert';

// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../category/components/gestion_agriculture_bio.dart';
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

  // List<dynamic> productItemsList =  GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsList;
  // // ignore: prefer_const_literals_to_create_immutables
  // Map<String, Product> productItemsMap=GestionAgricultureBio(productItemsList: [], productItemsMap: <String, Product>{},).productItemsMap;

  List<dynamic>? productItemsList =  GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsList;

  Map<String, Product>? productItemsMap=GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsMap;

  @override
  void initState() {
   /// super.initState();
    fetchItems(categoryToLoad, isFlagLoaderEnabled);
  }

  Future<void> fetchItems(String categoryToLoad,bool flagItemEnabled) async {

    if (flagItemEnabled && isFlagLoaderEnabled) {
      final String response =
      await rootBundle.loadString('assets/json/products.json');
      final data = await json.decode(response);


      productItemsList = data['products'].map((data) => Product.fromJson(data)).toList();

      /// productItemsMap?.putIfAbsent("product", () => productItemsList!.toList());
      for (var product in productItemsList!) {
             setProductItemsMap(product);
         }

      // Disabled flagItemEnabled per evitare di caticare la lista json per ogni click
     // flagItemEnabled = false;
    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

 void  setProductItemsMap(Product product) {

    if (productItemsMap!.containsKey(product.codeProd)) {

    } else {
      productItemsMap?.putIfAbsent(
          product.codeProd,
              () => Product(
                  id :product.id,
                  codeProd:product.codeProd ,
                  name:product.name ,
                  description:product.description ,
                  price:product.price ,
                  quantityStock:product.quantityStock ,
                  quantity:product.quantity ,
                  category:product.category ,
                  brand:product.brand ,
                  brandModel:product.brandModel ,
                  codeEan:product.codeEan ,
                  codeQr:product.codeQr ,
                  country:product.country ,
                  city:product.city ,
                  currency:product.currency ,
                  kilometer:product.kilometer ,
                  imageURL:product.imageURL ,
                  image:product.image ,
                  datePublication:DateTime.now().toString() ,
                  dateUpdate:product.dateUpdate ,
                  isFavorite:product.isFavorite,
                  isEnabled:product.isEnabled,
              )
      );
    }

  }
}





/* ------------------------------------END MENU NAVIGATION BAR CONVEX------------------------------------- */
