import 'package:ecobioweb/products/screen/products_screen.dart';
import 'package:ecobioweb/roots/trunk/branches/repositories/cart_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../../products/components/product.dart';
import '../components/cart_item.dart';

/// ==============================  INIT ADD DATA PRODUCT FROM CART MAP CART   =============================================

class CartProvider with ChangeNotifier , DiagnosticableTreeMixin {

  CartItem? itemCart ;

  List<CartItem> carts=[];

  static final List<Product> products=[];

  List<Product> getProducts () {
    return products;
}
  List<Product> setProducts ( List<Product> productsList) {
  //  products!=productsList;
    products.clear();
    products.addAll(productsList);

    return products;
  }

  static List<CartItem> get cartsList => _cartsList!;

  static set cartsList(List<CartItem> value) {
    _cartsList = value;
  }

  static Map<String, Product> _productItems = {};

   static Map<String, Product> get productItems {
    return {..._productItems};
  }

  List<Product> get favoriteItemsProduct {
    return products.where((element) => element.isFavorite!).toList();
  }

  Product findByIdProducts(String codeProd) {
    return products.firstWhere((element) => element.codeProd.toString() == codeProd);
  }

  Product findById(String codeProd) {
    Product? product;
     cartItems.forEach((key, value) {
       if(key ==codeProd ){
         product=newCartItems(value);
       }
    });
       return product!;
  }
  /// Map<String, CartItem> cartItemsMap ={};

  static Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  /// Gestion Repository Cart save
  static final CartRepository _cartRepository = GetIt.instance<CartRepository>();

  @observable
  static  List<CartItem>? _cartsList;

  @observable
  static ObservableList<CartItem> _cart= ObservableList();



  Future<Map<String, CartItem>> getDataCart() async{
    var cartItemsMap=getCarItemMap();
    notifyListeners();
    return cartItemsMap;
  }

  Map<String, CartItem> getCarItemMap() {
    // Map<String, CartItem> cartItemsMap ={};
    notifyListeners();
    return cartItems;
  }
  ///  get itemCart => cartItem;
  /// final LocalStorage storage = LocalStorage('localeStporage_app');

  int get quantityCart {
    notifyListeners();
    return _cartItems.length;
  }

  // double getPrice() {
  //   ///return widget.item.price * amount;
  //   return widget.itemCart.price * widget.itemCart.quantity;
  // }


  double get subTotalPrice {
    var total = 0.0;
    _cartItems.forEach((key, cartItems) {
      total = cartItems.price * cartItems.quantity;
    });
    notifyListeners();
    return total;
  }

 static double  getPrice(CartItem cart) {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      if(value.codeProd == cart.codeProd) {
        total = cart.price * value.quantity;
       // cart.quantity=value.quantity;
      }
    });

    return total;
  }


  //    double get subTotalPrice {
  //   var total = 0.0;
  //   _cartItems.forEach((key, cartItems) {
  //     total += cartItems.price * cartItems.quantity;
  //   });
  //   return total;
  // }

  ///Prix total des articles
  double get totalPrice {
    var total = 0.0;
    _cartItems.forEach((key, cartItems) {
      total += cartItems.price * cartItems.quantity;
    });
    notifyListeners();
    return total;
  }


   double  totalPriceTotal() {
    var total = 0.0;
    _cartItems.forEach((key, cartItems) {
      total += cartItems.price * cartItems.quantity;
    });
    //notifyListeners();
    return total;
  }

  ///prix transport
  double get getTotalTransport {
    var total = 0.0;
    _cartItems.forEach((key, cartItems) {
      total = cartItems.price * cartItems.quantity;
    });
    return total;
  }


  static int getAmount(Product product, int quantity){
  //  var amount=quantity;
    var amount=0;

    _cartItems.forEach((key, cartItem) {
      if(cartItem.codeProd ==product.codeProd){
        amount=cartItem.quantity;
      }

    });
    return amount;
  }


  static int getAmountCartItem(CartItem cartItem, int quantity){
    var amount=quantity;

    _cartItems.forEach((key, value) {
      if(cartItem.codeProd ==cartItem.codeProd){
        amount=value.quantity;
        cartItem.quantity=value.quantity;
      }
    });
    return amount;
  }


  void removeCartItem2(String productId) {
    _cartItems.removeWhere((key, value) => value.id.toString() == productId);
    notifyListeners();
  }
