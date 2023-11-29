import 'dart:convert';
import 'package:ecobioweb/category/components/gestion_agriculture_bio.dart';
import 'package:ecobioweb/loader/data_loader.dart';
import 'package:ecobioweb/roots/trunk/branches/cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../roots/trunk/branches/cart/components/cart_item.dart';
import '../../roots/trunk/branches/cart/widgets/item_counter_widget.dart';
import '../../roots/trunk/branches/commun_data_utils/utils/theme/app_theme.dart';
import '../../roots/trunk/branches/localisation/translation/components/appLocalizations.dart';
import '../../roots/trunk/branches/products/components/product.dart';
import '../../roots/trunk/branches/products/screens/product_view.dart';
import '../../shopping/screens/shopping_cart_screen.dart';




class AgricultureBiologique extends StatefulWidget {
  static List<Product> cartItemsProducts = [];
  Map<String, Product> cartItems = {};
  ///********************************************************************************
  ///static Map<String, Product> cartItemsMap=CartProvider().cartItem;


  ///********************************************************************************

  // static List<Product> productItems = [];
  static List<int> cartItemCount = [];
  static List<int> amounts = [];

  final Function? onAmountChanged;

  AgricultureBiologique({Key? key,  required this.item, this.onAmountChanged,  GestionAgricultureBio? gestionAgriBio}) : super(key: key);

   final Product? item;


   /// CartItem? itemCart;

  @override

