
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../cart/components/cart_item.dart';
import '../../../../cart/provider/cart_provider.dart';
import '../../../../cart/screens/cart_screen.dart';
import '../../../../commun_data_utils/utils/theme/app_theme.dart';
import '../../../../localisation/translation/components/appLocalizations.dart';
import '../../../../products/components/product.dart';
import '../../../../products/screens/product_view.dart';
import '../provider/agriculture_biological_provider.dart';


///https://stackoverflow.com/questions/58908968/how-to-implement-a-flutter-search-app-bar/58909034#58909034

class AgricultureBiologiqueScreen extends StatefulWidget {
  static List<Product> cartItemsProducts = [];
  Map<String, Product> cartItems = {};

  // static List<Product> productItems = [];
  static List<int> cartItemCount = [];
  static List<int> amounts = [];

  final Function? onAmountChanged;

  AgricultureBiologiqueScreen({Key? key,  this.item, this.itemCart, this.onAmountChanged,  AgricultureBiologicalProvider? agricultureBiologicalProvider}) : super(key: key);

  final Product? item;
  CartItem? itemCart;

  @override

  _AgricultureBiologiqueState createState() => _AgricultureBiologiqueState();
}

class _AgricultureBiologiqueState extends State<AgricultureBiologiqueScreen> with TickerProviderStateMixin {
  ///class _AgricultureBiologiqueState extends State<AgricultureBiologiqueScreen> with SingleTickerProviderStateMixin   {

  List<Tab> tabs = <Tab>[
    Tab(text: AppLocalizations.translate('fruitsVegetable').toString()),
    Tab(text: AppLocalizations.translate('fruits').toString()),
    Tab(text: AppLocalizations.translate('vegetables').toString()),
  ];


  late TabController _tabController;

  List<dynamic> dataLoader = [];


  TextEditingController textInputSearch =  TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  Map<String, Product> productItems = {};

  List<Product> products = [];

  List<Product> productFilter=[];

  Map<String, CartItem> cartItems={};

  CartItem? itemCart;

  final double height = 110;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool isLoadedlistProduct = true;

  // FILTRE THE LIST MARKET ENABLED
  // List countryEnabled = [];

  bool flagItemEnabled = true;

  int _selectedIndex = 0;

  // The key of the list
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  double totalPrice = 0;
  int amount = 0;


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



