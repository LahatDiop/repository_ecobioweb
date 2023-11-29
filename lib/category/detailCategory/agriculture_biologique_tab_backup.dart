//ok page diversi tabView
import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../../roots/trunk/branches/cart/components/cart_item.dart';
import '../../providers/cart_provider.dart';
import '../../roots/trunk/branches/localisation/translation/components/appLocalizations.dart';
import '../../roots/trunk/branches/menu/menu_settings/settings/payment/screens/payment.dart';
import '../../roots/trunk/branches/menu/navigation_bar/components/menu_navigation_components.dart';
import '../../roots/trunk/branches/products/components/product.dart';
import '../../roots/trunk/branches/products/screens/product_view.dart';

class AgricultureBiologique extends StatefulWidget {
  AgricultureBiologique({Key? key}) : super(key: key);

  late List<Widget> tabs;
  ValueChanged<int>? onTap;

  @override
  _AgricultureBiologiqueState createState() => _AgricultureBiologiqueState();
}

class _AgricultureBiologiqueState extends State<AgricultureBiologique>
    with TickerProviderStateMixin {
  //map lista product from json
  final Map <String, Product> _productItems={};

  /// get list from class loder
  List<dynamic> cartItems = [];

  List<dynamic> cartItemsList = [];
  List<dynamic> cartItemsListPrice = [];
  List<dynamic> cartItemsListQuantity = [0];
  int quantity = 0;
  CartItem? quantity_cart;
  List<dynamic> cartItemsFruits = [];
  List<dynamic> cartItemsVegetables = [];
  List<dynamic> cartItemsFruitsVegetable = [];
  List<dynamic> listCodeProd = [];
  String codeProd = "";
  int quantyProdToAdd = 0;
  List<int> quantyToAdd = [];
  Map<int, String> codeProdQuantity = <int, String>{};

  Map<String, Product> mapProductsAgriBio = <String, Product>{};
  //List<int> cartItemCount = <int>[];
  List<int> cartItemCount = [0, 0, 0, 0, 0, 0, 0, 0];
  // List<int> cartItemCount = [];
  //List<int> quantityProdCart = [0, 0, 0, 0, 0, 0, 0, 0];
  //List<int> cartItemCount = []..length;
  //List<int> cartItemCount= <int>[] ;
  bool isLoadedlistProduct= true;

  List numberOfItems = <int>[];
  // List<int> numberOfItems = [];
  //List numberOfItems = [];

  late List<CartItem> products;
  //List<Map<String, dynamic>> cart = [];
  //Cart? cart;

  // FILTRE THE LIST MARKET ENABLED
  List countryEnabled = [];

  // List<int> cartItemCount = [];

  //int cartItemCount = 0;
  int singleProdItemCount = 0;
  //int totalPrice = 0;
  bool flagItemEnabled = true;

  // TabController? _controller;
  late TabController? _controller;
  int _selectedIndex = 0;
  // late String category;

  String? tabName = "";

  // The key of the list
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  double totalPrice = 0;

  int _counter = 0;

  //late Cart cart;
  Cart cart = Cart();

  ///ConnectionSqlLite connectionSqlLite = ConnectionSqlLite();

  ///DbConnectionServices dbconnectSqLite=DbConnectionServices();


  final Map<String, CartItem> _cartItems = {};

  //late List<int> listQty;

  late List<int>  getQuantityXArticles ;
  var quantityXArticles=0;

  //  List<int>?  quantityXArticlesAdd = <int>[];
  List<int> quantityXArticlesAdd = [0, 0, 0, 0, 0, 0, 0, 0];
  //int _selectedIndex = 0;
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


  // static const _kPages = <String, IconData>{
  //   'Home': Icons.home,
  //   'Search': Icons.search,
  //   'Categorty': Icons.category,
  //   'Buy': Icons.shopping_cart,
  //   'Setting': Icons.settings_applications,
  //   // 'Add': Icons.add,
  //   // 'Search': Icons.search,
  //
  //   // 'people': Icons.people,
  //   // 'map': Icons.map,
  // };

  // static const List<Widget> _widgetOptions33 = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];


  // final List<Widget> _widgetOptions = [
  //   // HOME 1
  //   const Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //
  // ///  const HomeCategoryViewScreen(),
  //   //const HomeScreen(),
  //
  //  // const MenuNavigationComponents(),
  //
  //   // SEARCHE 2
  //
  //   // const Text(
  //   //   'Index 1: Business',
  //   //   style: optionStyle,
  //   // ),
  //   //SearchWidget(),
  //   const SearchScreen(),
  //
  //   // LOCALIZATION
  //   // const Text(
  //   //   'Index 2: School',
  //   //   style: optionStyle,
  //   // ),
  //   //const GestionLocalization(),
  //   const WishListScreen(),
  //
  //   // CATEGORY 3
  //
  //   // list agri
  //
  //   // SubCategoryScreen(
  //   //    slug: '',
  //   //  ),
  //
  //   //BY SHOPPING 3
  //   // const Text(
  //   //   'Index 2: School',
  //   //   style: optionStyle,
  //   // ),
  //   const ShoppingCartScreen(),
  //
  //   //ADD NEW PUBLICATION
  //   // const PublicationScreen(),
  //
  //   // const HomeScreen()
  //
  //   //PROFILE 5
  //   // const Text(
  //   //   'Index 2: School',
  //   //   style: optionStyle,
  //   // ),
  //   SettingScreen(),
  //
  //   // ProfilePage(),
  // ];

  // final TabStyle _tabStyle = TabStyle.fixed;

  // final List<Widget> pagesContainer = [
  //   // HOME 1
  //   const HomeCategoryViewScreen(),
  //   //const HomeScreen(),
  //
  //   // SEARCHE 2
  //   //SearchWidget(),
  //   const SearchScreen(),
  //
  //   // LOCALIZATION
  //   //const GestionLocalization(),
  //   const WishListScreen(),
  //
  //   // CATEGORY 3
  //
  //   // list agri
  //
  //   // SubCategoryScreen(
  //   //    slug: '',
  //   //  ),
  //
  //   //BY SHOPPING 3
  //   const ShoppingCartScreen(),
  //
  //   //ADD NEW PUBLICATION
  //   // const PublicationScreen(),
  //
  //   // const HomeScreen()
  //
  //   //PROFILE 5
  //   SettingScreen(),
  //
  //   // ProfilePage(),
  // ];

  // var getQuantityXArticlesAdd=0;



  Map<String, CartItem> get cartItemsProvider {
    return {..._cartItems};
  }

  // List listQty= _cartItems.values.toList();
  //cart_provider=cart.addItem(productId, price, title, imgUrl);


  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: listTab.length, vsync: this);

    // IDENTIFICATION TAB
    //  int indexTab = _controller!.index;
    // int indexTab = 0;
    // switch (indexTab) {
    //   case 0:
    //     tabName = AppLocalizations.translate('fruitsVegetables').toString();
    //     break;
    //   case 1:
    //     tabName = AppLocalizations.translate('fruits').toString();
    //     break;
    //   case 2:
    //     tabName = AppLocalizations.translate('vegetables').toString();
    //     break;
    //   default:
    // }

    ///  DataLoader dataLoader= const DataLoader();
    /// Stop  List cartItems= dataLoader.createState().cartItems;

    // fetchItems(indexTab, flagItemEnabled).whenComplete(() => setState(() {}));
    fetchItems(flagItemEnabled).whenComplete(() => setState(() {}));
    super.initState();
  }


  Future<void> fetchItems(bool flagItemEnabled) async {

    // DataLoader dataLoader= const DataLoader();
    //
    // List cartItems= dataLoader.createState().cartItems;
    //
// Implement the list tab of controller
    // _controller = TabController( vsync: this,length: listTab.length);
    cartItems.length;
    mapProductsAgriBio= _productItems;
/*
   if(mapProductsAgriBio.isEmpty){
      isLoadedlistProduct=true;
   }
   */
    if (flagItemEnabled && isLoadedlistProduct) {
      final String response =
      await rootBundle.loadString('assets/json/products.json');
      final data = await json.decode(response);
      //var indexTab = 0;
      cartItemsList = data['products'].map((data) => Product.fromJson(data)).toList();

      cartItemCount.add(cartItemsList.length);




      // quantityXArticlesAdd.clear();

      // ADD THE LIST OF PRODUCTS INTO THE MAP PRODUCT LIST
      for (var product in cartItemsList) {
        addListProductItems(product);

        //SessionManager().set(product.toString(), value)

        /*   var sessionManager = SessionManager();
        await sessionManager.set("id", "18");
        await sessionManager.set("codeProd", 1005);
        await sessionManager.set("name", "dees");
        await sessionManager.set("description", "Mla");

        */
        // await sessionManager.set("product", new Product(id, codeProd, name, description, price, quantityStock, category, brand, brandModel, codeEan, codeQr, country, city, currency, kilometer, imageURL, image, datePublication, dateUpdate, isFavorite, isEnabled) ;

        //  quantityXArticlesAdd.add(cartItemsList.length);
      }
      cartItemCount.add(cartItemsList.length);





      // cart.getItemsFromLocalstorage('1003', cartItemsList);
      //    cart.getItemsFromLocalstorages('1003');

      //addListProductItems(product, index, cartItemCount);
      // addListProductItems(pro);


      // listQty= _cartItems.values.cast<int>().toList();
      // getQuantityXArticles  =  cart.getQuantityXArticles(codeProd, listQty);

      //quantityProdCart.add(cartItemsList.length);

      // add the list product into the cartItems
      // _cartItems.addEntries(data['products'].map((data) => Product.fromJson(data)).toList());

      //  Map<String, CartItem> _cartItems = {};

      ///cart.addItem(cartItemsList);
      //_cartItems

      //  cart!.cartItems.addAll(cartItemsList);

      check();

      //   cartItemCount = [cartItemsList.length];

      // Disabled flagItemEnabled per evitare di caticare la lista json per ogni click
      // flagItemEnabled = false;
    }

    int indexTab=0;
    // var ididiid=  _controller!.index;
    // Arrivo dalla home Tab default = 0 Fruits and Vegetable
    // TAB_0 --> FRUITS  AND VEGETABLE
    if ( _controller!.index == 0) {

      cartItems.clear();
      for (var i in cartItemsList) {
        cartItems.add(i);
        //--listCodeProd.add(i.codeProd);
        //--cartItemsListQuantity.add(0);

        // codeProd = i.codeProd;
        //--generateCodeProd();
        //category = AppLocalizations.translate('fruitsVegetable').toString().toLowerCase();
      }
      //flagItemEnabled = false;
    } else
      // TAB_1 --> FRUITS
    if ( _controller!.index == 1) {
      cartItems.clear();
      for (var i in cartItemsList) {
        if (i.category.toString().toLowerCase() ==
            AppLocalizations.translate('fruits').toString().toLowerCase()) {
          cartItems.add(i);
          // category = i.category.toString().toLowerCase();
        }
      }
    } else {
      // TAB_0 --> VEGETABLE
      if ( _controller!.index ==2) {
        cartItems.clear();
        for (var i in cartItemsList) {
          if (i.category.toString().toLowerCase() ==
              AppLocalizations.translate('vegetables').toString().toLowerCase()) {
            cartItems.add(i);
            // category = i.category;
          }
        }
      }
    }

    // generateCodeProd();
    // CALCULATED TOTAL PRICE
    // sumTotal();
  }

  check() {
    for (var value in cartItems) {
      // cartItemCount.add(cartItems.length);
      cartItemCount.add(cartItems.length);
    }
  }

  //void addListProductItems(Product product,int index, List<int> cartItemCount ) {

  void addListProductItems(Product product) {

    if (_productItems.containsKey( product.codeProd)) {

    } else {
      _productItems.putIfAbsent(
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
                  isEnabled:product.isEnabled

              ));
    }

  }

  /* Map<String, CartItem> _cartItemsProd = {};
  checkTest() {
    for (var value in cartItems) {
      // cartItemCount.add(cartItems.length);
      cartItemCount.add(cartItems.length);

      _cartItemsProd.forEach((key, cartItems) {
        _cartItemsProd.values.map((e) => cartItems);
      });

      cart!.cartItems.addAll(_cartItemsProd);
      _incrementCounter();
    }
  }
*/
  sumTotal() {
    //cartItems.forEach((item) {totalPrice = item.price + totalPrice;
    for (var item in cartItems) {
      totalPrice = item.price + totalPrice;
    }
  }

  generateCodeProd() {
    for (var item in cartItems) {
      codeProd = item.codeProd;
    }
  }

  getQuantityProd() {
    quantyProdToAdd++;
    quantyToAdd.add(quantyProdToAdd);

    // cartItemCount++;
    //  singleProdItemCount++;
    // cartItemCount.length++;
  }

  getQuantityProd22() {
    for (var item in cartItems) {
      if (item.codeProd.isNotEmpty && item.codeProd == codeProd) {
        quantyProdToAdd = quantyProdToAdd++;
        quantyToAdd.add(quantyProdToAdd);

        // cartItemCount++;
        singleProdItemCount++;
        // cartItemCount.length++;

        // } else {
        //   singleProdItemCount--;
      }
    }
  }

  quantityProd() {
    for (var item in cartItemsListQuantity) {
      // if (item.codeProd.isNotEmpty && item.codeProd == codeProd) {
      quantity++;
      //}
    }
  }
  // @override
  // Widget build222(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Bio Marcket Place'),
  //     ),
  //     body: Center(
  //       child: _widgetOptions.elementAt(_selectedIndex),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       items: const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: 'Home',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.search),
  //           label: 'Search',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.category),
  //           label: 'Category',
  //         ),
  //
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.shopping_cart),
  //           label: 'Buy',
  //         ),
  //
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.settings_applications),
  //           label: 'Setting',
  //         ),
  //
  //       ],
  //       currentIndex: _selectedIndex,
  //       selectedItemColor: Colors.amber[800],
  //       onTap: _onItemTapped,
  //     ),
  //   );
  // }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      //final formatCurrency = NumberFormat.currency(locale: 'eu').format(12);
      //length: _kPages.length, NO because Error
        length: listTab.length,
        initialIndex: 0, // home page initial = 0
        child: Scaffold(
          // return MaterialApp(
          // home: Scaffold(
          // return Scaffold(
          appBar: AppBar(

            bottom: TabBar(
              onTap: (index) {
                // Should not used it as it only called when tab options are clicked,
                // not when user swapped
                ///  fetchItems(index);
                //   flagItemEnabled=false;
                //    if (index == 1 || index == 2) {
                //     fetchItems(flagItemEnabled);
                //
                //      _controller!.index = index;
                //    }else if (index==0){
                //     // flagItemEnabled=false;
                //      fetchItems(flagItemEnabled);
                //    }
                fetchItems(flagItemEnabled);
                _handleTap(index, listTab);

                // buildController(index);
                // buildTabController(index);
              },
              controller: _controller,
              tabs: listTab,
            ),



            //title: const Text('AGRO BIO', style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
            //leading: const BackButton( color: Colors.black,  ),
            //title: const Text('AGRO BIO'),
          ),


          /*   appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: const Icon(Icons.close),
        title: const Text('My Cart',
            style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
*/


          /// ==================================INIT BODY==================================================
          //  body: TabBarView(
          body: TabBarView(
            controller: _controller,
            children: <Widget>[

              // listTab.elementAt(_controller!.index),

              // if (_controller!.index == 0) const FruitsVegetables(),
              //
              // if (_controller!.index == 1) const Fruits(),
              //
              // if (_controller!.index == 2) Vegetables(),

              // _widgetOptions.elementAt(_selectedIndex),
              //   if (_selectedIndex == 0) const FruitsVegetables(),

              // if (_selectedIndex == 1) const Fruits(),

              // if (_selectedIndex == 2) Vegetables(_selectedIndex),
              // const FruitsVegetables(),
              // Fruits(),
              /// const AgricultureBiologique(),
              // AgricultureBiologique(),

              //11111111111111111111111111111111
              Flexible(
                flex: 5,
                // flex:cartItems.length,
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      //SearchWidget(),
                      SizedBox(
                        height: 10,
                        child: Container(
                          color: const Color(0xFFf5f6f7),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: cartItems.isNotEmpty?
                        // FadeAnimation(
                        //     1.4,
                        AnimatedList(
                            scrollDirection: Axis.vertical,
                            // initialItemCount: cartItems!.length,
                            initialItemCount: 0,
                            itemBuilder: (context, index, animation) {
                              return Slidable(
                                // actionPane: const SlidableDrawerActionPane(),
                                //secondaryActions: [
                                groupTag: <Widget>[
                                  MaterialButton(
                                    color: Colors.red.withOpacity(0.15),
                                    elevation: 2,
                                    height: 35,
                                    minWidth: 60,
                                    shape: const CircleBorder(),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        //totalPrice = totalPrice - (int.parse(cartItems[index].price.toString()) * cartItemCount[index]);
                                        //   totalPrice = totalPrice - (int.parse(singleProdItemCount[index].price.toString()) * singleProdItemCount[index]);
                                        totalPrice = totalPrice -(int.parse(cartItems[index].price.toString()) *  cartItemCount[index]);
                                        // quantyProdToAdd++;
                                        AnimatedList.of(context).removeItem(
                                            index, (context, animation) {
                                          return cartItem(
                                              cartItems[index],
                                              // cart!,
                                              index,
                                              cartItems[index].codeProd,
                                              _counter,
                                              animation);
                                        });
                                        //  singleProdItemCount.removeAt(index);

                                        cartItems.removeAt(index);
                                        cartItemCount.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                                child: cartItem(
                                    cartItems[index],
                                    //cart!,
                                    index,
                                    cartItems[index].codeProd,
                                    _counter,
                                    animation),
                              );
                            })
                        //)
                            : Container(),
                      ),
                      const SizedBox(height: 8),
                      // FadeAnimation(
                      //   1.2,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //Shipping
                            Text('Trasporto', style: TextStyle(fontSize: 20)),
                            //Text(' 5.99 €',
                            Text(' 5.99 €',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      // ),
                      //  FadeAnimation(
                      //      1.3,
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DottedBorder(
                            color: Colors.grey.shade400,
                            dashPattern: const [10, 10],
                            padding: const EdgeInsets.all(0),
                            child: Container()),
                        //)
                      ),
                      // FadeAnimation(
                      //     1.3,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text('Total :', style: TextStyle(fontSize: 20)),
                            Text('\$${totalPrice + 8.99}',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      //),
                      const SizedBox(height: 10),
                      // FadeAnimation(
                      //     1.4,
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentPage(totalPrice: totalPrice)));
                            // MaterialPageRoute( builder: (context) => const MenuNavigationComponents()));
                          },
                          height: 50,
                          elevation: 0,
                          splashColor: const Color.fromARGB(255, 41, 218, 18),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: const Color.fromARGB(255, 67, 219, 54),
                          child: const Center(
                            child: Text(
                              "Checkout",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        //   )
                      ),
                      const SizedBox(height: 10),

                      /** Button go to home **/
                      // FadeAnimation(1.4,
                      MaterialButton(
                        onPressed: () {

                          isLoadedlistProduct=false;
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));{{{}}}}[[]]**
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  const MenuNavigationComponents()));
                          // builder: (context) =>  const ShoppingCartScreen()));
                        },
                        height: 50,
                        elevation: 0,
                        splashColor: Colors.yellow[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.yellow[800],
                        child: const Center(
                          child: Text(
                            "Back to Home1",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      // ),
                      const SizedBox(
                        height: 5.0,
                      ),



                      /*   Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height * 0.40,
                  child: Column(
                    children: const [
                      // TODO back _buildStyleSelector(),
                     // Divider(),
// child: MenuNavigationComponents()
                      Expanded(
                         child: MenuNavigation()
                      // child: MenuNavigationComponents()
                         // child: MystatefulWidget()
                      ),
                    ],
                    //  children: pagesContainer,
                  ),
               )
             Column(
             children: const [

              // child: MenuNavigationComponents()

              MenuNavigation()

             //  MenuNavigationComponents()
             // child: MenuNavigationComponents()
             // child: MystatefulWidget()

              ]
             )
          */

                      /** Button go to home **/
                      /*       FadeAnimation(
             1.4,
             MaterialButton(
               onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));{{{}}}}[[]]**
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) =>
                         const MenuNavigationComponents()));
               },
               height: 50,
               elevation: 0,
               splashColor: Colors.yellow[700],
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)),
               color: Colors.yellow[800],
               child: const Center(
                 child: Text(
                   "Back to Home",
                   style: TextStyle(color: Colors.white, fontSize: 16),
                 ),
               ),
             ),
                ),
                const SizedBox(
             height: 5.0,
                ),
*/
                    ]),


              )
              //+++++++++++++++++++++++++++++++++++

            ],


          ),
          /// ==================================END BODY==================================================


          /*   persistentFooterButtons: <Widget>[
        Row(
          children: const <Widget>[
           HomeCategoryViewScreen(),
            SearchScreen(),
             WishListScreen(),
          ],
        )
      ],
           */

          // key: children: _widgetOptions.elementAt(_selectedIndex),
          //
          // child:[widget
          //
          //  children: _widgetOptions.elementAt(_selectedIndex),
          // ],



          //  child: _widgetOptions.elementAt(_selectedIndex),