  _AgricultureBiologiqueState createState() => _AgricultureBiologiqueState();
}

 class _AgricultureBiologiqueState extends State<AgricultureBiologique> with TickerProviderStateMixin  {
///class _AgricultureBiologiqueState extends State<AgricultureBiologique> with SingleTickerProviderStateMixin   {

  List<Tab> tabs = <Tab>[
    Tab(text: AppLocalizations.translate('fruitsVegetable').toString()),
    Tab(text: AppLocalizations.translate('fruits').toString()),
    Tab(text: AppLocalizations.translate('vegetables').toString()),
  ];


  // TabController? _controller;
 /// late TabController _controller;
  late TabController _tabController;

  List<dynamic> dataLoader = [];

  CartProvider gc = CartProvider();
  @override
  void initState() {


    /// loadProduct.initState(0);

    // TODO: implement initState
   super.initState();
    // Create TabController for getting the index of current tab
    ///Implement the list tab of controller
    ///var tabs = tabs;
   /// _controller =    TabController(length: listTab.length, vsync: this);
    _tabController = TabController(vsync: this, length: tabs.length);

    ///  DataLoader dataLoader= const DataLoader();
    // fetchItems(indexTab, flagItemEnabled).whenComplete(() => setState(() {}));
    ///fetchItems(flagItemEnabled).whenComplete(() => setState(() {}));

    // GestionAgricultureBio loadProduct = const GestionAgricultureBio();
    // const GestionAgricultureBio().createState().initState(_tabController.index);
    //   const GestionAgricultureBio().createState().initState();

   context.read<GestionAgricultureBio>().productItems;

    int index = 0;
    fetchProducts(index).whenComplete(() =>setState(() {}));



    // super.initState();
  }

  Future<void> fetchProducts(int index) async {
    //  try{

    final String response =
    await rootBundle.loadString('assets/json/products.json');
    final data = await json.decode(response);

    dataLoader = data['products'].map((data) => Product.fromJson(data)).toList();

    // final extratedData= jsonDecode(data) as Map<String,dynamic>;
    ///  Map<String, Product> extratedData = Product.fromJsonMap(json);


    List<Product> loadedProducts = [];



    /// GestionAgricultureBio().createState().setProductItemsList(productItemsList);

    /// _productItems?.putIfAbsent("product", () => productItemsList.toList());
    //products.clear();

    for (var product in dataLoader) {
    //   GestionAgricultureBio().createState().addItemProduct(product);

    ///   CartProvider.addItemCart(newCartItems(product));

          loadedProducts.add(product);
    }

    // productItems =  GestionAgricultureBio().createState().productItems;

  ///  productItems =  GestionAgricultureBio().productItems!;


    GestionAgricultureBio().productItems;

    /// non perche sara caricato dentro recalculateTabElement
    ///   products.add(product);
    /// Arrivo dalla home Tab default = 0 Fruits and Vegetable
    /// int index = products.where((element) => element.id)
    recalculateTabElement(index);
    //
    //   ///     /// 1- ADD PRODUCT INTO THE CART
    //  AgricultureBiologique().createState().addItemCart(product, 1);
    //   //
    //   //     /// 2- INCREMENT PRODUCT QUANTITY INTO THE CART
    //   AgricultureBiologique().createState().incrementItemCart(product, 1) ;
    //
    //   ///AgricultureBiologique().createState().productItemsList=productItemsList;
    //
    //   ///GestionAgricultureBio().createState().set_productItems(product);
    //


    //   products =loadedProducts;
    // products=loadedProducts;

    // Disabled flagItemEnabled per evitare di caticare la lista json per ogni click
    // flagItemEnabled = false;
    // }
    // }catch(error){
    //   rethrow;
    // }

  }


  ///**********************************************************************************
  ///Agriculture Bio

    // Map<String, Product> productItems= GestionAgricultureBio().createState().productItems;
    // List<Product> products = GestionAgricultureBio().createState().products;

  Map<String, Product> productItems= {};
  List<Product> products =[];

    // Map<String, CartItem> cartItems=CartProvider().cartItems ;
    //
    // List<CartItem> cartItemList =CartProvider().carts;

    CartItem? itemCart;

    final double height = 110;

    /// Map<String, CartItem>? cartItems={};
  ///CartProvider CartProvider =  CartProvider();

   // CartItem cartItem = CartItem(id: products[index].id.toInt(),
   //     codeProd: codeProd,
   //     name: name,
   //     description: description,
   //     price: price,
   //     quantityStock:
   //     quantityStock,
   //     quantity: quantity,
   //     imageURL: imageURL,
   //     image: image)

  ///********************************************************************************

///  ItemCounterWidget itemCounterWidget =  ItemCounterWidget();



  //List<int> cartItemCount= AgricultureBiologique.cartItemCount;
  List<int> amounts = AgricultureBiologique.amounts;

  /// list product agriculture bio
  // List<dynamic> productItems = [];
 /// List<dynamic> cartItems = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<int> productsItemCount = [];

  bool isLoadedlistProduct = true;

  List numberOfItems = <int>[];

  // FILTRE THE LIST MARKET ENABLED
  // List countryEnabled = [];


  bool flagItemEnabled = true;


  int _selectedIndex = 0;

  // The key of the list
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  double totalPrice = 0;
  int amount = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);




  List<Widget> listTab = [
//  List<Tab> listTab = [
    //  Tab(icon: Icon(Icons.card_travel)),
    // Tab(icon: Icon(Icons.add_shopping_cart)),
    Tab(
      child: Text(
        AppLocalizations.translate('fruitsVegetable').toString(),
        style: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ),
    ),
    Tab(
      child: Text(
        AppLocalizations.translate('fruits').toString(),
        style: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ),
    ),
    Tab(
      child: Text(
        AppLocalizations.translate('vegetables').toString(),
        style: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ),
    ),
  ];






  // Future<void> fetchItems(bool flagItemEnabled) async {
  //
  //   final String response =
  //   await rootBundle.loadString('assets/json/products.json');
  //   final data = await json.decode(response);
  //
  //   productItemsList = data['products'].map((data) => Product.fromJson(data)).toList();
  //
  //   for(var product in productItemsList){
  //
  //     GestionAgricultureBio().createState().setProductItemsMap(product);
  //     /// ok productsItemCount.add(i.quantity);
  //     productsItemCount.add(0);
  //     /// ADD 0 EVIRY ELEMENT TO THE LIST PRODUCT
  //    /// cartItemCount.add(0);
  //     amounts.add(0);
  //
  //   }
  //   /// Arrivo dalla home Tab default = 0 Fruits and Vegetable
  //   //recalculateElementTab(_controller.index);
  //
  //   /// CALCULATED TOTAL PRICE
  //   // sumTotal();
  // }

  @override



    Widget build(BuildContext context) {
    //
   //  final CartProvider=Provider.of<CartProvider>(context);
     var gestionAgriculture =Provider.of<GestionAgricultureBio>(context);
    //
    // final  cartsList = CartProvider.cartItems;

    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            print('The Tab has changed :)');

            //recalculateElementTab(tabController.index);
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: TabBar(
             // controller: _tabController,
              tabs: tabs,
            ),
          ),
          body: TabBarView(
           // controller: _tabController,
            children: tabs.map((Tab tab) {

           // productItems=  GestionAgricultureBio().createState().productItems;
           // products =     GestionAgricultureBio().createState().products;


          return

            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.50,
                child: products.isNotEmpty?


                AnimatedList(
                    scrollDirection: Axis.vertical,
                    // initialItemCount: productItems.length,
                    initialItemCount: products.length,
                    itemBuilder: (context, index, animation) {
                      return Slidable(
                        // actionPane: const SlidableDrawerActionPane(),
                        //secondaryActions: [
                        groupTag: <Widget>[

                          Text("data"),

                          MaterialButton(
                            color: const Color.fromARGB(255, 224, 212, 211)
                                .withOpacity(0.15),
                            elevation: 2,
                            height: 60,
                            minWidth: 60,
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 226, 218, 218),
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {

                                AnimatedList.of(context).removeItem(index, (context, animation) {
                                  return createProductList(index, products, productItems,products[index],animation);
                                });
                              });
                            },
                          ),
                        ],
                        // child: cartItem(cartItems[index], index, animation),
                        child: createProductList(index, products, productItems,products[index],animation),
                      );
                    })

                    : Container());




            }).toList(),// fine map tabs


          /*Ok    return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.50,
                child: cartItems.isNotEmpty?

                    Text(
                      '${tab.text!} Tab',
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                   : Container());

               }).toList(),
                */



                /*child: Row(
                    children:<Widget> [
                      Expanded(
                          child:SizedBox(
                        // padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: MediaQuery.of(context).size.height * 0.60,
                          child: products.isNotEmpty ?
                          AnimatedList(
                              scrollDirection: Axis.vertical,
                              initialItemCount: products.length,
                              itemBuilder: (context, index, animation) {
                                return SingleChildScrollView(
                                  child: ListView(
                                    children:<Widget> [
                                      createProductList(index,products,productItems),
                                    ],
                                  ),

                                  // actionPane: const SlidableDrawerActionPane(),
                                  //secondaryActions: [

                                  // groupTag: <Widget>[
                                  //   MaterialButton(
                                  //     color: const Color.fromARGB(255, 224, 212, 211)
                                  //         .withOpacity(0.15),
                                  //     elevation: 2,
                                  //     height: 60,
                                  //     minWidth: 60,
                                  //     shape: const CircleBorder(),
                                  //     child: const Icon(
                                  //       Icons.delete,
                                  //       color: Color.fromARGB(255, 226, 218, 218),
                                  //       size: 30,
                                  //     ),
                                  //     onPressed: () {
                                  //       setState(() {
                                  //
                                  //       });
                                  //     },
                                  //   ),
                                  // ], child:  cartItem(productItems,products[index], animation, context),

                                );
                              }) :Container(),
                            )
                      ),
                    ],
                  )
                    */

          ),
        );
      }),
    );
  }


  //Widget cartItem(Product product, Cart cart, int index, String codeProd,
  Widget cartItem(Map<String, Product> productItemsMap, Product product,Animation<double> animation,BuildContext context) {

      // int index, String codeProd, int quantity, Animation<double> animation) {
    // Cart cart_provider;
    ///---------------------------------------------------------------------
    int index = products.indexWhere((element) => element.id== product.id);

    // final CartProvider=Provider.of<CartProvider>(context);
    //
    // final  cartsList = CartProvider.cartItems;


    CartItem newCartItem = CartItem(
        id: products[index].id.toInt(),
        codeProd: products[index].codeProd,
        name: products[index].name,
        description: products[index].description,
        price: products[index].price,
        quantityStock:products[index].quantityStock,
        quantity: products[index].quantity,
        imageURL: products[index].imageURL,
        image: products[index].image);

    ///---------------------------------------------------------------------
     CartProvider gc = CartProvider();

    return GestureDetector(
      onTap: () {
        /// Add implemnent ProductViewPage
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductViewPage(product: product, quantity:product.quantity))
        );

        /// Add implement product into the ShoppingCardScreen
        //  Navigator.push( s
        //      context,
        //      MaterialPageRoute(
        //          builder: (context) => ShoppingCartScreen(product: product, quantity:productsItemCount[index], cartItems:  productItemsList[index]))
        //  );

      },
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(animation),
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
              children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                // imageURL of link String
                                child: Image.asset(
                                  product.imageURL,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 160,
                                ),

                                /* child: Image.asset("../../assets/images/verdure/avocado_1.png",
                                    height: 100, width: 100),
                                    */
                              ),
                            ),
                            //BRAND
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      product.brand.toString(),
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 20, 179, 28),
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    //PRODUCT NAME
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    // Container(
                                    //   widgets: cartItems.entries.map((e){
                                    //     var value=e.value;
                                    //     var index =e.key;
                                    //     ///int  indexProd=cartItems.elementAt(index);
                                    //     return Container(
                                    //       padding: const EdgeInsets.symmetric(
                                    //         horizontal: 25,
                                    //       ),
                                    //       width: double.maxFinite,
                                    //       child: ItemCounterWidget(
                                    //         itemCart: e.value,
                                    //         /// evalue,
                                    //         //itemCart: e.value,
                                    //         ///amount:e.value.quantity,
                                    //       ),
                                    //     );
                                    //   }).toList(),
                                    // ),

                                    Row(
                                        children: [
                                         iconWidget(
                                              Icons.remove,
                                              iconColor: AppColors.darkGrey,
                                              onPressed: ItemCounterWidget(itemCart: itemCart).createState().decrementAmount),
                                          const SizedBox(width: 18),
                                          /// QUANTITY CARTSCREEN
                                          Container(
                                              width: 30,
                                              child: Center(
                                                  child:
                                                  getText(
                                                      text:"222222" , fontSize: 18, isBold: true
                                                    //  text: widget.amount.toString(), fontSize: 18, isBold: true
                                                   ///   text:widget.itemCart!.quantity.toString() , fontSize: 18, isBold: true
                                                    // text: amount[index].toString(), fontSize: 18, isBold: true
                                                    // text: amounts[amount].toString(), fontSize: 18, isBold: true
                                                    //text: cartlist.values.toList()[amount].toString(), fontSize: 18, isBold: true
                                                  )
                                              )
                                          ),
                                          const SizedBox(width: 18),
                                         // iconWidget(Icons.add, iconColor: AppColors.primaryColor, onPressed:  ItemCounterWidget(itemCart:itemCart,).createState().incrementAmount),

                                          iconWidget(Icons.add, iconColor: AppColors.primaryColor,  onPressed:() => CartProvider.addItemCart(itemCart!)),
                            
                                        ],
                                      ),
                                    const SizedBox(height: 15),
                                    Text(
                                      '€ ${product.price} /kg ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ]),
                            ),

            // Row(children:
            // productItemsMap.entries.map((e){
            //   var value=e.value;
            //   var index =e.key;
            //   ///int  indexProd=cartItems.elementAt(index);
            //   return Container(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 25,
            //     ),
            //     width: double.maxFinite,
            //     child: ChartItemWidget(
            //       item: e.value,
            //       amount:e.value.quantity,
            //     ),
            //   );
            // }).toList(),
            //
            // )

            //  child: productItemsMap.isNotEmpty?
            //  SingleChildScrollView(
            //   child: Column(
            //     children: productItemsMap.entries.map((e){
            //          var value=e.value;
            //          var index =e.key;
            //          ///int  indexProd=cartItems.elementAt(index);
            //          return Container(
            //            padding: const EdgeInsets.symmetric(
            //              horizontal: 25,
            //            ),
            //            width: double.maxFinite,
            //            child: ChartItemWidget(
            //              item: e.value,
            //              amount:e.value.quantity,
            //            ),
            //          );
            //        }).toList(),
            //   ),
            // )
            //

         //   Expanded(
             /// flex:5,
           //   flex: 3,
          //    child:
           ///     Column(
             //     children: getChildrenWithSeperator(
             //       addToLastChild: false,
                    ///  widgets: cartItems.map((e) {
                    //  widgets: cartList.map((e) {
                    //  widgets: _cartItemsMap.values.toString().map((e) {
           ///         widgets: cartItems.entries.map((e){
                  //     var value=e.value;
                  //     var index =e.key;
                  //     ///int  indexProd=cartItems.elementAt(index);
                  //     return Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 25,
                  //       ),
                  //       width: double.maxFinite,
                  //       child: ItemCounterWidget(
                  //         itemCart: e.value,
                  //         /// evalue,
                  //         //itemCart: e.value,
                  //         ///amount:e.value.quantity,
                  //       ),
                  //     );
                  //   }).toList(),
                  //
                  //   seperator: const Padding(
                  //     padding: EdgeInsets.symmetric(
                  //       horizontal: 25,
                  //     ),
                  //     child: Divider(
                  //       thickness: 1,
                  //     ),
                  //   ),
                  // ),
                // const Divider(
                //   thickness: 1,
                // ),

          //  Column(
              // REMOVED DELETE PRODOCT FROM  LIST
           //   crossAxisAlignment: CrossAxisAlignment.end,
           //   children: <Widget>[
                // MaterialButton(
                //   minWidth: 10,
                //   padding: const EdgeInsets.all(0),
                //   onPressed: () {
                //     setState(() {
                //       CartProvider.removeCartItem(product.id.toString());
                //        // cart.getItemsFromLocalstorages( product.codeProd);
                //     });
                //   },
                //   shape: const CircleBorder(),
                //   child: const Icon(
                //     // Icons.delete,
                //     Icons.remove_circle_outline,
                //     // color: Color.fromARGB(255, 144, 133, 133),
                //     size: 30,
                //   ),
                // ),

                /// QUNTITY PRODUCT
                //  Container(
                //     child: Center(
                //       child: Text(newCartItem.quantity.toString(),
                //         style:TextStyle(fontSize: 20, color: Colors.grey.shade800),
                //       ),
                //     ),
                //   ),
                   ///>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
                // MaterialButton(
                //   padding: const EdgeInsets.all(0),
                //   minWidth: 10,
                //   splashColor: const Color.fromARGB(255, 12, 146, 46),
                //   onPressed: () {
                //    // setState(() {
                //
                //           CartProvider.addItemCart(newCartItem, index,product);
                //
                //           products[index].quantity;
                //
                //           // CartProvider().cartItems.putIfAbsent(products[index].codeProd, () =>
                //           //     CartItem(id: products[index].id.toInt(),
                //           //     codeProd: products[index].codeProd,
                //           //     name: products[index].name,
                //           //     description: products[index].description,
                //           //     price: products[index].price,
                //           //     quantityStock:products[index].quantityStock,
                //           //     quantity: products[index].quantity,
                //           //     imageURL: products[index].imageURL,
                //           //     image: products[index].image),
                //           // );
                //         //  cart.getItemsFromLocalstorage(product.codeProd, _cartItems);
                //
                //     CartProvider().carts.add(newCartItem);
                //    // });
                //   },
                //   shape: const CircleBorder(),
                //   child: const Icon(
                //     //Icons.add_shopping_cart,
                //     Icons.add_circle,
                //     color: Color.fromARGB(255, 46, 126, 59),
                //     size: 30,
                //   ),
                // ),

            //  ],
          //  ),
           /// )
          ]
          ),
        ),
      ),
    );
  }


  // check() {
  //   for (var value in  productItemsList) {
  //     // productsItemCount.add( productItemsList.length);
  //     productsItemCount.add( productItemsList.length);
  //   }
  // }

  //void addListProductItems(Product product,int index, List<int> productsItemCount ) {

  // void addListProductItems(Product product) {
  //
  //   if (_productItems.containsKey(product.codeProd)) {
  //
  //   } else {
  //     _productItems.putIfAbsent(
  //         amount,
  //         // product.codeProd,
  //             () => Product(
  //             id :product.id,
  //             codeProd:product.codeProd ,
  //             name:product.name ,
  //             description:product.description ,
  //             price:product.price ,
  //             quantityStock:product.quantityStock ,
  //             quantity:product.quantity ,
  //             category:product.category ,
  //             brand:product.brand ,
  //             brandModel:product.brandModel ,
  //             codeEan:product.codeEan ,
  //             codeQr:product.codeQr ,
  //             country:product.country ,
  //             city:product.city ,
  //             currency:product.currency ,
  //             kilometer:product.kilometer ,
  //             imageURL:product.imageURL ,
  //             image:product.image ,
  //             datePublication:DateTime.now().toString() ,
  //             dateUpdate:product.dateUpdate ,
  //             isFavorite:product.isFavorite,
  //             isEnabled:product.isEnabled
  //           /// product.amountProducts
  //         )
  //     );
  //   }
  //
  // }

  //  final Map<String, CartItem> _cartItemsProd = {};
  // checkTest() {
  //   for (var value in  productItemsList) {
  //     // productsItemCount.add(productItemsList.length);
  //     productsItemCount.add(productItemsList.length);
  //
  //     _cartItemsProd.forEach((key, productItemsList) {
  //       _cartItemsProd.values.map((e) => productItemsList);
  //     });
  //
  //     cart!.productItemsList.addAll(_cartItemsProd);
  //     _incrementCounter();
  //   }
  // }

  sumTotal() {
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


    Widget _incrementButton(int index) {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            numberOfItems[index]++;
          });
        },
        child: const Icon(Icons.add, color: Colors.black87),
      );
    }

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
      List<dynamic> listCartItemsList = productsItemCount.map((i) =>
          i.toString()).toList();

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


    Future<int> getQuantityFromPrefs() async {
      var prefs = await SharedPreferences.getInstance();

      List<String>? elementProd = prefs.getStringList("pro");


      // int? counter=prefs.getInt('counter');

      ///Ok int?  counter  =(prefs.getInt('counter') ?? 0)+ 1;
      int? counter = prefs.getInt('counter')! + 1;
      prefs.setInt('counter', counter);


      List<String>? getListFromShared = prefs.getStringList('cartItemsList');
      List<dynamic>? getListFromShared2 = prefs.getStringList('cartItemsList');

      List<dynamic> listCartItemsList = productsItemCount.map((i) =>
          i.toString()).toList();

      ///  var listCartItemsLists  =prefs.getStringList('listCartItemsLists');
      // var listCartItemsLists                =prefs.getStringList('listCartItemsLists');
      //  List<dynamic>? listCartItemsListsDyn = prefs.getStringList('listCartItemsLists');
      //  List<String>? listCartItemsListsString = prefs.getStringList('listCartItemsLists');


      /// List<String>? myList = (prefs.getStringList('mylist') ?? List<String>()) ;

      return counter;
    }
    List<Widget> listTab = [
//  List<Tab> listTab = [
      //  Tab(icon: Icon(Icons.card_travel)),
      // Tab(icon: Icon(Icons.add_shopping_cart)),
      Tab(
        child: Text(
          AppLocalizations.translate('fruitsVegetable').toString(),
          style: const TextStyle(
              fontSize: 15.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
        child: Text(
          AppLocalizations.translate('fruits').toString(),
          style: const TextStyle(
              fontSize: 15.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
        child: Text(
          AppLocalizations.translate('vegetables').toString(),
          style: const TextStyle(
              fontSize: 15.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
      ),
    ];


    List<Tab> tabs2 = <Tab>[
//  List<Tab> listTab = [
      //  Tab(icon: Icon(Icons.card_travel)),
      // Tab(icon: Icon(Icons.add_shopping_cart)),
      Tab(
        child: Text(
          AppLocalizations.translate('fruitsVegetable').toString(),
          style: const TextStyle(
              fontSize: 15.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
        child: Text(
          AppLocalizations.translate('fruits').toString(),
          style: const TextStyle(
              fontSize: 15.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
        child: Text(
          AppLocalizations.translate('vegetables').toString(),
          style: const TextStyle(
              fontSize: 15.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
      ),
    ];

    // List<Tab> tabs = <Tab>[
    //   Tab(text: AppLocalizations.translate('fruitsVegetable').toString()),
    //   Tab(text: AppLocalizations.translate('fruits').toString()),
    //   Tab(text: AppLocalizations.translate('vegetables').toString()),
    // ];




    void onCategoryItemClicked(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return const ShoppingCartScreen();
        },
      ));
    }

    void onCleanItemCartClicked(BuildContext context,
        List<Product> listProductItemsCart,) {
      listProductItemsCart.clear();
      //cartItemCount.clear();
      amounts.clear();
      //amountProductMap?.clear();
          productItems.clear();
    }

    void incrementAmount(int index, CartItem cartItem, newAmount) {
      amounts[index]++;
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
  }

    void onCleanAddItemCartClicked(BuildContext context, List<Product> listProductItemsCart) {

    }

    Widget iconWidget(IconData iconData, {Color? iconColor, int? index, onPressed}) {
      return GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed();
            ///  incrementAmount();
          }
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: const Color(0xffE2E2E2),
            ),
          ),
          child: Center(
            child: Icon(
              iconData,
              color: iconColor ?? Colors.black,
              size: 25,
            ),
          ),
        ),
      );
    }

    Widget getText({
      required String text,
      int? index,
      required double fontSize,
      bool isBold = false,
      color = Colors.black,
    }) {
      return Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      );
    }

  listWidget() {

    const Text(
      "product.name",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  createProductList(int index,List<Product> products, Map<String, Product> productItems,Product product,animation) {

    return GestureDetector(
      // Popup onClik single row Product
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductViewPage(product: products[index])));
      },

        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(animation),

          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(0, 2),
                  blurRadius: 6,
                ),
              ],
            ),

            child: Row(
              children:<Widget> [
                 Container(
                   margin: const EdgeInsets.only(right: 10),
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(10),
                     // imageURL of link String
                     child: Image.asset(
                       product.image,
                       fit: BoxFit.cover,
                       height: 100,
                       width: 100,
                     ),
                   ),
                 ),
                SizedBox(
                 // width: 300,
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.brand.toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 20, 179, 28),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        //PRODUCT NAME
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '€ ${product.price}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      const SizedBox(height: 10),

                      ]),

                ),

                SizedBox(
                 // width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:<Widget> [
                      ItemCounterWidget(
                          onAmountChanged: (newAmount) {
                            setState(() {
                              /// widget.itemCart.quantity;
                              /// amount =newAmount;
                              /// amount ?? newAmount;
                              product.quantity;
                            });
                          },
                          // itemCart: widget.itemCart,
                          itemCart: newCartItems(product) //ite
                      )
                    ],
                  ),
                ),


                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     ItemCounterCartWidget(
                //         onAmountChanged: (newAmount) {
                //           setState(() {
                //             /// widget.itemCart.quantity;
                //             /// amount =newAmount;
                //             /// amount ?? newAmount;
                //             product.quantity;
                //           });
                //         },
                //         // itemCart: widget.itemCart,
                //         itemCart: newCartItems(product) //ite
                //     )
                //   ],
                // )
              ],
            ),

          ),

        ),


    );

     /* return Stack(
         children:<Widget> [
           Container(
            // margin: const EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 0),
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            //  height: MediaQuery.of(context).size.height * 0.40,
            //  //height: 110,
            //  width: MediaQuery.of(context).size.width * 90,
           //  decoration:  const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),

             child: products.isEmpty?
               const Expanded(
                          child: Column(
                          children:<Widget> [
                            // Expanded(
                            //   child: ClipRRect(
                            //         borderRadius: BorderRadius.circular(10),
                            //         child: Image.asset(
                            //             products[index].image,
                            //             fit: BoxFit.cover,
                            //             height: 100,
                            //             width: 100,
                            //             ),
                            //   ),
                            // ),
                            Expanded(
                                child: Text(
                                      "product.name",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                )
                            )
                          ],
                      ) ,
                  )
                 :Container())
         ],
      );
      */
  }

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

      //  AgricultureBiologique(item: products[tabIndex],).createState().products=products;
      //flagItemEnabled = false;
    } else
      // TAB_1 --> FRUITS
    if (tabIndex == 1) {
      products.clear();
      for (var i in dataLoader) {
        if (i.category.toString().toLowerCase() ==
            AppLocalizations.translate('fruits').toString().toLowerCase()) {
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

  newCartItems(Product product) {
    CartItem cartItem = CartItem(
        id: product.id,
        codeProd:product.codeProd,
        name: product.name,
        description: product.description,
        price: product.price,
        quantityStock: product.quantityStock,
        quantity: product.quantity,
        imageURL: product.imageURL,
        image: product.image);

    return cartItem;

  }




}