  @override
  Widget build(BuildContext context) {
    ///  context.read<AgicultureBiologicalProvider>().getData();
    //  final CartProvider=Provider.of<CartProvider>(context);
    //   final gestionAgriculture =Provider.of<AgicultureBiologicalProvider>(context);
    // //
    // final  cartsList = CartProvider.cartItems;

    return MultiProvider(
      // providers: [],
        providers: [
          ChangeNotifierProvider(create: (_) => AgricultureBiologicalProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider())
        ],
        builder: (context, child) {

          final gestionAgriculture = Provider.of<AgricultureBiologicalProvider>(context);
          var dataAgri=  context.read<AgricultureBiologicalProvider>().getData(_tabController.index.toInt());
          // var dataAgri=  context.read<AgricultureBiologicalProvider>().getData();


          cartItems= context.read<CartProvider>().cartItems;

          products = context.read<AgricultureBiologicalProvider>().products;

          productItems=context.read<AgricultureBiologicalProvider>().productItems;

          // itemCart =context.read<CartProvider>().itemCart;

          return DefaultTabController(
            length: tabs.length,
            // The Builder widget is used to have a different BuildContext to access
            // closest DefaultTabController.
            child: Builder(builder: (BuildContext context) {
              TabController tabController = DefaultTabController.of(context);

              tabController.addListener(() {
                if (!tabController.indexIsChanging) {

                  // productFilter =productListFilter(tabController.index, products);
                  // products.clear();
                  // products= productFilter;

                  print('The Tab has changed agriculture BIO :)');

                  //  AgricultureBiologicalProvider().recalculateTabElement(tabController.index);
                  // Your code goes here.
                  // To get index of current tab use tabController.index
                }
              });
              return Scaffold(
                appBar: AppBar(
                  // backgroundColor: const Color.fromRGBO(250, 101, 243, 105),
                  backgroundColor: Colors.green,
                  toolbarHeight: 45.0,

                  title: TextField(
                    controller:textInputSearch ,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:  const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:  const BorderSide(color: Colors.white),
                          borderRadius:  BorderRadius.circular(25.7),
                        ),
                        /// hintText: "Search...",
                        hintText: AppLocalizations.translate("search_point"),
                        labelText: "",
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          color: const Color.fromRGBO(90, 25, 72, 1),
                          onPressed: () {
                            showSearch(context: context, delegate: DataSearch(products, textInputSearch.value.text.toString()));
                          },
                        )
                    ),
                    style: const TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  // backgroundColor: Colors.blueGrey,
                  ///Tabs
                  bottom: TabBar(tabs: tabs),
                ),

                body: TabBarView(
                  // controller: _tabController,

                  children: tabs.map((Tab tab) {

                    return Expanded(
                        child: Column(
                            //mainAxisSize: MainAxisSize.min,
                           // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              //SearchWidget(),
                              SizedBox(
                                height: 10,
                                child: Container(
                                  color: const Color(0xFFf5f6f7),
                                ),
                              ),

                          Expanded(
                              flex: 3,
                              child:  Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                // height: MediaQuery.of(context).size.height * 0.75,
                                height: MediaQuery.of(context).size.height * 0.70,
                                width: MediaQuery.of(context).size.width * 100,
                                // height: MediaQuery.of(context).size.height * 0.45,
                                child: products.isNotEmpty?
                                /// child: productFilter.isNotEmpty?

                                AnimatedList(
                                    scrollDirection: Axis.vertical,
                                    initialItemCount: products.length,
                                    itemBuilder: (context, index, animation) {
                                      return Slidable(
                                        // actionPane: const SlidableDrawerActionPane(),
                                        //secondaryActions: [
                                        groupTag: <Widget>[
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
                                                AnimatedList.of(context).removeItem(index,
                                                        (context, animation) {
                                                      return createProductList( index, products, productItems, products[index], cartItems,animation,context);
                                                    });

                                                // cartItems.removeAt(index);
                                                // cartItemCount.removeAt(index);
                                              });
                                            },
                                          ),
                                        ],
                                        child: createProductList( index, products, productItems, products[index], cartItems,animation,context),
                                      );
                                    })

                                    : Container(),
                              ),

                              ),
                              // const SizedBox(height: 10),
                              // Container(
                              //   padding: const EdgeInsets.symmetric(horizontal: 20),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: <Widget>[
                              //       const Text('Transport', style: TextStyle(fontSize: 20)),
                              //       Text(
                              //           NumberFormat.currency(locale: 'eu', symbol: '€')
                              //               .format(CartProvider().getTotalTransport),
                              //           style: const TextStyle(
                              //               fontSize: 20, fontWeight: FontWeight.bold))
                              //     ],
                              //   ),
                              // ),
                              //
                              //
                              // Padding(
                              //   padding: const EdgeInsets.all(20.0),
                              //   child: DottedBorder(
                              //       color: Colors.grey.shade400,
                              //       dashPattern: const [20, 20],
                              //       padding: const EdgeInsets.all(0),
                              //       child: Container()),
                              // ),

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Text('TotalPrice :', style: TextStyle(fontSize: 20)),
                                    Text(
                                        NumberFormat.currency(locale: 'eu', symbol: '€')
                                            .format(CartProvider().totalPrice),
                                        // 123.456,00 ?t({totalPrice + 5.99}),
                                        // Text('€ ${totalPrice + 5.99}',
                                        style: const TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold)),

                                    const Text('Total Transp: ', style: TextStyle(fontSize: 20)),
                                    Text(
                                        NumberFormat.currency(locale: 'eu', symbol: '€')
                                            .format(CartProvider().totalPrice + CartProvider().getTotalTransport),
                                        // 123.456,00 ?t({totalPrice + 5.99}),
                                        // Text('€ ${totalPrice + 5.99}',
                                        style: const TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              // const SizedBox(height: 10),
                              // FadeAnimation( 1.4,

                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CartScreen()));
                                    // MaterialPageRoute( builder: (context) => const MenuNavigationComponents()));
                                  },
                                  height: 40,
                                  elevation: 0,
                                  splashColor: Colors.yellow[700],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: const Color.fromARGB(255, 67, 219, 54),
                                  child: const Center(
                                    child: Text(
                                      "CartSceen",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              )

                            ]
                        ),
                       );



                  }).toList(),
                  // fine map tabs

                ),

              );
            }),
          );
        }

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


  newCartItems(CartItem newCartItem) {
    CartItem cartItem = CartItem(
        id: newCartItem.id,
        codeProd: newCartItem.codeProd,
        name: newCartItem.name,
        description: newCartItem.description,
        price: newCartItem.price,
        quantityStock: newCartItem.quantityStock,
        quantity: newCartItem.quantity,
        imageURL: newCartItem.imageURL,
        image: newCartItem.image);

    return cartItem;
  }

  // newCartItemsProduct(Product product) {
  //   CartItem cartItem = CartItem(
  //       id: product.id,
  //       codeProd: product.codeProd,
  //       name: product.name,
  //       description: product.description,
  //       price: product.price,
  //       quantityStock: product.quantityStock,
  //       quantity: product.quantity,
  //       imageURL: product.imageURL,
  //       image: product.image);
  //
  //   return cartItem;
  // }
  /// Widget createProductList(int index, List<Product> products, Map<String, Product> productItems, Product product, Animation<double> animation) {}

  Widget createProductList(int index, List<Product> products,
      Map<String, Product> productItems, Product product, Map<String, CartItem> cartItemsMap,
      Animation<double> animation, BuildContext context) {

    // itemCart;

    return GestureDetector(

      // Popup onClik single row Product
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductViewPage(product: products[index])));
      },

      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),

        child: Container(
          /// height: MediaQuery.of(context).size.height * 0.15,
         /// width: MediaQuery.of(context).size.width * 90,
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
            children: <Widget>[
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
               //  width: 150,
               width: MediaQuery.of(context).size.width * 0.25,
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
                        '€ ${product.price}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      //   const SizedBox(height: 10),

                    ]),

              ),

                 SizedBox(
                /// width: 150,
                /// width: MediaQuery.of(context).size.width * 0.10,
                    child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addWidgetQuantity(products, index),
                      ],
                    ),

                ),

                 // Row(
                 //   children: [
                 //     //const Spacer(),
                 //     addWidgetQuantity(products, index),
                 //   ],
                 // ),

              // Row(
              //   children: [
              //
              //     ///DECREMENT AMOUNT CARSCREEN
              //     iconWidget(Icons.remove, iconColor: AppColors.darkGrey,
              //       onPressed: () {
              //         setState(() {
              //           products[index].quantity--;
              //           CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(products[index]));
              //         });
              //         // cartItems.removeAt(index);
              //         //cartItemCount.removeAt(index);
              //       },
              //     ),
              //     const SizedBox(width: 18),
              //     /// QUANTITY CARTSCREEN
              //     Container(
              //         width: 30,
              //         child: Center(
              //             child:
              //             getText(
              //                 text:CartProvider.getAmount(products[index].id,products[index].quantity).toString(), fontSize: 18, isBold: true
              //             )
              //         )
              //     ),
              //     ///INCREMENT AMOUNT CARSCREEN
              //     const SizedBox(width: 18),
              //     iconWidget(Icons.add, iconColor: AppColors.primaryColor,
              //       onPressed: () {
              //         setState(() {
              //           products[index].quantity++;
              //           CartProvider.addItemCart(CartProvider().newCartItemsProduct(products[index]));
              //         });
              //       },
              //     ),
              //
              //   ],
              // ),


            ],
          ),

        ),

      ),


    );
  }


  void decrementAmount(int amount,Product product) {
    if (amount <= 0) return;
    setState(() {
      amount = amount - 1;
      updateParent(amount,product);
    });
  }

  void updateParent(amount,product) {
    if (widget.onAmountChanged != null) {
      widget.onAmountChanged!(amount);
      ///widget.onAmountChanged!(amounts[amount]);
    }
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

  List<Product>  productListFilter (int tabIndex,List<Product> products ) {
    // Arrivo dalla home Tab default = 0 Fruits and Vegetable

    List<Product> listFilter=[];
    // TAB_0 --> FRUITS  AND VEGETABLE
    if (tabIndex == 0) {
      // products.clear();
      for (var i in products) {

        listFilter.add(i);

        /// 1- ADD PRODUCT INTO THE CART
        ///  CartItem().addItemCart(i, tabIndex);
      }

      //  AgricultureBiologique(item: products[tabIndex],).createState().products=products;
      //flagItemEnabled = false;
    } else
      // TAB_1 --> FRUITS
    if (tabIndex == 1) {
      /// products.clear();
      for (var i in products) {
        if (i.category.toString().toLowerCase() ==
            AppLocalizations.translate('fruits').toString().toLowerCase()) {
          listFilter.add(i);
          // category = i.category.toString().toLowerCase();
        }
      }
    } else {
      // TAB_0 --> VEGETABLE
      if (tabIndex == 2) {
        //  products.clear();
        AgricultureBiologicalProvider().products.clear();
        for (var i in products) {
          if (i.category.toString().toLowerCase() ==
              AppLocalizations.translate('vegetables')
                  .toString()
                  .toLowerCase()) {
            listFilter.add(i);
            AgricultureBiologicalProvider().products.add(i);

            break;
            // category = i.category;
          }
        }
      }
    }



    return listFilter;
  }

 Widget addWidgetQuantity(List<Product> products, int index) {
    return Row(
       //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        /// const Spacer(),
        ///DECREMENT AMOUNT CARSCREEN
        iconWidget(Icons.remove, iconColor: AppColors.darkGrey,
          onPressed: () {
            setState(() {
             // products[index].quantity--;
              if(products[index].quantity <=0 ){
                return;
              }else {
                /// save cart to Map
                CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(products[index]));

                /// save cart to sharedprefered
                CartProvider.removeSharedPrefRepository(products[index].id.toString());
              }
            });
            // cartItems.removeAt(index);
            //cartItemCount.removeAt(index);
          },
        ),

        //const SizedBox(width: 18),
        /// QUANTITY CARTSCREEN
        SizedBox(
            width: 30,
            child: Center(
                child:
                getText(
                    text:CartProvider.getAmount(products[index],products[index].quantity).toString(), fontSize: 18, isBold: true
                )
            )
        ),

        ///INCREMENT AMOUNT CARSCREEN
       /// const SizedBox(width: 18),
        iconWidget(Icons.add, iconColor: AppColors.primaryColor,
          onPressed: () {
            setState(() {
              //products[index].quantity++;
              /// save cart to Map
              CartProvider.addItemCart(CartProvider().newCartItemsProduct(products[index]));
              /// save cart to sharedprefered
              // CartProvider.saveToSharedPrefRepository(CartProvider().newCartItemsProduct(products[index]));
            });
          },
        ),

      ],
    );
  }







}

