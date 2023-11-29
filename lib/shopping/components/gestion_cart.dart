// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:localstorage/localstorage.dart';
//
// import '../../roots/trunk/branches/cart/components/product.dart';
//
//
// /// ==============================  INIT ADD DATA PRODUCT FROM CART MAP CART   =============================================
//
// class GestionCart with ChangeNotifier {
//
//      CartItem? itemCart ;
//
//    List<CartItem> carts=[];
//   /// Map<String, CartItem> cartItemsMap ={};
//
//  static Map<String, CartItem> _cartItems = {};
//
//    Map<String, CartItem> get cartItems {
//     return {..._cartItems};
//   }
//
//
//
//
//
//
//   Future<Map<String, CartItem>> getDataCart() async{
//      var cartItemsMap=getCarItemMap();
//      notifyListeners();
//      return cartItemsMap;
//   }
//
//      Map<String, CartItem> getCarItemMap() {
//        // Map<String, CartItem> cartItemsMap ={};
//
//        return cartItems;
//      }
//  ///  get itemCart => cartItem;
//  /// final LocalStorage storage = LocalStorage('localeStporage_app');
//
//   int get quantityCart {
//     return _cartItems.length;
//   }
//
//      // double getPrice() {
//      //   ///return widget.item.price * amount;
//      //   return widget.itemCart.price * widget.itemCart.quantity;
//      // }
//
//
//      double get subTotalPrice {
//        var total = 0.0;
//        _cartItems.forEach((key, cartItems) {
//          total = cartItems.price * cartItems.quantity;
//        });
//        return total;
//      }
//
//   //    double get subTotalPrice {
//   //   var total = 0.0;
//   //   _cartItems.forEach((key, cartItems) {
//   //     total += cartItems.price * cartItems.quantity;
//   //   });
//   //   return total;
//   // }
//
//      ///Prix total des articles
//   double get totalPrice {
//     var total = 0.0;
//     _cartItems.forEach((key, cartItems) {
//       total += cartItems.price * cartItems.quantity;
//     });
//     return total;
//   }
//
//   ///prix transport
//      double get getTotalTransport {
//        var total = 0.0;
//        _cartItems.forEach((key, cartItems) {
//          total = cartItems.price * cartItems.quantity;
//        });
//        return total;
//      }
//
//
// static int getAmount(int id, int quantity){
//      var amount=quantity;
//
//      _cartItems.forEach((key, cartItem) {
//        if(cartItem.id ==id){
//            amount=cartItem.quantity;
//        }
//
//      });
//      return amount;
// }
//
//
//      void removeCartItem2(String productId) {
//        _cartItems.removeWhere((key, value) => value.id.toString() == productId);
//        //notifyListeners();
//      }
// //   void addItemCart(String cartItemId, double price, String title, String imgUrl) {
//
//  static  void addItemCart(CartItem cartItem) {
//     if (_cartItems.containsKey(cartItem.codeProd)) {
//       incrementItemCart(cartItem);
//     } else {
//       _cartItems.putIfAbsent(
//           cartItem.codeProd,
//           () => CartItem(
//               id: cartItem.id,
//               codeProd: cartItem.codeProd,
//               name: cartItem.name,
//               description: cartItem.description,
//               price: cartItem.price,
//               quantityStock: cartItem.quantityStock,
//               quantity: cartItem.quantity ,
//               category: cartItem.category,
//               brand: cartItem.brand,
//               brandModel: cartItem.brandModel,
//               codeEan: cartItem.codeEan,
//               codeQr: cartItem.codeQr,
//               country: cartItem.country,
//               city: cartItem.city,
//               currency: cartItem.currency,
//               kilometer: cartItem.kilometer,
//               imageURL: cartItem.imageURL,
//               image: cartItem.image,
//               datePublication: DateTime.now().toString(),
//               dateUpdateCart: cartItem.dateUpdateCart,
//               isFavorite: cartItem.isFavorite == null? false :cartItem.isFavorite ?? false,
//               isEnabled: cartItem.isEnabled == null? false: cartItem.isEnabled?? false
//          ),
//
//       );
//
//     }
//
//    /// GestionAgricultureBio..cartItem=cartItems;
//    //  CartScreen cs= CartScreen();
//    //   cs.cartItems=cartItems;
//     // GestionCart().carts.add(cartItem);
//     /// update list cart
//      //  carts.add(cartItem);
//    /// notifyListerner();
//   }
//
//    static void removeCartItem(String productId) {
//     _cartItems.removeWhere((key, value) => value.id.toString() == productId);
//     //notifyListeners();
//   }
//
//   /// UPDATE ITEM CART
//  static  void incrementItemCart(CartItem cartItem) {
//     if (_cartItems.containsKey(cartItem.codeProd)) {
//       _cartItems.update(
//           cartItem.codeProd,
//           (existingCartItem) => CartItem(
//               id: existingCartItem.id,
//               codeProd: existingCartItem.codeProd,
//               name: existingCartItem.name,
//               description: existingCartItem.description,
//               price: existingCartItem.price,
//               quantityStock: existingCartItem.quantityStock,
//               quantity: existingCartItem.quantity + 1,
//               category: existingCartItem.category,
//               brand: existingCartItem.brand,
//               brandModel: existingCartItem.brandModel,
//               codeEan: existingCartItem.codeEan,
//               codeQr: existingCartItem.codeQr,
//               country: existingCartItem.country,
//               city: existingCartItem.city,
//               currency: existingCartItem.currency,
//               kilometer: existingCartItem.kilometer,
//               imageURL: existingCartItem.imageURL.toString(),
//               image: existingCartItem.image.toString(),
//               datePublication: DateTime.now().toString(),
//               dateUpdateCart: existingCartItem.dateUpdateCart,
//               isFavorite: existingCartItem.isFavorite,
//               isEnabled: existingCartItem.isEnabled
//           ));
//     }
//     ///notifyListeners();
//   }
//
//    static void decrementItemCart(CartItem cartItem) {
//
//     if (_cartItems.containsKey(cartItem.codeProd)) {
//       _cartItems.update(
//           cartItem.codeProd,
//           (existingCartItem) => CartItem(
//               id: existingCartItem.id,
//               codeProd: existingCartItem.codeProd,
//               name: existingCartItem.name,
//               description: existingCartItem.description,
//               price: existingCartItem.price,
//               quantityStock: existingCartItem.quantityStock,
//               quantity: existingCartItem.quantity - 1,
//               category: existingCartItem.category,
//               brand: existingCartItem.brand,
//               brandModel: existingCartItem.brandModel,
//               codeEan: existingCartItem.codeEan,
//               codeQr: existingCartItem.codeQr,
//               country: existingCartItem.country,
//               city: existingCartItem.city,
//               currency: existingCartItem.currency,
//               kilometer: existingCartItem.kilometer,
//               imageURL: existingCartItem.imageURL.toString(),
//               image: existingCartItem.image.toString(),
//               datePublication: DateTime.now().toString(),
//               dateUpdateCart: existingCartItem.dateUpdateCart,
//               isFavorite: existingCartItem.isFavorite,
//               isEnabled: existingCartItem.isEnabled));
//     }
//    /// notifyListerner();
//   }
//
//   void cleanCart() {
//     _cartItems = {};
//   }
//

