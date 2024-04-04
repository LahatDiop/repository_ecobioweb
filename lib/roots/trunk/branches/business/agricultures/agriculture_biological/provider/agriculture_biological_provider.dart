

import 'dart:convert';
import 'package:ecobioweb/roots/trunk/branches/business/agricultures/agriculture_biological/screens/agriculture_biologique_screenOK.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../loader/data_loader.dart';
import '../../../../cart/components/cart_item.dart';
import '../../../../cart/provider/cart_provider.dart';
import '../../../../localisation/translation/components/appLocalizations.dart';
import '../../../../products/components/product.dart';
///import 'E:\Lahat\Projet App\AppBio\workspace_ecobio\ecobioweb\lib\roots\trunk\branches\cart\components\products';


class AgricultureBiologicalProvider  with ChangeNotifier {
  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  ///-----------------------------------------------------------------------------
  /// MAP PRODUCT
  Map<String, Product> _productItem = {};

  Map<String, Product> get productItems {
    return {..._productItem};
  }

  /// LIST PRODUCT
  List<Product> products = [];

  //int index=0;

  late TabController _tabController;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<Product>> getData(int tabIndex) async {
    products=  await getProductsList(tabIndex);
    // add list products into the cartProvider
    CartProvider().setProducts(products);

    notifyListeners();
    return products;


  }

  Map<String, Product> getDataMap() {
    var  productMap=  getproductItems();
    notifyListeners();
    return productMap;
  }

  getproductItems() {
    notifyListeners();
    return productItems;
  }


  Future<List<Product>> getProductsList(int tabIndex) async {

    final String response = await rootBundle.loadString('assets/json/products.json');
    final data = await json.decode(response);

    dataLoader = data['products'].map((data) => Product.fromJson(data)).toList();

    // final extratedData= jsonDecode(data) as Map<String,dynamic>;
    ///  Map<String, Product> extratedData = Product.fromJsonMap(json);


    List<Product> loadedProducts = [];
    ///final List<Map<String,Object?>> queryResult= data['products'].map((data) => Product.fromJson(data)).toList();

    /// AgricultureBiologicalProvider().createState().setProductItemsList(productItemsList);

    /// _productItems?.putIfAbsent("product", () => productItemsList.toList());
    //products.clear();

    for (var product in dataLoader) {
      addItemProduct(product);

      loadedProducts.add(product);
    }

    /// non perche sara caricato dentro recalculateTabElement
    ///   products.add(product);
    /// Arrivo dalla home Tab default = 0 Fruits and Vegetable
    /// int index = products.where((element) => element.id)
    recalculateTabElement(tabIndex);

    // notifyListerner();
    return loadedProducts;
    // return queryResult.map((result) => Product.fromJsonMap(result)).toList();

  }



  Product? product;
  CartItem? itemCart;

  // final CartItem cartItem=CartProvider().cartItem;
  //     late CartItem itemCart;

  late String category;
  late String categoryToLoad = "agricultureBiological";

  bool isFlagLoaderEnabled = true;


  List<dynamic> dataLoader = [];


  // List<Product> get productItemsList{
  //   return products.where((element) => element.id.toList());
  // }

  List<Product> get favoriteItemsProduct {
    return products.where((element) => element.isFavorite!).toList();
  }

  Product findById(String id) {
    return products.firstWhere((element) => element.id.toString() == id);
  }
  Product findByCodeProduct(String codeProd) {
    return products.firstWhere((element) => element.codeProd.toString() == codeProd);
  }

  Product findByCodeProductList(String codeProd,List<Product> products) {
    return products.firstWhere((element) => element.codeProd.toString() == codeProd);
  }
  void addItemProduct(Product product) {
    if (_productItem.containsKey(product.codeProd)) {

    } else {
      _productItem.putIfAbsent(product.codeProd, () =>
          Product(
            id: product.id,
            codeProd: product.codeProd,
            type: product.type,
            name: product.name,
            description: product.description,
            price: product.price,
            quantityStock: product.quantityStock,
            quantity: product.quantity,
            category: product.category,
            brand: product.brand,
            brandModel: product.brandModel,
            codeEan: product.codeEan,
            codeQr: product.codeQr,
            country: product.country,
            city: product.city,
            currency: product.currency,
            kilometer: product.kilometer,
            imageURL: product.imageURL,
            image: product.image,
            datePublication: DateTime.now().toString(),
            dateUpdate: DateTime.now().toString(),
            isFavorite: product.isFavorite == null ? false : product
                .isFavorite ?? false,
            isEnabled: product.isEnabled == null ? false : product.isEnabled ??
                false,
          ));
    }
   /// notifyListeners();
  }