class DataSearch extends SearchDelegate<String> {
  /// ["orancia","mango","patate","carote"];

  final List<Product> productsList;
  final String querysearch;

  DataSearch(this.productsList,this.querysearch);

  @override
  List<Widget>? buildActions(BuildContext context) {
    querysearch;
    return[IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query='';

        })
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    // querysearch;
    // final suggestionList =query.isEmpty? productsList:productsList.where((element) => element.name.contains(RegExp(query, caseSensitive: false))).toList();

    if(querysearch.isNotEmpty){
      query=querysearch;
    }
    // show when someone searches for something
    final suggestionList =querysearch.isEmpty? productsList:productsList.where((element) => element.name.contains(RegExp(query, caseSensitive: false))).toList();

    return IconButton(

        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),

        onPressed: (){
          close(context, "");
        });
  }

  @override

  Widget buildResults(BuildContext context) {
    // show some result based on the selections
    querysearch;

    final subjectList=productsList;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: subjectList.length,


        itemBuilder: (context,index){

          return forYou(subjectList[index],context,index,subjectList);
        }

    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(querysearch.isNotEmpty){
      query=querysearch;
    }
    // show when someone searches for something
    final suggestionList =query.isEmpty? productsList:productsList.where((element) => element.name.contains(RegExp(query, caseSensitive: false))).toList();

    // querysearch;
    // // show when someone searches for something
    // final suggestionList =query.isEmpty? productsList:productsList.where((element) => element.name.contains(RegExp(query, caseSensitive: false))).toList();

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: suggestionList.length,

        itemBuilder: (context, index){
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductViewPage(product: suggestionList[index])));
          };
          return forYou(suggestionList[index],context,index,suggestionList);
        }

    );
  }