// DIVISION MANY SECTION TO PAGE : CLASS
          /* ok   bottomNavigationBar: Container(
        padding: EdgeInsets.all(0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,

          children: const <Widget>[

            Expanded(
              flex: 1,
              child: ShoppingCartScreen(),
            ),

            Expanded(
              flex: 1,
              child: HomeCategoryViewScreen()
            ),

            Expanded(
              flex: 1,
              child:SearchScreen()
            ),
          ],
        ),
      ),
      */

          /// MENU NAV BAR SECOND LIVEL
          /**
              persistentFooterButtons: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              MaterialButton(
              color: Colors.red.withOpacity(0.15),
              elevation: 2,
              height: 35,
              minWidth: 60,
              shape: const CircleBorder(),
              child: const Icon(
              Icons.home,
              color: Colors.red,
              size: 30,
              ),

              onPressed: () {
              setState(() {
              children: const HomeCategoryViewScreen();
              });
              },
              ),
              MaterialButton(
              color: Colors.red.withOpacity(0.15),
              elevation: 2,
              height: 35,
              minWidth: 60,
              shape: const CircleBorder(),
              child: const Icon(
              Icons.search,
              color: Colors.red,
              size: 30,
              ),
              onPressed: () {
              setState(() {

              });
              },
              ),
              MaterialButton(
              color: Colors.red.withOpacity(0.15),
              elevation: 2,
              height: 35,
              minWidth: 60,
              shape: const CircleBorder(),
              child: const Icon(
              Icons.category,
              color: Colors.red,
              size: 30,
              ),
              onPressed: () {
              setState(() {

              });
              },
              ),



              //_widgetOptions.elementAt(_selectedIndex),
              ],
              ),
              ],
           */

          //   bottomNavigationBar: BottomNavigationBar(
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Home',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.search),
          //       label: 'Search',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.category),
          //       label: 'Category',
          //     ),
          //
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.shopping_cart),
          //       label: 'Buy',
          //     ),
          //
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.settings_applications),
          //       label: 'Setting',
          //     ),
          //
          //   ],
          //
          //   currentIndex: _selectedIndex,
          //   selectedItemColor: Colors.amber[800],
          //     onTap: _onItemTapped,
          //        //_widgetOptions.elementAt(_selectedIndex),
          // ),

          //),


          // children: [MenuNavigation()]

          // child: MenuNavigationComponents()



          //  MenuNavigationComponents()
          // child: MenuNavigationComponents()
          // child: MystatefulWidget()




          // BUTTON MENU BAR
          /*   bottomNavigationBar: ConvexAppBar.badge(
        // Optional badge argument: keys are tab indices, values can be
        // String, IconData, Color or Widget.
        /*badge=*/
        const <int, dynamic>{5: '99+'},
        style: _tabStyle,
        items: <TabItem>[
          for (final entry in _kPages.entries)
            TabItem(icon: entry.value, title: entry.key),
        ],
        // ignore: avoid_print
        onTap: (int i) => print('click index=$i'),
      ),

