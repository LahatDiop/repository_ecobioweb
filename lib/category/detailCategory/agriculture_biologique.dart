import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecobioweb/cart/widgets/item_counter_widget.dart';
import 'package:ecobioweb/category/components/gestion_agriculture_bio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cart/cart.dart';
import '../../cart/widgets/chart_item_widget.dart';
import '../../helpers/column_with_seprator.dart';
import '../../products/components/product.dart';
import '../../products/screen/product_view.dart';
import '../../providers/cart_provider.dart';
import '../../settings/localisation/translation/components/appLocalizations.dart';
import '../../settings/payment/screens/payment.dart';
import '../../shopping/screens/cart_screen.dart';
import '../../shopping/screens/shopping_cart_screen.dart';
import '../../utils/theme/app_theme.dart';



class AgricultureBiologique extends StatefulWidget {
  static List<Product> cartItemsProducts = [];
  Map<String, Product> cartItems = {};
  ///********************************************************************************
  static Map<String, Product> cartItemsMap=CartScreen.cartItemsMap;

  ///********************************************************************************

  // static List<Product> productItems = [];
  static List<int> cartItemCount = [];
  static List<int> amounts = [];

  final Function? onAmountChanged;

  AgricultureBiologique({Key? key,  this.item, this.onAmountChanged,  GestionAgricultureBio? gestionAgriBio}) : super(key: key);

  late final Product? item;

  @override
  _AgricultureBiologiqueState createState() => _AgricultureBiologiqueState();
}

