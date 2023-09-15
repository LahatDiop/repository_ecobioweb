import 'dart:convert';
import 'package:ecobioweb/shopping/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../cart/cart.dart';
import '../products/components/product.dart';

// Class cart che gestisce il carello
/*Map<String, CartItem> _cartItems = {};
Map<String, CartItem> get cartItems {
  return {..._cartItems};
}
*/

/*
class CartItem {
  final String title;
  final String codeProd;
  final double price;
  final int quantity;
  final int quantityStock;
  final String id;
   String imgUrl;

  CartItem({
    required this.title,
    required this.codeProd,
    required this.price,
    required this.quantityStock,
    required this.quantity,
    required this.id,
    required this.imgUrl,
  });
}
*/
class Cart with ChangeNotifier {
   Map<String, CartItem> _cartItems = {};

   Map<String, CartItem> get cartItems {
     return {..._cartItems};
   }

   final LocalStorage storage = LocalStorage('localeStporage_app');

   // list index single quantiti in the cart
 List<int> quantityProdList= <int>[];

  /// List<int> quantityProdList = [0, 0, 0, 0, 0, 0, 0, 0];

    //List<int>? quantityProdList;

 // List<int> cartItemCount = [0, 0, 0, 0, 0, 0, 0, 0];



  /// ADD PRODUCT TO CART - SAVE PRODUCT TO LOCALSTORAGE - ADD PRODUCT INTO THE CART

   /// ==============================  INIT ADD DATA PRODUCT FROM CART MAP CART   =============================================
//  aggiunge prodotti nel carello
   void addItemCart(Product product,int index) {
//   void addItemCart(String productId, double price, String title, String imgUrl) {

    if (_cartItems.containsKey(product.codeProd)) {
         // quantity;
         // totalPrice;
         // totalPriceTransport;

    } else {

      _cartItems.putIfAbsent(
          product.codeProd,
              () => CartItem(
                  id: product.id,
                  name: product.name,
                  description: product.description,
                  codeProd: product.codeProd,
                  codeEan: product.codeEan,
                  codeQr: product.codeQr,
                  price:product.price.toDouble(),
                  quantityStock: product.quantityStock,
                  quantity: product.quantity,
                  imageURL: product.imageURL.toString()
                  // id: DateTime.now().toString(),
              )
      );

    ///  cartItems.addAll(_cartItems);
            //quantityProdList.add(cartItemCount[index]);
            // flagItemEnabled =false;
    }


    //  cartItemCount[index]++;
    notifyListerner();
  }


  /// UPDATE ITEM CART
  void incrementItemCart(Product product,int index) {
    notifyListerner();
    if (_cartItems.containsKey(product.codeProd)) {
      _cartItems.update(
          product.codeProd,
              (existingCartItem) => CartItem(
              id: existingCartItem.id,
              name: existingCartItem.name,
              description: existingCartItem.description,
              codeProd: existingCartItem.codeProd,
              codeEan: existingCartItem.codeEan,
              codeQr: existingCartItem.codeQr,
              price:existingCartItem.price.toDouble(),
              quantityStock: existingCartItem.quantityStock,
              quantity: existingCartItem.quantity +1,
              imageURL: existingCartItem.imageURL.toString()
          ));
    }
  }


  /// REMOVED ITEM FROM CART
// Remove prodotti  nel carello
  void removeItem(String codeProd, int index, List<int> cartItemCount ) {
    if (_cartItems.containsKey(codeProd)) {
     // _cartItems.remove(codeProd);
       cartItemCount[index]--;
    }
    notifyListerner();
  }



 // void cartItemIncrement(Product product,int index, List<int> cartItemCount, Map<String, CartItem> cartItems, List<int> quantityProdCart) {
  void cartItemIncrement(Product product,int index) {
    notifyListerner();
    if (_cartItems.containsKey(product.codeProd)) {
      _cartItems.update(
          product.codeProd,
              (existingCartItem) => CartItem(
                  id: existingCartItem.id,
                  name: existingCartItem.name,
                  description: existingCartItem.description,
                  codeProd: existingCartItem.codeProd,
                  codeEan: existingCartItem.codeEan,
                  codeQr: existingCartItem.codeQr,
                  price:existingCartItem.price.toDouble(),
                  quantityStock: existingCartItem.quantityStock,
                  quantity: existingCartItem.quantity +1,
                  imageURL: existingCartItem.imageURL.toString()
              ));

         // cartItemCount[index]++ ;
         // quantityXArticlesAdd[index]++ ;

   //   getItemsFromLocalstorage(product.codeProd, _cartItems);
     // cart.getItemsFromLocalstorages('1003');
         //List listQty= _cartItems.values.toList();

         //getQuantity(product.codeProd, listQty);

         //int quantyProd= getQuantityXArticles(product.codeProd, listQty);
          // quantityAddCart(quantyProd);
    }
  }


  /// getItem into the cart
 Iterable<CartItem> getItemsCart(){
    return _cartItems.values.toList();
 }

 List<CartItem> getItemsCarts(){
    return _cartItems.values.toList();
  }