*/


          //ok
          /*   bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      */
        )
    );
    //);
  }

  buildFruitsVegetablew(cartItems, context, totalPrice, cartItemCount) {
    initState();
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      //SearchWidget(),
      SizedBox(
        height: 10,
        child: Container(
          color: const Color(0xFFf5f6f7),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.50,
        // height: MediaQuery.of(context).size.height * 0.45,
        child: cartItems.isNotEmpty?
        // FadeAnimation(
        //         1.4,
        AnimatedList(
            scrollDirection: Axis.vertical,
            initialItemCount: cartItems.length,
            itemBuilder: (context, index, animation) {
              return Slidable(
                // actionPane: const SlidableDrawerActionPane(),
                //secondaryActions: [
                groupTag: <Widget>[
                  MaterialButton(
                    color: Colors.red.withOpacity(0.15),
                    elevation: 2,
                    height: 60,
                    minWidth: 60,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        totalPrice = totalPrice -
                            (int.parse(
                                cartItems[index].price.toString()) *
                                cartItemCount[index]);

                        AnimatedList.of(context).removeItem(index,
                                (context, animation) {
                              return cartItem(
                                  cartItems[index],
                                  //cart!,
                                  index,
                                  cartItems[index].codeProd,
                                  _counter,
                                  animation);
                            });

                        cartItems.removeAt(index);
                        cartItems.remove(codeProd);
                        cartItemCount.removeAt(index);
                      });
                    },
                  ),
                ],
                //  child: cartItem(cartItems[index], cart!, index,
                child: cartItem(cartItems[index],index,
                    codeProd, quantyProdToAdd, animation),
              );
            })
        // )
            : Container(),
      ),
      const SizedBox(height: 30),
      // FadeAnimation(
      //   1.2,
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Shipping
            Text('Trasporto', style: TextStyle(fontSize: 20)),
            Text(' 5.88 €',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      // ),
      // FadeAnimation(
      //     1.3,
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: DottedBorder(
            color: Colors.grey.shade400,
            dashPattern: const [10, 10],
            padding: const EdgeInsets.all(0),
            child: Container()),
        //)
      ),
      // FadeAnimation(
      //     1.3,
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Total', style: TextStyle(fontSize: 20)),
            Text(
                NumberFormat.currency(locale: 'eu', symbol: '€')
                    .format(totalPrice + 5.99),
                // 123.456,00 ?t({totalPrice + 5.99}),
                // Text('€ ${totalPrice + 5.99}',
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      //),
      const SizedBox(height: 10),

    ]
      // ),
    );
  }

  //Widget cartItem(Product product, Cart cart, int index, String codeProd,
  Widget cartItem(Product product, int index, String codeProd,
      int quantyProdToAdd, Animation<double> animation) {
    // LIMITI THE LIST INDEX 12,12,.... OR cartItems.length
    // List<int> cartItemCount = List<int>.generate(cartItems.length, (index) => index + 1);

    // CLEAR THE LIST CARTCOUNTITEM EQUAL 0 IF NOTE SELECTED PRODOCT
    //List<int> cartItemCount =  List<int>.generate(cartItems.length, (index) => index + 0);

    // Cart cart_provider;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductViewPage(product: product)));
      },
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
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
          child: Row(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // imageURL of link String
                child: Image.asset(
                  product.imageURL,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
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
            Column(
              // REMOVED DELETE PRODOCT FROM  LIST
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //QUANTITY PROD IN THE GARBAGE CESTINO
                Container(
                  child: Center(
                    // child: Text(
                    //   'Code :$codeProd',
                    //   //  'Index' + index.toString(),
                    //   // "3333",
                    //   style:
                    //       TextStyle(fontSize: 20, color: Colors.grey.shade800),
                    // ),
                  ),
                ),
                /* SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (ctx, i) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: FittedBox(
                            child: Text(products[i].price.toStringAsFixed(2)),
                          ),
                        ),
                        title: Text(products[i].title),
                        subtitle: Text(
                            "Price: ${(products[i].price * products[i].quantity).toStringAsFixed(2)}"),
                        trailing: Text(
                            "Qty: ${(products[i].quantity).toStringAsFixed(2)}"),
                      );
                    },
                  ),
                ),
                */
                MaterialButton(
                  minWidth: 10,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      // if (singleProdItemCount >= 1) {
                      if (product.codeProd.isNotEmpty &&
                          product.codeProd == codeProd) {
                        singleProdItemCount--;

                        totalPrice == totalPrice - product.price;

                        //   cartItems.removeAt(index);
                        //  cartItems.remove(codeProd);
                        //cartItemCount.removeAt(index);

                        // if (cartItemCount[index] >= 1) {
                        //   cartItemCount[index]--;
                        // }

                        cart.removeItem(product.codeProd.toString(), index, cartItemCount);
                        cart.cartItemDecrement(product.codeProd.toString(), index, quantityXArticlesAdd, cartItemCount);
                        //   cart.addItem(product.id.toString(), product.price.toDouble() ,product.description, product.imageURL,index, cartItemCount);

                        cart.getItemsFromLocalstorages( product.codeProd);
                      }
                      //}
                    });
                    // cartItems.removeAt(index);
                    //cartItemCount.removeAt(index);
                  },
                  shape: const CircleBorder(),
                  child: const Icon(
                    // Icons.delete,
                    Icons.remove_circle_outline,
                    // color: Color.fromARGB(255, 144, 133, 133),
                    size: 30,
                  ),
                ),
                //QUANTITY PROD IN THE GARBAGE CESTINO
                /*  Container(
                  child: Center(
                    child: Text(
                      'id' + codeProd.toString(),
                      // "3333",
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade800),
                    ),
                  ),
                ),
                */
                //QUANTITY
                Container(
                  child: Center(
                    child: Text(
                      //  cartItemCount[index].toString(),
                      quantityXArticlesAdd[index].toString(),
                      //  getQuantityXArticlesAdd.toString(),
                      // quantityProdCart[index].toString(),
                      // quantityXArticles.toString(),

                      // cart.quantityProdCart.toString(),
                      style:
                      TextStyle(fontSize: 20, color: Colors.grey.shade800),

                      //  quantity_cart!.quantity.toString(),
                      //  '${numberOfItems[index]}',
                      //lahat
                      // '$_counter[index]',
                      //'$quantity',
                      // '$cart.add(data.data[$index])',

                      //  '${numberOfItems[index].name.toString()}\n',
                      // '$numberOfItems[index.length]',

                      // cartItemCount[index].toString(),
                      //quantyProdToAdd.toString(),
                      // quantity.toString(),
                      // '$_counter',


                    ),
                  ),
                ),
                //>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
                MaterialButton(
                  padding: const EdgeInsets.all(0),
                  minWidth: 10,
                  splashColor: const Color.fromARGB(255, 12, 146, 46),
                  onPressed: () {
                    setState(() {
                      if (product.codeProd.isNotEmpty &&
                          product.codeProd == codeProd) {
                        // _incrementCounter();
                        //quantityProd();
                        //  sss
                        // cartItemCount[index]++;
                        // cart.addItem(product,product.id,product.codeProd.toString(), product.price.toDouble() ,product.description, product.imageURL,index, cartItemCount);
                        //   cart.cartItemIncrement(product,index, cartItemCount,cartItemsProvider,quantityProdCart);

                        //  cart.getItemsFromLocalstorage(product.codeProd, _cartItems);

                        cart.addItemCart(product,index);
                      //  cart.cartItemIncrement(product,index, cartItemCount,quantityXArticlesAdd,cartItemsProvider);

                        // save data item to local storage
                        cart.cartAddItemsToLocalStorage(product.codeProd.toString(),cartItems);

                        //save data database sqlLite
                        //   cart.getConfigurationSqlLite();

                        //conectionDbSqlLite();

                        //  connectionSqlLite.connectionDb();

                        ///    dbconnectSqLite.database_sqlite;

                        List listQty= _cartItems.values.toList();

                        // retrieve items cart
                        cart.getItemsCart();


                        // final listQty = _cartItems.values.toList(growable: false);

                        /*    for (var listQty in cartItemCount) {
                     //ok     quantityXArticles  =  cart.getQuantityXArticles(index,codeProd, listQty);

                           //quantityXArticles  =  cart.getQuantityXArticles(index,codeProd, _cartItems.values.toList());
                           quantityXArticlesAdd.clear();
                           quantityXArticlesAdd.add(cartItemCount.length);


                           quantityXArticlesAdd  =  cart.getQuantityXArticlesAdd(index,codeProd, cartItemCount.toList());
                       }
                           */


                        // 1.  call _cartItems and add all Items element class cart_provid

                        /*  cart.addItem(
                            product.codeProd,
                            product.price.toDouble(),
                            product.name,
                            product.imageURL);

                            */
                        //cart?.quantity;

                        // totalPrice == totalPrice + product.price;
                        //totalPrice == cart.subTotalPrice;
                        // quantyProdToAdd++;
                      } else {
                        singleProdItemCount;
                      }
                      // cartItemCount++;
                      // totalPrice = totalPrice + product.price;
                    });
                  },
                  shape: const CircleBorder(),
                  child: const Icon(
                    //Icons.add_shopping_cart,
                    Icons.add_circle,
                    color: Color.fromARGB(255, 46, 126, 59),
                    size: 30,
                  ),
                ),

              ],
            ),
          ]),
        ),
      ),
    );
  }

  void _handleTap(int index, List listTab) {
    //assert(index >= 0 && index < widget.tabs.length);
    assert(index >= 0 && index < listTab.length);
    _controller!.animateTo(index);
    widget.onTap?.call(index);
  }

  void buildController(int index) {
    // Create TabController for getting the index of current tab
    _controller = TabController(length: listTab.length, vsync: this);

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
      //   print("Selected Index: " + _controller.index.toString());

      // IDENTIFICATION TAB
      // var indexTab = _controller!.index.toString();
      //
      // switch (indexTab) {
      //   case '0':
      //     tabName = AppLocalizations.translate('fruitsVegetables').toString();
      //     break;
      //   case '1':
      //     tabName = AppLocalizations.translate('fruits').toString();
      //     break;
      //   case '2':
      //     tabName = AppLocalizations.translate('vegetables').toString();
      //     break;
      //   default:
      // }
    });
  }

  void buildTabController(int index) {}

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
}