//
//   /// ==============================  END ADD DATA PRODUCT FROM CART MAP CART   =============================================
//
//   /// ==============================  INIT SAVE DATA TO LOCAL STORAGE    =============================================
//   /// SAVE DATA FROM locoalstorage:
//   // void cartItemsToLocalStorage(String codeProduct, Map<String, CartItem> _cartItems){
//   // void cartAddItemsToLocalStorage(codeProduct, cartItems){
//   //   //for to cicle cartItems
//   //   storage.setItem('codeProduct', codeProduct);
//   //   storage.setItem('cartItems', cartItems);
//   //
//   //   final info = json.encode({'codeProduct': 'codeProduct', 'cartItems': 'cartItems'});
//   //   storage.setItem('info', info);
//   //
//   // }
//
//   /// GET DATA FROM LOCAL STORAGE
//   // void getItemsFromLocalstorage(String codeProduct, cartItems){
//   //
//   //   final codeProd= storage.getItem(codeProduct);
//   //   final mapCartItems=  storage.getItem(cartItems);
//   //
//   //   //if(! json.decode(storage.getItem('info') ).isNull){
//   //   Map<String,dynamic> info =json.decode(storage.getItem('info'));
//   //
//   //   final infoCodeprod = info['codeProde'];
//   //   final infoCartitems = info['_cartItems'];
//   //
//   // }
//
//   /// GET DATA FROM LOCAL STORAGE
//   // void getItemsFromLocalstorages(String codeProduct){
//   //
//   //   final codeProd= storage.getItem('codeProduct');
//   //   final mapCartItems=  storage.getItem('cartItems');
//   //
//   //   //  if(! json.decode(storage.getItem('info') ).isNull){
//   //   Map<String,dynamic> info =json.decode(storage.getItem('info'));
//   //
//   //   final infoCodeprod = info['codeProduct'];
//   //   final infoCartitems = info[mapCartItems];
//   //   // }
//   // }
//
//   //Elimina un elemento da localstorage:
//   // void removedItemFroLocalStorage(String codeProduct, Map<String, CartItem> cartItems){
//   //   storage.deleteItem('codeProduct');
//   //   storage.deleteItem('cartItems');
//   //   storage.deleteItem('info');
//   // }
//
//   /// ==============================  END SAVE DATA TO LOCAL STORAGE    =============================================
//
//   /// ==============================  INIT SAVE DATA FROM  DB    SQFLITE     =============================================
//   ///
//   getConfigurationSqlLite(){
//     //  const databaseFactoryMock = mainSqlLite;
//   }
//
//
//
//
// /// ==============================  END SAVE DATA FROM  DB          =============================================
//
//
// }