  int getQuantityXArticles(int index, String codeProd, List listQty){
    // if (_cartItems.containsKey(codeProd) && _cartItems.values.toList().contains(index)) {
    var mapnews =_cartItems.values.toList();

    if (_cartItems.containsKey(codeProd)){
      _cartItems.forEach((key, value) {
        int quantity = value.quantity;
      });
    }
    return quantity;
  }
  // List<int> items = <int>[0, 1, 2];
  List<int> getQuantityXArticlesAdd(int index, String codeProd, List listQty)  {
    // if (_cartItems.containsKey(codeProd) && _cartItems.values.toList().contains(index)) {
    var mapnews =_cartItems.values.toList();

    List<int> quantitys = <int>[];


    _cartItems.forEach((key, cartItem) {
      //if (_cartItems.containsKey(codeProd)){
      _cartItems.forEach((key, value) {
        int quantity = value.quantity;
        quantitys.add(quantity);
      });
      // }
    });
    return quantitys;
  }
  List<CartItem> getQuantityXArticles2(String codeProd, List listQty){
    if (_cartItems.containsKey(codeProd)) {
      _cartItems.forEach((key, value) {
        int quantity = value.quantity;
      });
    }
    return _cartItems.values.toList();
  }

// update aggiono i prodotti eliminatQQQi
  void cartItemDecrement(String codeProd, int index,List<int> quantityXArticlesAdd, List<int> cartItemCount) {
    if (_cartItems.containsKey(codeProd)) {
      _cartItems.update(
          codeProd,
              (existingCartItem) => CartItem(
              id: existingCartItem.id,
              name: existingCartItem.name,
              description: existingCartItem.description,
              codeProd: existingCartItem.codeProd,
              codeEan: existingCartItem.codeEan,
              codeQr: existingCartItem.codeQr,
              price:existingCartItem.price.toDouble(),
              quantityStock: existingCartItem.quantityStock,
              quantity: existingCartItem.quantity -1,
              imageURL: existingCartItem.imageURL.toString()
          )
      );
    }




    // cartItemCount[index]--;
    quantityXArticlesAdd[index]-- ;
    notifyListerner();
  }



// quantity total list prod car
  int get quantity {
    return cartItems.length;
  }

  int quantityAddCart(quantyProd) {
    return quantyProd;
  }

  /*int get quantity {
    return _cartItems.length;
  }
  */


  List<int>? get quantityProdCart {

    //var quantityProdList = 0;
    _cartItems.forEach((key, cartItem) {
      quantityProdList= (cartItem.quantity+1) as List<int>;
    });

    return quantityProdList;
  }

// calcolo prezzo total parziale del carello
  double get subTotalPrice {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

// calcolo prezzo total  del carello
  double get totalPrice {
    var total = 10.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  double get totalPriceTransport {
    var transport= 1.5;
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      if(cartItem.quantity>0){
        total += (cartItem.price * cartItem.quantity)+transport;
      }else{
        total += (cartItem.price * cartItem.quantity);
      }

    });
    return total;
  }

// rimuove
  void removeCartItem(String prodoctId) {
    _cartItems.removeWhere((key, value) => value.id == prodoctId);
    notifyListerner();
  }

  /// Clear cart
  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }

  void notifyListerner() {}

  /// ==============================  END ADD DATA PRODUCT FROM CART MAP CART   =============================================

/// ==============================  INIT SAVE DATA TO LOCAL STORAGE    =============================================
  /// SAVE DATA FROM locoalstorage:
 // void cartItemsToLocalStorage(String codeProduct, Map<String, CartItem> _cartItems){
  void cartAddItemsToLocalStorage(codeProduct, cartItems){
           //for to cicle cartItems
    storage.setItem('codeProduct', codeProduct);
    storage.setItem('cartItems', cartItems);

    final info = json.encode({'codeProduct': 'codeProduct', 'cartItems': 'cartItems'});
    storage.setItem('info', info);

  }

  /// GET DATA FROM LOCAL STORAGE
  void getItemsFromLocalstorage(String codeProduct, cartItems){

    final codeProd= storage.getItem(codeProduct);
    final mapCartItems=  storage.getItem(cartItems);

    //if(! json.decode(storage.getItem('info') ).isNull){
      Map<String,dynamic> info =json.decode(storage.getItem('info'));

      final infoCodeprod = info['codeProde'];
      final infoCartitems = info['_cartItems'];

  }

  /// GET DATA FROM LOCAL STORAGE
  void getItemsFromLocalstorages(String codeProduct){

    final codeProd= storage.getItem('codeProduct');
    final mapCartItems=  storage.getItem('cartItems');

  //  if(! json.decode(storage.getItem('info') ).isNull){
      Map<String,dynamic> info =json.decode(storage.getItem('info'));

      final infoCodeprod = info['codeProduct'];
      final infoCartitems = info[mapCartItems];
   // }


  }

  //Elimina un elemento da localstorage:
  void removedItemFroLocalStorage(String codeProduct, Map<String, CartItem> cartItems){
    storage.deleteItem('codeProduct');
    storage.deleteItem('cartItems');
    storage.deleteItem('info');
  }

  /// ==============================  END SAVE DATA TO LOCAL STORAGE    =============================================

  /// ==============================  INIT SAVE DATA FROM  DB    SQFLITE     =============================================
///
         getConfigurationSqlLite(){
          //  const databaseFactoryMock = mainSqlLite;
         }


  /// ==============================  END SAVE DATA FROM  DB          =============================================


}