//   void addItemCart(String cartItemId, double price, String title, String imgUrl) {

  static  void addItemCart(CartItem cartItem) {
    if (_cartItems.containsKey(cartItem.codeProd)) {
      updateItemCart(cartItem);
    } else {
      _cartItems.putIfAbsent(
        cartItem.codeProd,
            () => CartItem(
            id: cartItem.id,
            codeProd: cartItem.codeProd,
            name: cartItem.name,
            description: cartItem.description,
            price: cartItem.price,
            quantityStock: cartItem.quantityStock,
            quantity: cartItem.quantity + 1 ,
            category: cartItem.category,
            brand: cartItem.brand,
            brandModel: cartItem.brandModel,
            codeEan: cartItem.codeEan,
            codeQr: cartItem.codeQr,
            country: cartItem.country,
            city: cartItem.city,
            currency: cartItem.currency,
            kilometer: cartItem.kilometer,
            imageURL: cartItem.imageURL,
            image: cartItem.image,
            datePublication: DateTime.now().toString(),
            dateUpdateCart: cartItem.dateUpdateCart,
            isFavorite: cartItem.isFavorite == null? false :cartItem.isFavorite ?? false,
            isEnabled: cartItem.isEnabled == null? false: cartItem.isEnabled?? false
        ),

      );
    _cart.add(cartItem);


     // _productItems.putIfAbsent(key, () => null)
      // if(!products.contains(cartItem.codeProd)){
      //   products.add(newCartItems(cartItem));
      // }else if(products.contains(cartItem)){
      //   products.removeWhere((element) => element.codeProd== cartItem.codeProd);
      //   products.add(newCartItems(cartItem));
      // }


   /// _cartsList!.add(cartItem);

    }
    // notifyListeners();
    /// GestionAgricultureBio..cartItem=cartItems;
    //  CartScreen cs= CartScreen();
    //   cs.cartItems=cartItems;
    // CartProvider().carts.add(cartItem);
    /// update list cart
    //  carts.add(cartItem);

  }

  @action
  static saveToSharedPrefRepository(CartItem cartItem){
    //  final indexCart=_cart.indexWhere((it) =>it.id==id);

    if(!_cart.contains(cartItem)){
      _cart.add(cartItem);

    }
    if(_cart.isNotEmpty){
    final indexCart =_cart.indexWhere((it) => it.id.toString() == cartItem.id.toString());

    final indexAll = _cartsList!.indexWhere((it) => it.id.toString() == cartItem.id.toString());

    if(indexCart <0 && indexAll>=0){
      _cart= ObservableList.of(
          [..._cart, _cartsList![indexAll]]
      );
    }
    _cart.sort((a,b)=>a.id.compareTo(b.id));

    _cartRepository.saveCartToRepository(_cart.map((element) => element.id.toString()).toList());
  }

  }


  @action
 static void removeSharedPrefRepository(String id) {
    final index =
    _cart.indexWhere((it) =>  it.id.toString() == id.toString());

    if (index >= 0) {
      _cart.removeAt(index);
      _cart =
          ObservableList.of([..._cart]);
    }

    _cartRepository.saveCartToRepository(
        _cart.map((it) => it.id.toString()).toList());
  }


  bool isFavorite(String id){
    final index = _cart.indexWhere((element) => element.id.toString() == id.toString());

    return index>=0;

  }


  static void removeCartItem(CartItem  cartItem) {
    _cartItems.removeWhere((key, value) => value.codeProd.toString() == cartItem.codeProd);
    //notifyListeners();
  }

  /// UPDATE ITEM CART
  static  void updateItemCart(CartItem cartItem) {
    if (_cartItems.containsKey(cartItem.codeProd)) {
      _cartItems.update(
          cartItem.codeProd,
              (existingCartItem) => CartItem(
              id: existingCartItem.id,
              codeProd: existingCartItem.codeProd,
              name: existingCartItem.name,
              description: existingCartItem.description,
              price: existingCartItem.price,
              quantityStock: existingCartItem.quantityStock,
              quantity: existingCartItem.quantity + 1,
              category: existingCartItem.category,
              brand: existingCartItem.brand,
              brandModel: existingCartItem.brandModel,
              codeEan: existingCartItem.codeEan,
              codeQr: existingCartItem.codeQr,
              country: existingCartItem.country,
              city: existingCartItem.city,
              currency: existingCartItem.currency,
              kilometer: existingCartItem.kilometer,
              imageURL: existingCartItem.imageURL.toString(),
              image: existingCartItem.image.toString(),
              datePublication: DateTime.now().toString(),
              dateUpdateCart: existingCartItem.dateUpdateCart,
              isFavorite: existingCartItem.isFavorite,
              isEnabled: existingCartItem.isEnabled
          ));
    }
    _cart.add(cartItem);

    // String codeProd=cartItem.codeProd;
    // if(products.isNotEmpty && !products.contains(newCartItems(cartItem))){
    //          products.add(newCartItems(cartItem));
    // }else if(products.contains(cartItem)){
    //   products.removeWhere((element) => element.codeProd== cartItem.codeProd);
    //   products.add(newCartItems(cartItem));
    // }


   // products.add(newCartItems(cartItem));
   //nor because Exception null ---> _cartsList!.add(cartItem);
    ///notifyListeners();
  }

  static void decrementItemCart(CartItem cartItem) {

    if (_cartItems.containsKey(cartItem.codeProd)) {
      _cartItems.update(
          cartItem.codeProd,
              (existingCartItem) => CartItem(
              id: existingCartItem.id,
              codeProd: existingCartItem.codeProd,
              name: existingCartItem.name,
              description: existingCartItem.description,
              price: existingCartItem.price,
              quantityStock: existingCartItem.quantityStock,
              quantity: existingCartItem.quantity - 1,
              category: existingCartItem.category,
              brand: existingCartItem.brand,
              brandModel: existingCartItem.brandModel,
              codeEan: existingCartItem.codeEan,
              codeQr: existingCartItem.codeQr,
              country: existingCartItem.country,
              city: existingCartItem.city,
              currency: existingCartItem.currency,
              kilometer: existingCartItem.kilometer,
              imageURL: existingCartItem.imageURL.toString(),
              image: existingCartItem.image.toString(),
              datePublication: DateTime.now().toString(),
              dateUpdateCart: existingCartItem.dateUpdateCart,
              isFavorite: existingCartItem.isFavorite,
              isEnabled: existingCartItem.isEnabled));
    }
    _cart.add(cartItem);


    // if(!productItems.containsKey(product.codeProd)){
    //   CartProvider.productItems.putIfAbsent(product.codeProd, () => product) ;
    // }else {
    //   //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
    //   CartProvider.productItems.update(product.codeProd, (value) => product);
    // }
    //

    // if(products.contains(cartItem)){
    //   products.removeWhere((element) => element.codeProd== cartItem.codeProd);
    //   products.add(newCartItems(cartItem));
    // }
// prendo index controllo se exista nella lista aggioro la quantità
//     for (var element in products) {
//       int index=products.indexWhere((element) => element.codeProd== cartItem.codeProd);
//       if(index>=1){
//         products[index].quantity=cartItem.quantity;
//         products.add(products[index]);
//
//        // products.add(newCartItems(cartItem));
//       }
//     }


   // _cartsList!.add(cartItem);
    /// notifyListerner();
  }


  static  void addFavoriteItemCart(CartItem cartItem) {
    if (_cartItems.containsKey(cartItem.codeProd)) {
      incrementFavoritItemCart(cartItem);
    }
    // else {
    //   _cartItems.putIfAbsent(
    //     cartItem.codeProd,
    //         () => CartItem(
    //         id: cartItem.id,
    //         codeProd: cartItem.codeProd,
    //         name: cartItem.name,
    //         description: cartItem.description,
    //         price: cartItem.price,
    //         quantityStock: cartItem.quantityStock,
    //         quantity: cartItem.quantity ,
    //         category: cartItem.category,
    //         brand: cartItem.brand,
    //         brandModel: cartItem.brandModel,
    //         codeEan: cartItem.codeEan,
    //         codeQr: cartItem.codeQr,
    //         country: cartItem.country,
    //         city: cartItem.city,
    //         currency: cartItem.currency,
    //         kilometer: cartItem.kilometer,
    //         imageURL: cartItem.imageURL,
    //         image: cartItem.image,
    //         datePublication: DateTime.now().toString(),
    //         dateUpdateCart: cartItem.dateUpdateCart,
    //         isFavorite: cartItem.isFavorite == null? false :cartItem.isFavorite ?? false,
    //         isEnabled: cartItem.isEnabled == null? false: cartItem.isEnabled?? false
    //     ),
    //
    //   );
    //
    // }

    /// GestionAgricultureBio..cartItem=cartItems;
    //  CartScreen cs= CartScreen();
    //   cs.cartItems=cartItems;
    // CartProvider().carts.add(cartItem);
    /// update list cart
    //  carts.add(cartItem);
    /// notifyListerner();
  }

  /// UPDATE ITEM CART
  static  void incrementFavoritItemCart(CartItem cartItem) {
    if (_cartItems.containsKey(cartItem.codeProd)) {
      _cartItems.update(
          cartItem.codeProd,
              (existingCartItem) => CartItem(
              id: existingCartItem.id,
              codeProd: existingCartItem.codeProd,
              name: existingCartItem.name,
              description: existingCartItem.description,
              price: existingCartItem.price,
              quantityStock: existingCartItem.quantityStock,
              quantity: existingCartItem.quantity,
              category: existingCartItem.category,
              brand: existingCartItem.brand,
              brandModel: existingCartItem.brandModel,
              codeEan: existingCartItem.codeEan,
              codeQr: existingCartItem.codeQr,
              country: existingCartItem.country,
              city: existingCartItem.city,
              currency: existingCartItem.currency,
              kilometer: existingCartItem.kilometer,
              imageURL: existingCartItem.imageURL.toString(),
              image: existingCartItem.image.toString(),
              datePublication: DateTime.now().toString(),
              dateUpdateCart: existingCartItem.dateUpdateCart,
              isFavorite: existingCartItem.isFavorite,
              isEnabled: existingCartItem.isEnabled
          ));
    }
    ///notifyListeners();
  }
  void cleanCart() {
    _cartItems = {};
    notifyListeners();
  }

  newCartItemsProduct(Product product) {
    CartItem cartItem = CartItem(
        id: product.id,
        codeProd: product.codeProd,
        name: product.name,
        description: product.description,
        price: product.price,
        quantityStock: product.quantityStock,
        quantity: product.quantity,
        imageURL: product.imageURL,
        image: product.image,
        images: product.images,);

    return cartItem;
  }


  static newCartItems(CartItem cartItem) {

    Product product = Product(
        id: cartItem.id,
        codeProd: cartItem.codeProd,
        name: cartItem.name,
        description: cartItem.description,
        price: cartItem.price,
        quantityStock: cartItem.quantityStock,
        quantity: cartItem.quantity,
        category: cartItem.category.toString(),
        imageURL: cartItem.imageURL.toString(),
        image: cartItem.image.toString(),
        images: cartItem.images,
           );


    return product;
  }




  /// ==============================  END ADD DATA PRODUCT FROM CART MAP CART   =============================================

  /// ==============================  INIT SAVE DATA TO LOCAL STORAGE    =============================================
  /// SAVE DATA FROM locoalstorage:
  // void cartItemsToLocalStorage(String codeProduct, Map<String, CartItem> _cartItems){
  // void cartAddItemsToLocalStorage(codeProduct, cartItems){
  //   //for to cicle cartItems
  //   storage.setItem('codeProduct', codeProduct);
  //   storage.setItem('cartItems', cartItems);
  //
  //   final info = json.encode({'codeProduct': 'codeProduct', 'cartItems': 'cartItems'});
  //   storage.setItem('info', info);
  //
  // }

  /// GET DATA FROM LOCAL STORAGE
  // void getItemsFromLocalstorage(String codeProduct, cartItems){
  //
  //   final codeProd= storage.getItem(codeProduct);
  //   final mapCartItems=  storage.getItem(cartItems);
  //
  //   //if(! json.decode(storage.getItem('info') ).isNull){
  //   Map<String,dynamic> info =json.decode(storage.getItem('info'));
  //
  //   final infoCodeprod = info['codeProde'];
  //   final infoCartitems = info['_cartItems'];
  //
  // }

  /// GET DATA FROM LOCAL STORAGE
  // void getItemsFromLocalstorages(String codeProduct){
  //
  //   final codeProd= storage.getItem('codeProduct');
  //   final mapCartItems=  storage.getItem('cartItems');
  //
  //   //  if(! json.decode(storage.getItem('info') ).isNull){
  //   Map<String,dynamic> info =json.decode(storage.getItem('info'));
  //
  //   final infoCodeprod = info['codeProduct'];
  //   final infoCartitems = info[mapCartItems];
  //   // }
  // }

  //Elimina un elemento da localstorage:
  // void removedItemFroLocalStorage(String codeProduct, Map<String, CartItem> cartItems){
  //   storage.deleteItem('codeProduct');
  //   storage.deleteItem('cartItems');
  //   storage.deleteItem('info');
  // }

  /// ==============================  END SAVE DATA TO LOCAL STORAGE    =============================================

  /// ==============================  INIT SAVE DATA FROM  DB    SQFLITE     =============================================
  ///
  getConfigurationSqlLite(){
    //  const databaseFactoryMock = mainSqlLite;
  }




/// ==============================  END SAVE DATA FROM  DB          =============================================


}