// Widget buildResultsOK(BuildContext context) {
//   // show some result based on the selections
//
//   final subjectList=productsList;
//   return ListView.builder(itemBuilder: (context,index) => ListTile(
//     title: Text(productsList[index].description),
//     subtitle: Text(productsList[index].name),
//   ),
//     itemCount: subjectList.length,
//   );
//
// }

// @override
// Widget buildSuggestionsOK(BuildContext context) {
//   // show when someone searches for something
//   final suggestionList =query.isEmpty? productsList:productsList.where((element) => element.name.contains(RegExp(query, caseSensitive: false))).toList();
//
//
//   return ListView.builder(itemBuilder: (context, index)=>ListTile(
//     onTap:(){
//       Navigator.push(context,
//           MaterialPageRoute(
//               builder: (context) =>DetailSearchWidget(product:suggestionList[index]),
//       ),
//       );
//     } ,
//
//     trailing: Icon(Icons.remove_red_eye),
//     title: RichText(
//       text: TextSpan(
//         text: suggestionList[index].name.substring(0,query.length),
//         style: const TextStyle(
//              color: Colors.red,fontWeight: FontWeight.bold
//         ),
//
//         children: [
//           TextSpan(
//             text: suggestionList[index].description.substring(query.length),
//             style: const TextStyle(color: Colors.grey),
//           )
//         ]
//
//       ),
//     ),
//
//   ),
//     itemCount: suggestionList.length,
//   );
// }

}