  void removeProductItem(String productId) {
    try {
      _productItem.removeWhere((key, product) =>
      product.id.toString() == productId);
      notifyListeners();
    } catch (error) {
      throw "Could not delete product";
    }

    ///notifyListeners();
  }


  void incrementItemProduct(Product product, int index) {
    if (_productItem.containsKey(product.codeProd)) {
      _productItem.update(
          product.codeProd,
              (existingCartItem) =>
              Product(
                  id: existingCartItem.id,
                  codeProd: existingCartItem.codeProd,
                  type: existingCartItem.type,
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
                  dateUpdate: existingCartItem.dateUpdate,
                  isFavorite: existingCartItem.isFavorite,
                  isEnabled: existingCartItem.isEnabled
              ));
    }
    notifyListeners();
  }


  void decrementItemProduct(Product product, int index) {
    if (_productItem.containsKey(product.codeProd)) {
      _productItem.update(
          product.codeProd,
              (existingCartItem) =>
              Product(
                  id: existingCartItem.id,
                  codeProd: existingCartItem.codeProd,
                  type: existingCartItem.type,
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
                  dateUpdate: existingCartItem.dateUpdate,
                  isFavorite: existingCartItem.isFavorite,
                  isEnabled: existingCartItem.isEnabled
              ));
    }
    notifyListeners();
  }

  void cleanProducts() {
    notifyListeners();
    _productItem = {};
  }


  Future<void> editItemProduct(String id, Product editProduct) async {
    final productIndex = products.indexWhere((element) =>
    element.id.toString() == id);

    try {
      Product product = Product(
        id: editProduct.id,
        codeProd: editProduct.codeProd,
        type: editProduct.type,
        name: editProduct.name,
        description: editProduct.description,
        price: editProduct.price,
        quantityStock: editProduct.quantityStock,
        quantity: editProduct.quantity,
        category: editProduct.category,
        brand: editProduct.brand,
        brandModel: editProduct.brandModel,
        codeEan: editProduct.codeEan,
        codeQr: editProduct.codeQr,
        country: editProduct.country,
        city: editProduct.city,
        currency: editProduct.currency,
        kilometer: editProduct.kilometer,
        imageURL: editProduct.imageURL,
        image: editProduct.image,
        datePublication: DateTime.now().toString(),
        dateUpdate: editProduct.dateUpdate,
        isFavorite: editProduct.isFavorite == null ? false : editProduct
            .isFavorite ?? false,
        isEnabled: editProduct.isEnabled == null ? false : editProduct
            .isEnabled ?? false,
      );

      products[productIndex] = editProduct;
      notifyListeners();


    } catch (error) {
      rethrow;
    }
  }


  ///void notifyListerner() {}

  void recalculateTabElement(int tabIndex) {
    // Arrivo dalla home Tab default = 0 Fruits and Vegetable
    // TAB_0 --> FRUITS  AND VEGETABLE
    if (tabIndex == 0) {
      products.clear();
      for (var i in dataLoader) {
        products.add(i);

        /// 1- ADD PRODUCT INTO THE CART
        ///  CartItem().addItemCart(i, tabIndex);
      }
     /// notifyListeners();
      //  AgricultureBiologique(item: products[tabIndex],).createState().products=products;
      //flagItemEnabled = false;
    } else
      // TAB_1 --> FRUITS
    if (tabIndex == 1) {
      products.clear();
      for (var i in dataLoader) {
        if (i.category.toString().toLowerCase() ==
            AppLocalizations.translate('fruits')) {
          products.add(i);
          // category = i.category.toString().toLowerCase();
        }
      }
    } else {
      // TAB_0 --> VEGETABLE
      if (tabIndex == 2) {
        products.clear();
        for (var i in dataLoader) {
          if (i.category.toString().toLowerCase() ==
              AppLocalizations.translate('vegetables')
                  .toString()
                  .toLowerCase()) {
            products.add(i);
            // category = i.category;
          }
        }
      }
    }
  }



