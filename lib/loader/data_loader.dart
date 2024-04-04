import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../roots/trunk/branches/products/components/product.dart';


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

  // List<dynamic>? productItemsList =  GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsList;
  //
  // Map<String, Product>? productItemsMap=GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsMap;


  // List<dynamic> productItemsList =  GestionAgricultureBio().createState().productItemsList;
  //
  // Map<String, Product> productItemsMap=GestionAgricultureBio().createState().productItemsMap;

  List<dynamic>  productItemsList =[];
  Map<String, Product>  productItemsMap={};

  ///-----------------------------------------------------------------------------
    List<Product> _itemsProduct=[];

    List<Product> get itemsProducts{
      return _itemsProduct;
    }

    List<Product> get favoriteItemsProduct{
      return _itemsProduct.where((element) => element.isFavorite!).toList();
    }

    Product findById(String id){
      return itemsProducts.firstWhere((element) => element.id.toString() == id);
    }

  ///-----------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
   /// super.initState();
    fetchProducts(categoryToLoad, isFlagLoaderEnabled);
  }

  Future<void> fetchProducts(String categoryToLoad,bool flagItemEnabled) async {

    try{

      final String response =
      await rootBundle.loadString('assets/json/products.json');
      final data = await json.decode(response);


      productItemsList = data['products'].map((data) => Product.fromJson(data)).toList();

      final extratedData= data as Map<String,dynamic>;

      List<Product> loadedProducts=[];

      extratedData.forEach((productId, product) {
        loadedProducts.add(
                      Product(
                      id :product.id,
                      codeProd:product.codeProd ,
                      type: product.type,
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
                      isFavorite:product.isFavorite== null ? false :product.isFavorite??false,
                      isEnabled:product.isEnabled,
                    ),
                 );
             _itemsProduct=loadedProducts;
      });

     /// GestionAgricultureBio().createState().setProductItemsList(productItemsList);

      /// productItemsMap?.putIfAbsent("product", () => productItemsList.toList());
      // for (var product in productItemsList) {
      //
      //   ///     /// 1- ADD PRODUCT INTO THE CART
      //   AgricultureBiologique().createState().addItemCart(product, 1);
      //   //
      //   //     /// 2- INCREMENT PRODUCT QUANTITY INTO THE CART
      //   AgricultureBiologique().createState().incrementItemCart(product, 1) ;
      //
      //   ///AgricultureBiologique().createState().productItemsList=productItemsList;
      //
      //   ///GestionAgricultureBio().createState().setProductItemsMap(product);
      //
      //    }


      // Disabled flagItemEnabled per evitare di caticare la lista json per ogni click
     // flagItemEnabled = false;
   // }
  }catch(error){
  rethrow;
  }

  }

  Future<void> addItemsProduct(Product newProduct)async {

      try{

        Product product=Product(
          id :newProduct.id,
          codeProd:newProduct.codeProd ,
          type: newProduct.type,
          name:newProduct.name ,
          description:newProduct.description ,
          price:newProduct.price ,
          quantityStock:newProduct.quantityStock ,
          quantity:newProduct.quantity + 1 ,
          category:newProduct.category ,
          brand:newProduct.brand ,
          brandModel:newProduct.brandModel ,
          codeEan:newProduct.codeEan ,
          codeQr:newProduct.codeQr ,
          country:newProduct.country ,
          city:newProduct.city ,
          currency:newProduct.currency ,
          kilometer:newProduct.kilometer ,
          imageURL:newProduct.imageURL ,
          image:newProduct.image ,
          datePublication:DateTime.now().toString() ,
          dateUpdate:newProduct.dateUpdate ,
          isFavorite:newProduct.isFavorite == null ? false :newProduct.isFavorite??false,
          isEnabled:newProduct.isEnabled,
        );

        _itemsProduct.add(product);

      }catch(error){
        rethrow;
      }

  }


  Future<void> editItemProduct(String id,Product editProduct) async {

     final productIndex=_itemsProduct.indexWhere((element) => element.id==id);

  try{

    Product product=Product(
      id :editProduct.id,
      codeProd:editProduct.codeProd ,
      type:editProduct.type ,
      name:editProduct.name ,
      description:editProduct.description ,
      price:editProduct.price ,
      quantityStock:editProduct.quantityStock ,
      quantity:editProduct.quantity ,
      category:editProduct.category ,
      brand:editProduct.brand ,
      brandModel:editProduct.brandModel ,
      codeEan:editProduct.codeEan ,
      codeQr:editProduct.codeQr ,
      country:editProduct.country ,
      city:editProduct.city ,
      currency:editProduct.currency ,
      kilometer:editProduct.kilometer ,
      imageURL:editProduct.imageURL ,
      image:editProduct.image ,
      datePublication:DateTime.now().toString() ,
      dateUpdate:editProduct.dateUpdate ,
      isFavorite:editProduct.isFavorite == null ? false :editProduct.isFavorite??false,
      isEnabled:editProduct.isEnabled,
    );

    _itemsProduct[productIndex]=editProduct;
   // notifyListeners();


  }catch(error){
    rethrow;
  }


}

Future<void> deleteItemProduc(String id) async{


      try{

      }catch(error){
       throw "Could not delete product";
      }
      final existingProductIndex=_itemsProduct.indexWhere((element) => element.id==id);
      _itemsProduct.removeAt(existingProductIndex);

      //notifyListeners();

}



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

 void  addProductItems(Product product) {

    if (productItemsMap.containsKey(product.codeProd)) {

    } else {
      productItemsMap.putIfAbsent(
          product.codeProd,
              () => Product(
                  id :product.id,
                  codeProd:product.codeProd ,
                  type:product.type ,
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
