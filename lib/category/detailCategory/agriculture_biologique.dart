import 'dart:collection';
import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecobioweb/cart/widgets/item_counter_widget.dart';
import 'package:ecobioweb/products/screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cart/cart.dart';
import '../../cart/widgets/chart_item_widget.dart';
import '../../helpers/column_with_seprator.dart';
import '../../products/components/product.dart';
import '../../products/screen/product_view.dart';
import '../../providers/cart_provider.dart';
import '../../settings/localisation/translation/components/appLocalizations.dart';
import '../../settings/payment/screens/payment.dart';
import '../../shopping/screens/shopping_cart_screen.dart';
import '../../utils/theme/app_theme.dart';



class AgricultureBiologique extends StatefulWidget {
 static List<Product> cartItemsProducts = [];
  ///static List<String> cartItemsProducts = [];
 static List<int> cartItemCount = [];
  static List<int> amounts = [];
  static List<int> indexList = [];
 ///static Map<int, Product> amountProductMap = HashMap();
 static Map<int, Product> amountProductMap = <int, Product>{};

 static  HashMap <int, Product> amountProductHashMap =HashMap<int, Product>();

 final Function? onAmountChanged;

 // static int amount=0;

// static List? cartItems = ShoppingCartScreen().cartItems;

  const AgricultureBiologique({Key? key, this.onAmountChanged}) : super(key: key);



  //late List<Widget> tabs;
  //ValueChanged<int>? onTap;



  @override
  _AgricultureBiologiqueState createState() => _AgricultureBiologiqueState();
}