  sumTotal() {
    double totalPrice = 0;
    //productItemsList.forEach((item) {totalPrice = item.price + totalPrice;
    for (var item in const DataLoader()
        .createState()
        .productItemsList) {
      for (var item in const DataLoader()
          .createState()
          .productItemsList) {
        totalPrice = item.price + totalPrice;
      }
    }


    // void _onItemTapped(int index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }


    // void _handleTap(int index, List listTab) {
    //   //assert(index >= 0 && index < widget.tabs.length);
    //   assert(index >= 0 && index < listTab.length);
    //   _tabController.animateTo(index);
    //   // widget.onTap?.call(index);
    // }
// void setProductItemsList(List? productItemsListData) {
//   products.add(productItemsListData);
//   ///   productItemsData.add(productItemsListData);
//   productItemsListData = productItemsListData;
// }

// void onCategoryItemClicked(BuildContext context) {
//   Navigator.of(context).push( MaterialPageRoute(
//     builder: (BuildContext context) {
//       return ShoppingCartScreen();
//     },
//   ));
// }



    // void onCleanItemCartClicked(BuildContext context,
    //     List<Product> listProductItemsCart,) {
    //   listProductItemsCart.clear();
    //   //cartItemCount.clear();
    //  // amounts.clear();
    //   //amountProductMap?.clear();
    //   productItems.clear();
    // }

    void incrementAmount(int index, CartItem cartItem, newAmount) {
      newAmount = newAmount + 1;

      ///---------------------------------------------------------------------------------------
      /// 1- ADD PRODUCT INTO THE CART
      ///CartProvider.addItemCart(cartItem, index);

      /// 2- INCREMENT PRODUCT QUANTITY INTO THE CART
      ///  CartProvider.incrementItemCart(cartItem);

      /// MAP
      // amountProductMap?.putIfAbsent(product, () => amounts[index]);

      ///3 UPDATE PRODUCTS LIST INTO THE CART_SCREEN
      // if (!listProductItemsCart.contains(cartItem)) {
      //   listProductItemsCart.add(cartItem);
      // }

      /// 4- UPDATE AMOUNTS CART_SCREEN

      // itemCounterWidget =
      //     ItemCounterWidget(index: index, amount: newAmount, product: product);
      // itemCounterWidget.createState().incrementAmount(newAmount, product);

      /// itemCounterWidget.createState().updateParent(newAmount, product);
      ///---------------------------------------------------------------------------------------


      // cart.addItemCart(product,index, cartItemCount);
      // cart.cartItemIncrement(product,index, cartItemCount,quantityXArticlesAdd,cartItemsProvider);

      // save data item to local storage
      /// cart.cartAddItemsToLocalStorage(product.codeProd.toString(),cartItems);


      /// updateParent(index);


    }

    void decrementAmount(int index, CartItem cartItem, newAmount) {
      //amounts[index]--;

      ///---------------------------------------------------------------------------------------
      /// 1- REMOVE PRODUCT INTO THE CART
      /// cartScreen.createState().deleteItemCart(product, index, cartItemCount);

      /// 2- REMOVE PRODUCT QUANTITY INTO THE CART
      CartProvider.decrementItemCart(cartItem);

      /// MAP
      /// amountProductMap?.putIfAbsent(product, () => amounts[index]);

      ///  !!! 3 UPDATE PRODUCTS LIST INTO THE CART_SCREEN
      // TODO @ Check if you delete product X from cart_screen
      // if(!listProductItemsCart.contains(product)){
      //   listProductItemsCart.add(product);
      // }
      /// 4- UPDATE AMOUNTS CART_SCREEN

      //  itemCounterWidget = ItemCounterWidget(index: index, amount: amount, product: product);
      // itemCounterWidget.createState().decrementAmount(newAmount, product);

      ///---------------------------------------------------------------------------------------


      // cart.addItemCart(product,index, cartItemCount);
      // cart.cartItemIncrement(product,index, cartItemCount,quantityXArticlesAdd,cartItemsProvider);

      // save data item to local storage
      /// cart.cartAddItemsToLocalStorage(product.codeProd.toString(),cartItems);

      /// updateParent(index);

    }

    Future<int> getQuantityFromPrefs() async {
      var prefs = await SharedPreferences.getInstance();

      List<String>? elementProd = prefs.getStringList("pro");


      // int? counter=prefs.getInt('counter');

      ///Ok int?  counter  =(prefs.getInt('counter') ?? 0)+ 1;
      int? counter = prefs.getInt('counter')! + 1;
      prefs.setInt('counter', counter);


      List<String>? getListFromShared = prefs.getStringList('cartItemsList');
      List<dynamic>? getListFromShared2 = prefs.getStringList('cartItemsList');

      // List<dynamic> listCartItemsList = productsItemCount.map((i) =>
      //     i.toString()).toList();

      ///  var listCartItemsLists  =prefs.getStringList('listCartItemsLists');
      // var listCartItemsLists                =prefs.getStringList('listCartItemsLists');
      //  List<dynamic>? listCartItemsListsDyn = prefs.getStringList('listCartItemsLists');
      //  List<String>? listCartItemsListsString = prefs.getStringList('listCartItemsLists');


      /// List<String>? myList = (prefs.getStringList('mylist') ?? List<String>()) ;

      return counter;
    }




    // void _onItemTapped(int index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }


    void _handleTap(int index, List listTab) {
      //assert(index >= 0 && index < widget.tabs.length);
      assert(index >= 0 && index < listTab.length);
      _tabController.animateTo(index);
      // widget.onTap?.call(index);
    }

    // void buildController(int index) {
    //   // Create TabController for getting the index of current tab
    //   _controller = TabController(length: listTab.length, vsync: this);
    //
    //   _controller!.addListener(() {
    //     setState(() {
    //       _selectedIndex = _controller!.index;
    //     });
    //   });
    // }

    Future <void> saveIcrementCounter(List<dynamic> cartItemsList,
        Map<String, Product> productItemsList) async {
      final SharedPreferences prefs = await _prefs;


      ///***************************************************************************************
      /// OK Convert List<dynamic> product to list<String> and save the list into the shredPreference

      List<String> pro = cartItemsList.map((i) => i.toString()).toList();
      prefs.setStringList("pro", pro);

      List<String>? elementProd = prefs.getStringList("pro");

      ///***************************************************************************************
      //--------------------------------------------------------------------------

      /// List<dynamic> ====> List<String>
      List<Map<String, dynamic>> mapsProd = <Map<String, dynamic>>[];

      List<String> cartItemsListDynamic = cartItemsList.map((i) => i.toString())
          .toList();


      prefs.setStringList('cartItemsListDynamic', cartItemsListDynamic);

      List<String>? cartItemsDynamic = prefs.getStringList(
          "cartItemsListDynamic");


      // List<String> ggg = productItems.;

      // List<String> li = productItems.map((i) => Product.fromJson(i)).toList();
      // String? elementProd  = prefs.getString("pro");

      //  Map prodMap =jsonDecode(Product.fromJson(elementProd as Map<String, dynamic>).toJson() as String);

      //--------------------------------------------------------------------------


      // prefs.setStringList('dataProductItems', dataProductItems.values.toList().toString() as List<String>);

      //prefs.getStringList(dataProductItems);

      //Save list
      // List<dynamic> listCartItemsList = productsItemCount.map((i) =>
      //     i.toString()).toList();

      /// New List Steing form List Dynamic
      // List<String> listCartItemsLists=cartItemsList.map((i) => i.toString()).toList();
      String listCartItemsLists = jsonEncode(cartItemsList);
      prefs.setString('listCartItemsLists', listCartItemsLists);
      // prefs.setStringList('listCartItemsLists', listCartItemsLists);

      // save Map
      // prefs.setStringList('cartItemsList', productItems);


      /// final int  counter  =(prefs.getInt('counter') ?? 0)+ 1;
      int counter = 0;
      prefs.setInt('counter', counter);

      //   prefs.setStringList('cartItemsList', cartItemsList);

      // setState(() {
      //   _counterQuantity=prefs.setInt('counter', counter).then((bool success){
      //     return _counterQuantity;
      //   });
      // });

    }

  }




}

