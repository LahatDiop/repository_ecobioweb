

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../products/components/product.dart';
import '../detailCategory/agriculture_biologique.dart';

class GestionAgricultureBio extends StatefulWidget{

   GestionAgricultureBio({Key? key, this.product,  this.productItemsList,  this.productItemsMap}): super(key: key);


  final Product? product;

   List<dynamic>? productItemsList = [];
   Map<String,Product>? productItemsMap=<String,Product>{} ;

   ///Map<String, List<dynamic>>? productItemsMap2 =  <String, List<dynamic>>{};


   @override

_GestionAgriBioStatate createState() => _GestionAgriBioStatate();


  }

class _GestionAgriBioStatate extends State<GestionAgricultureBio> with TickerProviderStateMixin {

  bool flagLoaderIsEnabled = true;

  List<dynamic>?  productItemsList =  GestionAgricultureBio().productItemsList;
  Map<String, Product>?  productItemsMap=GestionAgricultureBio().productItemsMap;



  @override
  // void initState() {
  //
  //   ///  DataLoader dataLoader= const DataLoader();
  //   // fetchItems(indexTab, flagLoaderIsEnabled).whenComplete(() => setState(() {}));
  //     fetchItems(flagLoaderIsEnabled).whenComplete(() => setState(() {}));
  //   super.initState();
  // }
  // Future<void> fetchItems(bool flagLoaderIsEnabled) async {
  //
  //   final String response =
  //   await rootBundle.loadString('assets/json/products.json');
  //   final data = await json.decode(response);
  //
  //   productItemsList = data['products'].map((data) => Product.fromJson(data)).toList();
  //   ///productItemsMap?.putIfAbsent("product", () => productItemsList!.toList());
  //
  //
  //
  //
  //   // Navigator.of(context).push(MaterialPageRoute(
  //   //   builder: (context) => AgricultureBiologique(),
  //   // ));
  //   // Future build(BuildContext context) {
  //   //   return  Navigator.of(context).push(MaterialPageRoute(
  //   //       builder: (context) => AgricultureBiologique(),
  //   //      )
  //   //   );
  //   // }
  //
  // }


  @override
  Widget build(BuildContext context) {
  return Container();
  }

  // void onCategoryItemClicked(BuildContext context) {
  //   Navigator.of(context).push( MaterialPageRoute(
  //     builder: (BuildContext context) {
  //       return ShoppingCartScreen();
  //     },
  //   ));
  // }
}