class _AgricultureBiologiqueState extends State<AgricultureBiologique>
    with TickerProviderStateMixin {
  //map lista product from json
  final Map <int, Product> _productItems={};



  /// get list products into the cart
//  List<dynamic> cartItems = [];

 // List<dynamic>? cartItems =ShoppingCartScreen().cartItems;
 //  Product? productCart=ShoppingCartScreen().product;
 //  int? quantityCart = ShoppingCartScreen().quantity;
  List<Product> listProductItemsCart= AgricultureBiologique.cartItemsProducts;
  List<int> cartItemCount= AgricultureBiologique.cartItemCount;
  List<int> amounts=   AgricultureBiologique.amounts;
  List<int> indexList=   AgricultureBiologique.indexList;
  Map<int, Product> amountProductMap=AgricultureBiologique.amountProductMap;

  HashMap <int, Product> amountProductHashMap=AgricultureBiologique.amountProductHashMap;

  /// list product agriculture bio
  List<dynamic> productItems = [];
  List<dynamic> cartItems = [];



  List<dynamic> cartItemsList = [];
  List<dynamic> cartItemsListPrice = [];
  List<dynamic> cartItemsListQuantity = [0];
  int elementList=0;
  int quantity = 0;
  int _counter=0;
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


     ///List<int> cartItemCount = [];
     List<int>  productsItemCount = [];


final Future<SharedPreferences> _prefs=SharedPreferences.getInstance();


  // List<Map<String, dynamic>> mapsCartItemCount =  <Map<String, dynamic>>[];


  bool isLoadedlistProduct= true;

  List numberOfItems = <int>[];

  // late List<CartItem> products;
  //  List<CartItem> products=[];
  List<Product> productssss=[];

  // FILTRE THE LIST MARKET ENABLED
  List countryEnabled = [];

  int singleProdItemCount = 0;
  bool flagItemEnabled = true;

  // TabController? _controller;
  late TabController? _controller;
  int _selectedIndex = 0;
  // late String category;

  String? tabName = "";

  // The key of the list
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  double totalPrice = 0;

  //List<Map<String, dynamic>> cart = [];
  Cart cart = Cart();

  ///ConnectionSqlLite connectionSqlLite = ConnectionSqlLite();
  ///DbConnectionServices dbconnectSqLite=DbConnectionServices();

  /// Map cart quantity product
  final Map<String, CartItem> _cartItemsProd = {};

  // int? amount = AgricultureBiologique.amount;
// int amount=0;

  ItemCounterWidget itemCounterWidget =  const ItemCounterWidget();

  var product;

  int index =0;

  int amount=0;



  Map<String, CartItem> get cartItemsProvider {
    return {..._cartItemsProd};
  }

  // checkTest() {
  //   for (var value in productItems) {
  //     // cartItemCount.add(productItems.length);
  //    // cartItemCount.add(productItems.length);
  //
  //     _cartItemsProd.forEach((key, productItems) {
  //       _cartItemsProd.values.map((e) => productItems);
  //     });
  //
  //     cart!.productItems.addAll(_cartItemsProd);
  //     _incrementCounter();
  //   }
  // }

  late List<int>  getQuantityXArticles ;
  int quantityProduct =0;

  //  List<int>?  quantityXArticlesAdd = <int>[];
 // List<int> quantityXArticlesAdd = [0, 0, 0, 0, 0, 0, 0, 0];
  //int _selectedIndex = 0;
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
    super.initState();
  }


  Future<void> fetchItems(bool flagItemEnabled) async {


    // Disabled flagItemEnabled per evitare di caticare la lista json per ogni click
    // flagItemEnabled = false;

   // if(cartItemsList.isEmpty){
      final String response =
      await rootBundle.loadString('assets/json/products.json');
      final data = await json.decode(response);

      cartItemsList = data['products'].map((data) => Product.fromJson(data)).toList();


          // productsItemCount.add(cartItemsList.length);
      for(var i in cartItemsList){
        /// ok productsItemCount.add(i.quantity);
           productsItemCount.add(quantityProduct);
           /// ADD 0 EVIRY ELEMENT TO THE LIST PRODUCT
           cartItemCount.add(0);
           amounts.add(0);
          ///indexList.add(index++);
           ///indexProd.add(0);
          ///productsItemCount.add(i);
      }

       /// Map products
      // _productItems;


       int amountProduct= 0;
      // ADD THE LIST OF PRODUCTS INTO THE MAP PRODUCT LIST
      for (var product in cartItemsList) {
        addListProductItems(amountProduct, product);
      }

      /// inizializza counter quantity equals 0 on init
      //saveIcrementCounter(cartItemsList,_productItems);

      /// !!!   productsItemCount.add(cartItemsList.length);
      // check();
   // }

  ///  calculateElementTab(_controller!.index);

     recalculateElementTab(_controller!.index);

    // // // Arrivo dalla home Tab default = 0 Fruits and Vegetable

    // generateCodeProd();
    // CALCULATED TOTAL PRICE
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
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Column(
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
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    height: MediaQuery.of(context).size.height * 0.56,

                                    child: productItems.isNotEmpty?
                                    // FadeAnimation(
                                    //     1.4,
                                    AnimatedList(
                                        scrollDirection: Axis.vertical,
                                        /// Number of element into the list mandatory , if you would show all element in the list
                                        initialItemCount: productItems.length,
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

                                                    //totalPrice = totalPrice - (int.parse(productItems[index].price.toString()) * productsItemCount[index]);
                                                    //   totalPrice = totalPrice - (int.parse(singleProdItemCount[index].price.toString()) * singleProdItemCount[index]);
                                                    ///   totalPrice = totalPrice -(int.parse(productItems[index].price.toString()) *  productsItemCount[index]);

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

                                                              widgets: productItems.map((e) {
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
                                                      //     productItems[index],
                                                      //     // cart!,
                                                      //     index,
                                                      //     productItems[index].codeProd,
                                                      //     productsItemCount[index].toInt(),
                                                      //    /// quantity.toInt(),
                                                      //    // _counter,
                                                      //     animation);
                                                    });
                                                    //  singleProdItemCount.removeAt(index);

                                                   // productItems.removeAt(index);
                                                   // productsItemCount.removeAt(index);
                                                  });
                                                },
                                              ),
                                            ],
                                            child: cartItem(
                                                productItems[index],
                                                //cart!,
                                                index,
                                                productItems[index].codeProd,
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShoppingCartScreen(amountProductMap: amountProductMap)));
                              },

                              height: 50,
                              elevation: 0,
                              splashColor: Colors.yellow[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.yellow[800],
                              child: const Center(
                                child: Text(
                                  "Cart",
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
                          ],
                        ),
                      ],
                    ),

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
  Widget cartItem(Product product, int index, String codeProd, int quantity, Animation<double> animation) {


    // LIMITI THE LIST INDEX 12,12,.... OR productItems.length
    // List<int> productsItemCount = List<int>.generate(productItems.length, (index) => index + 1);

    // CLEAR THE LIST CARTCOUNTITEM EQUAL 0 IF NOTE SELECTED PRODOCT
    //List<int> productsItemCount =  List<int>.generate(productItems.length, (index) => index + 0);

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
       //          builder: (context) => ShoppingCartScreen(product: product, quantity:productsItemCount[index], cartItems: productItems[index]))
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
            Column(
              // REMOVED DELETE PRODOCT FROM  LIST
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  minWidth: 10,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                    //  if (productsItemCount[index] >= 1) {

                       /// productsItemCount[index]--;
                      //  amount[index]--;
                        ////itemCounterWidget.amount =productsItemCount[index];
                        ///  amount=productsItemCount;

                        int newAmount= amounts[index];
                        int newAmountCount= productsItemCount[index];


                        // cartItemCount.add(newAmountCount);
                           amounts.add(newAmount);

                        // amountProductMap.putIfAbsent(newAmount, () => product);

                        ///---------------------------------------------------------------------------------------
                             itemCounterWidget.createState().decrementAmount(index) ;
                        quantity =productsItemCount[index].toInt();

                        totalPrice == totalPrice - product.price;
                      //}
                    });
                    // productItems.removeAt(index);
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
                        text: amounts[index].toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
                        // text: productsItemCount[index].toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
                    )


                  // child: Center(
                  //   child: Text(
                  //       productsItemCount[index].toString(),
                  //     style:
                  //     TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  //     //  quantity_cart!.quantity.toString(),
                  //   ),
                  // ),
                ),

                ///>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
                const SizedBox(width: 18),
                itemCounterWidget.createState().iconWidget(Icons.add,
                    iconColor: AppColors.primaryColor,
                    index:index,
                    onPressed:(){
                      setState(() {

                      //       /// INCREMENTE
                     ///   productsItemCount[index]++;
                       // amount[index]++;
                        ////itemCounterWidget.amount =productsItemCount[index];
                       ///  amount=productsItemCount;

                        // int newAmount= amounts[index];
                        // int newAmountCount= productsItemCount[index];

///---------------------------------------------------------------------------------------
                      //  itemCounterWidget.createState().incrementAmount(index) ;
                           incrementAmount(index, product, amounts[index]);

                     //   quantity =productsItemCount[index].toInt();

                      ///  itemCounterWidget.createState().incrementAmount ;
                        /// ADD LIST PRODUCT  INTO THE CART
                        // if(!listProductItemsCart.contains(product)){
                        //   listProductItemsCart.add(product);
                        //   cartItemCount.add(newAmountCount);
                        // //  amount.add(newAmount);
                        //   amountProductMap.putIfAbsent(amounts, () => listProductItemsCart);
                        //
                        //   product.amountProducts?.putIfAbsent(newAmountCount, () => product);
                        //   product.amountProducts?.forEach((key, value) {
                        //     debugPrint('$key:$value');
                        //   });
                        // }else{
                        //   cartItemCount.add(newAmountCount);
                        //  // amount.add(newAmount);
                        //   amountProductMap.putIfAbsent(newAmount, () => product);
                        // }
                      });
                    }
                    ),

                // Container(
                //   child: Center(
                //     child: Text(
                //         productsItemCount[index].toString(),
                //      // quantityXArticlesAdd[index].toString(),
                //
                //       // cart.quantityProdCart.toString(),
                //       //cart!.quantity.toString(),
                //      // "10",
                //       style:
                //       TextStyle(fontSize: 20, color: Colors.grey.shade800),
                //       //  quantity_cart!.quantity.toString(),
                //     ),
                //   ),
                // ),

                // MaterialButton(
                //   padding: const EdgeInsets.all(0),
                //   minWidth: 10,
                //   splashColor: const Color.fromARGB(255, 12, 146, 46),
                //   onPressed: () {
                //     setState(() {
                //       /// list INT
                //       productsItemCount[index]++;
                //
                //
                //       ///quantity= productsItemCount[index].toInt();
                //       // quantityCart =productsItemCount[index].toInt();
                //       // productCart=productItems[index];
                //
                //
                //       cart.addItemCart(product, index, productsItemCount);
                //
                //       cart.cartItems.values.toList();
                //
                //       ///LIST PRODUCTI AGRICULTURE BIOLOGICA
                //          productItems;
                //       /// INDEX PRODUCT SELETED
                //          index;
                //         /// PRODUCT SELECTE
                //       productssss;
                //
                //          codeProd;
                //
                //       /// INCREMENTE
                //       cartItemCount[index]++;
                //       int newAmount =cartItemCount[index];
                //
                //
                //      amount=newAmount;
                //
                //        ///ItemCounterWidget(amount: amount);
                //
                //       /// ADD LIST PRODUCT  INTO THE CART
                //       if(!listProductItemsCart.contains(product)){
                //         listProductItemsCart.add(product);
                //       }
                //
                //
                //
                //       // for(var product in productItems){
                //       //   listProductItemsCart.add(product[index]);
                //       // }
                //
                //
                //       for(var i in productsItemCount){
                //         /// ok productsItemCount.add(i.quantity);
                //         cartItemCount.add(quantityProduct);
                //       }
                //
                //       // /// Add implement product into the ShoppingCardScreen
                //
                //       // if(!AgricultureBiologique.cartItemsProducts.contains(productItems[index])){
                //       //
                //       //   AgricultureBiologique.cartItemsProducts.add(productItems[index]);
                //       //  /// AgricultureBiologique.cartItemCount.add(productItems[index]);
                //       //
                //       // }else{
                //       //   AgricultureBiologique.cartItemCount.add(cartItemCount[index]);
                //       // }
                //
                //
                //       // AgricultureBiologique.cartItemsProducts = productItems;
                //
                //      // cartItems?.add(productItems[index]);
                //
                //       // ShoppingCartScreen().cartItems?.add(productCart);
                //
                //
                //     ///  productItemsCart.add(productCart);
                //
                //   ///    addListProductItems(productCart!);
                //
                //  ///     productItemsCart.add(productItems[index]);
                //
                //       // ShoppingCartScreen().cartItems?.add(Product.fromJson(productItems[index]));
                //
                //       // if(!productItemsCart.contains(productCart)){
                //       //      productItemsCart.add(productCart);
                //       //
                //       // }else{
                //       //   quantityCart=productItems[index];
                //       // }
                //
                //
                //      // Navigator.push(
                //     ///    ShoppingCartScreen(product: product, quantity:quantity, cartItems: cartItems);
                //       ///);
                //
                //       // Navigator.push(
                //       //     context,
                //       //     MaterialPageRoute(
                //       //         builder: (context) => ShoppingCartScreen(product: product, quantity:quantity, cartItems: productItems))
                //       // );
                //
                //     //  var newQuantitySession = getQuantityFromPrefs();
                //     //   _counterQuantity;
                //
                //
                //       // totalPrice = totalPrice + product.price;
                //       totalPrice = (totalPrice + product.price);
                //
                //
                //     });
                //   },
                //   shape: const CircleBorder(),
                //   child: const Icon(
                //     //Icons.add_shopping_cart,
                //     Icons.add_circle,
                //     color: Color.fromARGB(255, 46, 126, 59),
                //     size: 30,
                //   ),
                // ),
              ],
            ),
          ]),
        ),
      ),
    );
  }


  // check() {
  //   for (var value in productItems) {
  //     // productsItemCount.add(productItems.length);
  //     productsItemCount.add(productItems.length);
  //   }
  // }

  //void addListProductItems(Product product,int index, List<int> productsItemCount ) {

  void addListProductItems(int amount, Product product) {

    if (_productItems.containsKey(product.codeProd)) {

    } else {
      _productItems.putIfAbsent(
          amount,
         // product.codeProd,
              () => Product(
              product.id,
              product.codeProd,
              product.name,
              product.description,
              product.price,
              product.quantityStock,
              product.quantity,
              product.category,
              product.brand,
              product.brandModel,
              product.codeEan,
              product.codeQr,
              product.country,
              product.city,
              product.currency,
              product.kilometer,
              product.imageURL,
              product.image,
              product.datePublication,
              product.dateUpdate,
              product.isFavorite,
              product.isEnabled,
             /// product.amountProducts
              )
      );
    }

  }

  //  final Map<String, CartItem> _cartItemsProd = {};
  // checkTest() {
  //   for (var value in productItems) {
  //     // productsItemCount.add(productItems.length);
  //     productsItemCount.add(productItems.length);
  //
  //     _cartItemsProd.forEach((key, productItems) {
  //       _cartItemsProd.values.map((e) => productItems);
  //     });
  //
  //     cart!.productItems.addAll(_cartItemsProd);
  //     _incrementCounter();
  //   }
  // }

  sumTotal() {
    //productItems.forEach((item) {totalPrice = item.price + totalPrice;
    for (var item in productItems) {
      totalPrice = item.price + totalPrice;
    }
  }

  generateCodeProd() {
    for (var item in productItems) {
      codeProd = item.codeProd;
    }
  }

  getQuantityProd() {
    quantyProdToAdd++;
    quantyToAdd.add(quantyProdToAdd);

    // productsItemCount++;
    //  singleProdItemCount++;
    // productsItemCount.length++;
  }

  getQuantityProd22() {
    for (var item in productItems) {
      if (item.codeProd.isNotEmpty && item.codeProd == codeProd) {
        quantyProdToAdd = quantyProdToAdd++;
        quantyToAdd.add(quantyProdToAdd);

        // productsItemCount++;
        singleProdItemCount++;
        // productsItemCount.length++;

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

  Future <void> saveIcrementCounter(List<dynamic> cartItemsList,  Map<String, Product> productItems) async {
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

  void calculateElementTab(int tabIndex) {

    // Arrivo dalla home Tab default = 0 Fruits and Vegetable
    // TAB_0 --> FRUITS  AND VEGETABLE

      for (var i in cartItemsList) {
        productItems.add(i);
      }
      elementList=productItems.length;

      //flagItemEnabled = false;


  }


  void recalculateElementTab(int tabIndex) {

    // Arrivo dalla home Tab default = 0 Fruits and Vegetable
    // TAB_0 --> FRUITS  AND VEGETABLE
    if (tabIndex == 0) {

      /// productItems.clear();
      for (var i in cartItemsList) {
        productItems.add(i);
          ///int index = cartItemsList.indexOf(i, 0);
         /// indexList.add(cartItemCount);
      }


      elementList=productItems.length;

      //flagItemEnabled = false;
    } else
      // TAB_1 --> FRUITS
    if (tabIndex == 1) {
      productItems.clear();
      for (var i in cartItemsList) {
        if (i.category.toString().toLowerCase() ==
            AppLocalizations.translate('fruits').toString().toLowerCase()) {
          productItems.add(i);
          // category = i.category.toString().toLowerCase();
        }
      }
      elementList=productItems.length.bitLength;
    } else {
      // TAB_0 --> VEGETABLE
      if ( tabIndex ==2) {
          productItems.clear();
        for (var i in cartItemsList) {
          if (i.category.toString().toLowerCase() ==
              AppLocalizations.translate('vegetables').toString().toLowerCase()) {
            productItems.add(i);
            // category = i.category;
          }
        }
        elementList=productItems.length;
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
    cartItemCount.clear();
    amounts.clear();
    amountProductMap.clear();
  }

  void incrementAmount(int index, Product product, newAmount) {

    amount= (newAmount + 1);
    amounts[index] = amount;

    if(!listProductItemsCart.contains(product)){
      listProductItemsCart.add(product);
      /// amountProductMap.putIfAbsent(amount, () => product);
      // if (amountProductMap.containsKey(product)) {
      //       amount;
      //       product;
      // } else {
      //     amountProductMap.putIfAbsent(amount, () => product);
      // }
      // amountProductHashMap.addAll(<amount,product>);



       // debugPrint(listProductItemsCart as String?.toList());
    }

    amountProductMap.putIfAbsent(index, () => product);


       updateParent(index);

  /// / getAmountProductMap();

   /// getQuantityXArt(index, product.codeProd);


   // indexCartProd= amounts[index];
   // indexList.add(amounts[index]);
    // index.add(amount[indexProd]);
    /// updateParent(indexProd);
    // updateParent();
    // //setState(() {
    //   for (var amountCart in AgricultureBiologique.amount){
    //     if(amountCart==index){
    //        amount[index] = (amount[index] + 1);
    //      // updateParent();
    //     }
    //   }
    //   // amount = (amount + 1);
    //   // updateParent();
    // //});
  }


  void decrementAmount(int indexProd) {

    amount= (amount - 1);



    if(!listProductItemsCart.contains(product)){
      listProductItemsCart.add(product);
      amountProductMap.putIfAbsent(amount, () => product);
     }
      // else{
    //   // amountProductMap.putIfAbsent(amount, () => product);
    //   amountProductMap.updateAll((amount, value) => product);
    // }

    updateParent(index);


    // amounts[indexProd] = (amounts[indexProd] - 1);
    //
    // indexList.add(amounts[indexProd]);
    ///index.add(amount[indexProd]);
    /// updateParent(indexProd);
    // setState(() {
    //   for (var amountCart in AgricultureBiologique.amount ){
    //     if(amountCart==indexProd){
    //       amount[indexProd] = (amount[indexProd] - 1);
    //      // updateParent();
    //     }
    //   }
    // amount = (amount - 1);
    // updateParent();
    // });
  }

  /// getItem into the cart
  Iterable<Product> getAmountProductMap(){
    amountProductMap.keys;
    return amountProductMap.values;
  }

  int getQuantityXArt(int index, String codeProd){
    // if (_cartItems.containsKey(codeProd) && _cartItems.values.toList().contains(index)) {
    var mapnews =amountProductMap.values.toList();

    if (amountProductMap.containsKey(codeProd)){
      amountProductMap.forEach((key, value) {
        int quantity = value.quantity;
      });
    }
    return quantity;
  }

  void updateParent(int index) {
    if (widget.onAmountChanged != null) {
      widget.onAmountChanged!(amounts[index]);
    }
  }

}