class _AgricultureBiologiqueState extends State<AgricultureBiologique>
    with TickerProviderStateMixin {

  ///**********************************************************************************
                                       ///Agriculture Bio
  /// List<dynamic> cartItemsList = [];
  List<dynamic>? productItemsList =  GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsList;

  Map<String, Product>? productItemsMap=GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsMap;
  ///**********************************************************************************

  ///********************************************************************************
                                   /// Cart_screen
  ///Map<String, Product>  cartItemMap= AgricultureBiologique.cartItemsMap;
  CartScreen cartScreen = const CartScreen();
  ///********************************************************************************

  ItemCounterWidget itemCounterWidget =   const ItemCounterWidget();

  List<Product> listProductItemsCart= AgricultureBiologique.cartItemsProducts;

  //List<int> cartItemCount= AgricultureBiologique.cartItemCount;
  List<int> amounts=   AgricultureBiologique.amounts;

  /// list product agriculture bio
  // List<dynamic> productItems = [];
  List<dynamic> cartItems = [];
  final Future<SharedPreferences> _prefs=SharedPreferences.getInstance();

  List<int>  productsItemCount = [];

  bool isLoadedlistProduct= true;

  List numberOfItems = <int>[];

  // FILTRE THE LIST MARKET ENABLED
  // List countryEnabled = [];

  int singleProdItemCount = 0;
  bool flagItemEnabled = true;

  // TabController? _controller;
  late TabController? _controller;
  int _selectedIndex = 0;

  // The key of the list
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  double totalPrice = 0;
  int amount =0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);



  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    // Create TabController for getting the index of current tab
    ///Implement the list tab of controller
    _controller = TabController(length: tabs.length, vsync: this);

    ///  DataLoader dataLoader= const DataLoader();
    // fetchItems(indexTab, flagItemEnabled).whenComplete(() => setState(() {}));
    fetchItems(flagItemEnabled).whenComplete(() => setState(() {}));
    // super.initState();
  }


  Future<void> fetchItems(bool flagItemEnabled) async {

    ///  productItems = data['products'].map((data) => Product.fromJson(data)).toList();

    // productsItemCount.add(cartItemsList.length);
    for(var i in productItemsList!){
      /// ok productsItemCount.add(i.quantity);
      productsItemCount.add(0);
      /// ADD 0 EVIRY ELEMENT TO THE LIST PRODUCT
     /// cartItemCount.add(0);
      amounts.add(0);

    }
    /// Arrivo dalla home Tab default = 0 Fruits and Vegetable
    recalculateElementTab(_controller!.index);

    /// CALCULATED TOTAL PRICE
    // sumTotal();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            print('The Tab has changed :)');

            recalculateElementTab(tabController.index);
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom:  TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                // child: Column(
                ///  children: [
                // Column(
                //  children: [
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //SearchWidget(),
                      // SizedBox(
                      //   height: 2,
                      //   child: Container(
                      //     color: const Color(0xFFf5f6f7),
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: MediaQuery.of(context).size.height * 0.35,

                        child:  productItemsList!.isNotEmpty?
                        // FadeAnimation(
                        //     1.4,
                        AnimatedList(
                            scrollDirection: Axis.vertical,
                            /// Number of element into the list mandatory , if you would show all element in the list
                            initialItemCount: productItemsList!.length,
                            //   initialItemCount: productsItemCount.length,
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
                                        //totalPrice = totalPrice - (int.parse( productItemsList![index].price.toString()) * productsItemCount[index]);

                                        AnimatedList.of(context).removeItem(
                                            index, (context, animation) {
                                          return  Column(
                                            children: getChildrenWithSeperator(
                                              addToLastChild: false,
                                              /// widgets: demoItems.map((e) {
                                              // widgets: cartItems.asMap().entries.map((e){
                                              //   int index =e.key;
                                              //   var indexNew=cartItems.indexOf(e.value);
                                              //   var index2=e.key;
                                              //   var value =e.value;
                                              //   //Product product=e.value;
                                              //
                                              //   return Container(
                                              //     padding:  const EdgeInsets.symmetric(
                                              //       horizontal: 25,
                                              //     ),
                                              //     width: double.maxFinite,
                                              //     child: ChartItemWidget(
                                              //       item:e.value,
                                              //      // index: [e.key],
                                              //       /// amount: const [],
                                              //     ),
                                              //   );
                                              // }).toList(),

                                              // widgets: cartItems.asMap().entries.map<Widget>((e){
                                              //   int index =e.key;
                                              //   Product product=e.value;
                                              //   return Container(
                                              //     padding:  const EdgeInsets.symmetric(
                                              //       horizontal: 25,
                                              //     ),
                                              //     width: double.maxFinite,
                                              //     child: ChartItemWidget(
                                              //       item:e.value,
                                              //       index: const [],
                                              //       amount: const [],
                                              //     ),
                                              //   );
                                              // }).toList(),

                                              //    widgets: cartItemsMap.values.toList().map((e){
                                              widgets:  productItemsList!.map((e) {
                                                /// var indexNew=cartItems.indexOf(e);
                                                // var index2=e.key;
                                                // var value =e.value;
                                                return Container(
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: 25,
                                                  ),
                                                  width: double.maxFinite,
                                                  child: ChartItemWidget(
                                                    item: e,
                                                    index:index,

                                                    /// index: cartItemCount,
                                                    /// amount: amount,
                                                    /// amount:amount ,
                                                  ),
                                                );
                                              }).toList(),

                                              seperator: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 25,
                                                ),
                                                child: Divider(
                                                  thickness: 1,
                                                ),
                                                // getCheckoutButton(context)
                                              ),
                                            ),
                                          );
                                          // return cartItem(
                                          //      productItemsList![index],
                                          //     // cart!,
                                          //     index,
                                          //      productItemsList![index].codeProd,
                                          //     productsItemCount[index].toInt(),
                                          //    /// quantity.toInt(),
                                          //    // _counter,
                                          //     animation);
                                        });
                                        //  singleProdItemCount.removeAt(index);

                                        //  productItemsList!.removeAt(index);
                                        // productsItemCount.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                                child: cartItem(
                                    productItemsMap!,
                                     productItemsList![index],
                                    //cart!,
                                    index,
                                     productItemsList![index].codeProd,
                                    productsItemCount[index].toInt(),
                                    // quantity,
                                    //_counter,
                                    animation
                                ),

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

                      const SizedBox(height: 10),

                      /** Button go to home **/

                      /** Button go to home **/
                      /// FadeAnimation(1.4,
                      MaterialButton(
                        height: 50,
                        elevation: 0,
                        splashColor: Colors.yellow[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.green.shade700,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingCartScreen()));
                        },
                        child: const Center(
                          child: Text(
                            "Cart",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      MaterialButton(
                        height: 50,
                        elevation: 0,
                        splashColor: Colors.indigoAccent[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.green.shade700,

                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
                              ));
                        },
                        child: const Center(
                          child: Text(
                            "CartScrene",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),


                      const SizedBox(height: 10),
                      MaterialButton(
                        onPressed: () {
                          onCleanItemCartClicked(context, listProductItemsCart);
                        },

                        height: 50,
                        elevation: 0,
                        splashColor: Colors.indigoAccent[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.yellow[800],
                        child: const Center(
                          child: Text(
                            "Clean Cart",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),

                      // ),
                      //  FadeAnimation(
                      //      1.3,
                      Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DottedBorder(
                                    color: Colors.grey.shade400,
                                    dashPattern: const [10, 10],
                                    padding: const EdgeInsets.all(0),
                                    child: Container()),
                                //)
                              ),
                            ],
                          ),
                        ],
                      ),
                      // FadeAnimation(
                      //     1.3,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Total :', style: TextStyle(fontSize: 20)),
                            // Text('\$${totalPrice.toDouble() + 8.99}',
                            Text('\$${8.99}',
                                style: TextStyle(
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


                      const SizedBox(
                        height: 5.0,
                      ),

                    ]
                ),
                //  ],
                //  ),
                // ],
                // ),

              );

              // return Center(
              //   child: Text(
              //     '${tab.text!} Tab',
              //     style: Theme.of(context).textTheme.headlineSmall,
              //   ),
              // );
            }).toList(),
          ),
        );
      }),
    );
  }


  //Widget cartItem(Product product, Cart cart, int index, String codeProd,
  Widget cartItem(Map<String,Product>  productItemsMap, Product product, int index, String codeProd, int quantity, Animation<double> animation) {
    // Cart cart_provider;
    return GestureDetector(
      onTap: () {
        /// Add implemnent ProductViewPage
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductViewPage(product: product, quantity:productsItemCount[index]))
        );
        /// Add implement product into the ShoppingCardScreen
        //  Navigator.push(
        //      context,
        //      MaterialPageRoute(
        //          builder: (context) => ShoppingCartScreen(product: product, quantity:productsItemCount[index], cartItems:  productItemsList![index]))
        //  );

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
                      product.brand,
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


            Column(
              // REMOVED DELETE PRODOCT FROM  LIST
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  minWidth: 10,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      amounts[index]--;
                      int newAmount= amounts[index];

                      decrementAmount(index, product, newAmount);

                      totalPrice == totalPrice - product.price;
                      //}
                    });
                    //  productItemsList!.removeAt(index);
                    //productsItemCount.removeAt(index);
                  },
                  shape: const CircleBorder(),
                  child: const Icon(
                    // Icons.delete,
                    Icons.remove_circle_outline,
                    // color: Color.fromARGB(255, 144, 133, 133),
                    size: 30,
                  ),
                ),

                /// QUNTITY PRODUCT
                Container(
                    child: itemCounterWidget.createState().getText(

                      ///   text:  product.quantity.toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
                      // text:  amount.toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
                        text: amounts[index].toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
                      // text: productsItemCount[index].toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
                    )

                ),

                ///>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
                const SizedBox(width: 18),
                itemCounterWidget.createState().iconWidget(Icons.add, iconColor: AppColors.primaryColor,  index:index,
                    onPressed:(){
                      setState(() {
                        // int newAmount= amounts[index];
                        int newAmount= product.quantity;
                        incrementAmount(index, product,newAmount);
                      });
                    }
                ),

              ],
            ),
          ]),
        ),
      ),
    );
  }


  // check() {
  //   for (var value in  productItemsList!) {
  //     // productsItemCount.add( productItemsList!.length);
  //     productsItemCount.add( productItemsList!.length);
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
  //   for (var value in  productItemsList!) {
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
    for (var item in productItemsList!) {
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
    _controller!.animateTo(index);
    // widget.onTap?.call(index);
  }

  void buildController(int index) {
    // Create TabController for getting the index of current tab
    _controller = TabController(length: listTab.length, vsync: this);

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
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

  Future <void> saveIcrementCounter(List<dynamic> cartItemsList,  Map<String, Product> productItemsList) async {
    final SharedPreferences prefs=await _prefs;


    ///***************************************************************************************
    /// OK Convert List<dynamic> product to list<String> and save the list into the shredPreference

    List<String> pro = cartItemsList.map((i) => i.toString()).toList();
    prefs.setStringList("pro", pro);

    List<String>? elementProd  = prefs.getStringList("pro");

    ///***************************************************************************************
    //--------------------------------------------------------------------------

    /// List<dynamic> ====> List<String>
    List<Map<String, dynamic>> mapsProd =  <Map<String, dynamic>>[];

    List<String> cartItemsListDynamic=cartItemsList.map((i) => i.toString()).toList();


    prefs.setStringList('cartItemsListDynamic', cartItemsListDynamic);

    List<String>? cartItemsDynamic  = prefs.getStringList("cartItemsListDynamic");


    // List<String> ggg = productItems.;

    // List<String> li = productItems.map((i) => Product.fromJson(i)).toList();
    // String? elementProd  = prefs.getString("pro");

    //  Map prodMap =jsonDecode(Product.fromJson(elementProd as Map<String, dynamic>).toJson() as String);

    //--------------------------------------------------------------------------



    // prefs.setStringList('dataProductItems', dataProductItems.values.toList().toString() as List<String>);

    //prefs.getStringList(dataProductItems);

    //Save list
    List<dynamic> listCartItemsList=productsItemCount.map((i) => i.toString()).toList();

    /// New List Steing form List Dynamic
    // List<String> listCartItemsLists=cartItemsList.map((i) => i.toString()).toList();
    String listCartItemsLists= jsonEncode(cartItemsList);
    prefs.setString('listCartItemsLists', listCartItemsLists);
    // prefs.setStringList('listCartItemsLists', listCartItemsLists);

    // save Map
    // prefs.setStringList('cartItemsList', productItems);



    /// final int  counter  =(prefs.getInt('counter') ?? 0)+ 1;
    int counter=0;
    prefs.setInt('counter' ,counter);

    //   prefs.setStringList('cartItemsList', cartItemsList);

    // setState(() {
    //   _counterQuantity=prefs.setInt('counter', counter).then((bool success){
    //     return _counterQuantity;
    //   });
    // });

  }



  Future<int> getQuantityFromPrefs() async{
    var prefs= await SharedPreferences.getInstance();

    List<String>? elementProd  = prefs.getStringList("pro");


    // int? counter=prefs.getInt('counter');

    ///Ok int?  counter  =(prefs.getInt('counter') ?? 0)+ 1;
    int?  counter  =prefs.getInt('counter')!+1;
    prefs.setInt('counter', counter);


    List<String>? getListFromShared = prefs.getStringList('cartItemsList');
    List<dynamic>? getListFromShared2 = prefs.getStringList('cartItemsList');

    List<dynamic> listCartItemsList=productsItemCount.map((i) => i.toString()).toList();

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

  List<Tab> tabs = <Tab>[
    Tab(text: AppLocalizations.translate('fruitsVegetable').toString()),
    Tab(text: AppLocalizations.translate('fruits').toString()),
    Tab(text: AppLocalizations.translate('vegetables').toString()),
  ];


  void recalculateElementTab(int tabIndex) {

    // Arrivo dalla home Tab default = 0 Fruits and Vegetable
    // TAB_0 --> FRUITS  AND VEGETABLE
    if (tabIndex == 0) {

      /// productItemsList.clear();
      for (var i in productItemsList!) {
        productItemsList?.add(i);

        /// 1- ADD PRODUCT INTO THE CART
        Cart().addItemCart(i, tabIndex);

      }


      //flagItemEnabled = false;
    } else
      // TAB_1 --> FRUITS
    if (tabIndex == 1) {
      productItemsList?.clear();
      for (var i in productItemsList!) {
        if (i.category.toString().toLowerCase() ==
            AppLocalizations.translate('fruits').toString().toLowerCase()) {
          productItemsList?.add(i);
          // category = i.category.toString().toLowerCase();
        }
      }

    } else {
      // TAB_0 --> VEGETABLE
      if ( tabIndex ==2) {
        productItemsList?.clear();
        for (var i in productItemsList!) {
          if (i.category.toString().toLowerCase() ==
              AppLocalizations.translate('vegetables').toString().toLowerCase()) {
            productItemsList?.add(i);
            // category = i.category;
          }
        }

      }
    }

  }

  void onCategoryItemClicked(BuildContext context) {
    Navigator.of(context).push( MaterialPageRoute(
      builder: (BuildContext context) {
        return ShoppingCartScreen();
      },
    ));
  }

  void onCleanItemCartClicked(BuildContext context, List<Product> listProductItemsCart,) {
    listProductItemsCart.clear();
    //cartItemCount.clear();
    amounts.clear();
    //amountProductMap?.clear();
    productItemsMap!.clear();
  }

  void incrementAmount(int index, Product product, newAmount) {

    amounts[index]++;
    newAmount=newAmount+1;
    ///---------------------------------------------------------------------------------------
    /// 1- ADD PRODUCT INTO THE CART
    cartScreen.createState().addItemCart(product, index);

    /// 2- INCREMENT PRODUCT QUANTITY INTO THE CART
    cartScreen.createState().incrementItemCart(product, index) ;

    /// MAP
   // amountProductMap?.putIfAbsent(product, () => amounts[index]);

    ///3 UPDATE PRODUCTS LIST INTO THE CART_SCREEN
    if(!listProductItemsCart.contains(product)){
      listProductItemsCart.add(product);
    }
    /// 4- UPDATE AMOUNTS CART_SCREEN

    itemCounterWidget =   ItemCounterWidget(index:index, amount: newAmount, product: product);
    itemCounterWidget.createState().incrementAmount(newAmount,product) ;
    /// itemCounterWidget.createState().updateParent(newAmount, product);
    ///---------------------------------------------------------------------------------------



    // cart.addItemCart(product,index, cartItemCount);
    // cart.cartItemIncrement(product,index, cartItemCount,quantityXArticlesAdd,cartItemsProvider);

    // save data item to local storage
    /// cart.cartAddItemsToLocalStorage(product.codeProd.toString(),cartItems);


    /// updateParent(index);


  }

  void decrementAmount(int index, Product product, newAmount) {

    //amounts[index]--;

    ///---------------------------------------------------------------------------------------
    /// 1- REMOVE PRODUCT INTO THE CART
    /// cartScreen.createState().deleteItemCart(product, index, cartItemCount);

    /// 2- REMOVE PRODUCT QUANTITY INTO THE CART
    cartScreen.createState().decrementItemCart(product, index) ;

    /// MAP
    /// amountProductMap?.putIfAbsent(product, () => amounts[index]);

    ///  !!! 3 UPDATE PRODUCTS LIST INTO THE CART_SCREEN
    // TODO @ Check if you delete product X from cart_screen
    // if(!listProductItemsCart.contains(product)){
    //   listProductItemsCart.add(product);
    // }
    /// 4- UPDATE AMOUNTS CART_SCREEN

    itemCounterWidget =  ItemCounterWidget(index:index,amount: amount, product: product);
    itemCounterWidget.createState().decrementAmount(newAmount,product) ;

    ///---------------------------------------------------------------------------------------


    // cart.addItemCart(product,index, cartItemCount);
    // cart.cartItemIncrement(product,index, cartItemCount,quantityXArticlesAdd,cartItemsProvider);

    // save data item to local storage
    /// cart.cartAddItemsToLocalStorage(product.codeProd.toString(),cartItems);

    /// updateParent(index);

  }





}