forYou(Product product, BuildContext context, int index, List<Product> subjectList) {
  return GestureDetector(

    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductViewPage(product: subjectList[index]))
      );
    },
    child: AspectRatio(
      // aspectRatio: 3 / 1,
      aspectRatio:11/ 1,
      child:
      // FadeAnimation(
      //   1.5,
      Container(
        // width: MediaQuery.of(context).size.width * 0.100,
        margin: const EdgeInsets.only(right: 25,left: 25, bottom: 8),
        //padding: const EdgeInsets.symmetric(horizontal: 10),
        //  height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width * 100,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 10),
              blurRadius: 15,
              color: Colors.grey.shade200,
            )
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child:
                  //  Image.network(product.imageURL, fit: BoxFit.cover)),
                  Image.asset(product.image, fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Shop: ${product.brand}",
                        style: TextStyle(
                          color: Colors.green.shade500,
                          fontSize: 13,
                        ),
                      ),
                      // const Spacer(),
                      Text("Code: ${product.codeProd}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      // Text(
                      //   product.description.toString(),
                      //   style: TextStyle(
                      //     color: Colors.orange.shade400,
                      //     fontSize: 13,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\€ " + product.price.toString() + '.00',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ]

                )
            ),
            Expanded(
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.description.toString(),
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 15,
                      ),
                    ),
                  ]  ),
            ),
          ],
        ),
      ),
      //),
    ),
  );
}



