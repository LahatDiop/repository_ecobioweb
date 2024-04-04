//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:ecobioweb/roots/trunk/branches/cart/screens/cart_screen.dart';
// import 'package:ecobioweb/roots/trunk/branches/favorites/provider/favorites_provider.dart';
// import 'package:ecobioweb/roots/trunk/branches/favorites/screens/favourite_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../cart/components/cart_item.dart';
// import '../../../../cart/provider/cart_provider.dart';
// import '../../../../commun_data_utils/utils/text/app_text.dart';
// import '../../../../commun_data_utils/utils/theme/app_theme.dart';
// import '../../../../localisation/translation/components/appLocalizations.dart';
// import '../../../../menu/menu_search/screens/search_screen.dart';
// import '../../../../products/components/product.dart';
// import '../../../../products/screens/product_view.dart';
// import '../../../../products/widgets/favourite_toggle_icon_widget.dart';
// import '../provider/agriculture_biological_provider.dart';
//
// class AgricultureBiologiqueScreen1 extends StatefulWidget {
//   static List<Product> cartItemsProducts = [];
//   Map<String, Product> cartItems = {};
//
//   // static List<Product> productItems = [];
//   static List<int> cartItemCount = [];
//   static List<int> amounts = [];
//
//   final Function? onAmountChanged;
//
//   AgricultureBiologiqueScreen1({Key? key,  required this.item, this.itemCart, this.onAmountChanged,  AgricultureBiologicalProvider? agricultureBiologicalProvider}) : super(key: key);
//
//   final Product? item;
//   CartItem? itemCart;
//
//   @override
//
//   _AgricultureBiologiqueScreenState createState() => _AgricultureBiologiqueScreenState();
// }
//
// class _AgricultureBiologiqueScreenState extends State<AgricultureBiologiqueScreen1> with TickerProviderStateMixin {
//   ///class _AgricultureBiologiqueScreenState extends State<AgricultureBiologiqueScreen1> with SingleTickerProviderStateMixin   {
//
//   List<Tab> tabs = <Tab>[
//     Tab(text: AppLocalizations.translate('fruitsVegetable').toString()),
//     Tab(text: AppLocalizations.translate('fruits').toString()),
//     Tab(text: AppLocalizations.translate('vegetables').toString()),
//   ];
//
//
//   late TabController _tabController;
//
//   List<dynamic> dataLoader = [];
//
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // Create TabController for getting the index of current tab
//     _tabController = TabController(vsync: this, length: tabs.length);
//
//     /// fetchItems().whenComplete(() => setState(() {}));
//   }
//
//   Map<String, Product> productItems = {};
//
//   List<Product> products = [];
//
//   List<Product> productFilter=[];
//
//   Map<String, CartItem> cartItems={};
//
//   CartItem? itemCart;
//
//   TextEditingController textInputSearch =  TextEditingController();
//
//   final double height = 110;
//
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//   bool isLoadedlistProduct = true;
//
//   // FILTRE THE LIST MARKET ENABLED
//   // List countryEnabled = [];
//
//   bool flagItemEnabled = true;
//
//   int _selectedIndex = 0;
//
//   // The key of the list
//   final GlobalKey<AnimatedListState> _key = GlobalKey();
//
//   double totalPrice = 0;
//   int amount = 0;
//
//
//   List<Widget> listTab = [
// //  List<Tab> listTab = [
//     //  Tab(icon: Icon(Icons.card_travel)),
//     // Tab(icon: Icon(Icons.add_shopping_cart)),
//     Tab(
//       child: Text(
//         AppLocalizations.translate('fruitsVegetable').toString(),
//         style: const TextStyle(
//             fontSize: 15.0,
//             fontFamily: 'Quicksand',
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//     Tab(
//       child: Text(
//         AppLocalizations.translate('fruits').toString(),
//         style: const TextStyle(
//             fontSize: 15.0,
//             fontFamily: 'Quicksand',
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//     Tab(
//       child: Text(
//         AppLocalizations.translate('vegetables').toString(),
//         style: const TextStyle(
//             fontSize: 15.0,
//             fontFamily: 'Quicksand',
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//   ];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     ///  context.read<AgicultureBiologicalProvider>().getData();
//     //  final CartProvider=Provider.of<CartProvider>(context);
//     //   final gestionAgriculture =Provider.of<AgicultureBiologicalProvider>(context);
//     // //
//     // final  cartsList = CartProvider.cartItems;
//
//     return MultiProvider(
//       // providers: [],
//         providers: [
//           ChangeNotifierProvider(create: (_) => AgricultureBiologicalProvider()),
//           ChangeNotifierProvider(create: (_) => CartProvider())
//         ],
//         builder: (context, child) {
//           int tabIndex=_tabController.index.toInt();
//           final gestionAgriculture = Provider.of<AgricultureBiologicalProvider>(context);
//           var  ListProductFromJson=  context.read<AgricultureBiologicalProvider>().getData(tabIndex);
//
//
//           cartItems= context.read<CartProvider>().cartItems;
//           products = context.read<AgricultureBiologicalProvider>().products;
//
//           productItems=context.read<AgricultureBiologicalProvider>().productItems;
//
//
//           return DefaultTabController(
//             length: tabs.length,
//             // The Builder widget is used to have a different BuildContext to access
//             // closest DefaultTabController.
//             child: Builder(builder: (BuildContext context) {
//               TabController tabController = DefaultTabController.of(context);
//
//               tabController.addListener(() {
//                 if (!tabController.indexIsChanging) {
//
//                   // productFilter =productListFilter(tabController.index, products);
//                   // products.clear();
//                   // products= productFilter;
//
//                   print('The Tab has changed Lahat :)');
//
//                   //  AgricultureBiologicalProvider().recalculateTabElement(tabController.index);
//                   // Your code goes here.
//                   // To get index of current tab use tabController.index
//                 }
//               });
//               return Scaffold(
//                 appBar: AppBar(
//                   // backgroundColor: const Color.fromRGBO(250, 101, 243, 105),
//                   toolbarHeight: 50.0,
//
//                   title: TextField(
//                     controller:textInputSearch ,
//                     cursorColor: Colors.white,
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white70,
//                         contentPadding: const EdgeInsets.only(
//                             left: 14.0, bottom: 8.0, top: 8.0),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:  const BorderSide(color: Colors.white),
//                           borderRadius: BorderRadius.circular(25.7),
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide:  const BorderSide(color: Colors.white),
//                           borderRadius:  BorderRadius.circular(25.7),
//                         ),
//                         hintText: AppLocalizations.translate("search_point"),
//                         border: InputBorder.none,
//                         suffixIcon: IconButton(
//                           icon: const Icon(Icons.search),
//                           color: const Color.fromRGBO(90, 25, 72, 1),
//                           onPressed: () {
//
//
//                             showSearch(context: context, delegate: DataSearch(products,textInputSearch.value.text.toString()));
//                           },
//                         )),
//                     style: const TextStyle(color: Colors.black, fontSize: 15.0),
//                   ),
//                   // backgroundColor: Colors.blueGrey,
//                   ///Tabs
//                   bottom: TabBar(tabs: tabs),
//                 ),
//                 // appBar: AppBar(
//                 //   title: const Text('Products List',
//                 //       style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
//                 //   bottom: TabBar(
//                 //
//                 //     // controller: _tabController,
//                 //     tabs: tabs,
//                 //   ),
//                 // ),
//                 body: TabBarView(
//                   // controller: _tabController,
//
//                   children: tabs.map((Tab tab) {
//
//                     return Column(
//
//                         children: <Widget>[
//                           //SearchWidget(),
//                           SizedBox(
//                             height: 10,
//                             child: Container(
//                               color: const Color(0xFFf5f6f7),
//                             ),
//                           ),
//
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             height: MediaQuery.of(context).size.height * 0.40,
//                             // height: MediaQuery.of(context).size.height * 0.45,
//                             child: products.isNotEmpty?
//                             /// child: productFilter.isNotEmpty?
//
//                             AnimatedList(
//                                 scrollDirection: Axis.vertical,
//                                 initialItemCount: products.length,
//                                 itemBuilder: (context, index, animation) {
//                                   return Slidable(
//                                     // actionPane: const SlidableDrawerActionPane(),
//                                     //secondaryActions: [
//                                     groupTag: <Widget>[
//                                       MaterialButton(
//                                         color: const Color.fromARGB(255, 224, 212, 211)
//                                             .withOpacity(0.15),
//                                         elevation: 2,
//                                         height: 60,
//                                         minWidth: 50,
//                                         shape: const CircleBorder(),
//                                         child: const Icon(
//                                           Icons.delete,
//                                           color: Color.fromARGB(255, 226, 218, 218),
//                                           size: 30,
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             AnimatedList.of(context).removeItem(index,
//                                                     (context, animation) {
//                                                   return createProductList( index, products, productItems, products[index], cartItems,animation,context);
//                                                 });
//
//                                             // cartItems.removeAt(index);
//                                             // cartItemCount.removeAt(index);
//                                           });
//                                         },
//                                       ),
//                                     ],
//                                     child: createProductList( index, products, productItems, products[index], cartItems,animation,context),
//                                   );
//                                 })
//
//                                 : Container(),
//                           ),
//                           const SizedBox(height: 10),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 const Text('Transport', style: TextStyle(fontSize: 20)),
//                                 Text(
//                                     NumberFormat.currency(locale: 'eu', symbol: '€')
//                                         .format(CartProvider().getTotalTransport),
//                                     style: const TextStyle(
//                                         fontSize: 20, fontWeight: FontWeight.bold))
//                               ],
//                             ),
//                           ),
//
//
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: DottedBorder(
//                                 color: Colors.grey.shade400,
//                                 dashPattern: const [20, 20],
//                                 padding: const EdgeInsets.all(0),
//                                 child: Container()),
//                           ),
//
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 const Text('TotalPrice :', style: TextStyle(fontSize: 20)),
//                                 Text(
//                                     NumberFormat.currency(locale: 'eu', symbol: '€')
//                                         .format(CartProvider().totalPrice),
//                                     // 123.456,00 ?t({totalPrice + 5.99}),
//                                     // Text('€ ${totalPrice + 5.99}',
//                                     style: const TextStyle(
//                                         fontSize: 20, fontWeight: FontWeight.bold)),
//
//                                 const Text('Total : ', style: TextStyle(fontSize: 20)),
//                                 Text(
//                                     NumberFormat.currency(locale: 'eu', symbol: '€')
//                                         .format(CartProvider().totalPrice + CartProvider().getTotalTransport),
//                                     // 123.456,00 ?t({totalPrice + 5.99}),
//                                     // Text('€ ${totalPrice + 5.99}',
//                                     style: const TextStyle(
//                                         fontSize: 20, fontWeight: FontWeight.bold))
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           // FadeAnimation( 1.4,
//
//                           Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: MaterialButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => CartScreen()));
//                                 // MaterialPageRoute( builder: (context) => const MenuNavigationComponents()));
//                               },
//                               height: 40,
//                               elevation: 0,
//                               splashColor: Colors.yellow[700],
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               color: const Color.fromARGB(255, 67, 219, 54),
//                               child: const Center(
//                                 child: Text(
//                                   "CartSceen",
//                                   style: TextStyle(color: Colors.white, fontSize: 18),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: MaterialButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => FavouriteScreen()));
//                                 // builder: (context) => FavouriteScreen(productsFavorite: products,)));
//                                 // MaterialPageRoute( builder: (context) => const MenuNavigationComponents()));
//                               },
//                               height: 40,
//                               elevation: 0,
//                               splashColor: Colors.yellow[700],
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               color: const Color.fromARGB(255, 67, 219, 54),
//                               child: const Center(
//                                 child: Text(
//                                   "Favorites",
//                                   style: TextStyle(color: Colors.white, fontSize: 18),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: MaterialButton(
//                               onPressed: () {
//                                 FavoriteProvider().cleanFavorite();
//                               },
//                               height: 40,
//                               elevation: 0,
//                               splashColor: Colors.yellow[700],
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               color: const Color.fromARGB(255, 67, 219, 54),
//                               child: const Center(
//                                 child: Text(
//                                   "Clean Favorites",
//                                   style: TextStyle(color: Colors.white, fontSize: 18),
//                                 ),
//                               ),
//                             ),
//                           )
//
//                         ]
//                     );
//                     // child: products.isNotEmpty ?
//                     //
//                     // AnimatedList(
//                     //     scrollDirection: Axis.vertical,
//                     //     // initialItemCount: productItems.length,
//                     //     initialItemCount: products.length,
//                     //     itemBuilder: (context, index, animation) {
//                     //       return Slidable(
//                     //         // actionPane: const SlidableDrawerActionPane(),
//                     //         //secondaryActions: [
//                     //         groupTag: <Widget>[
//                     //
//                     //           MaterialButton(
//                     //             color: const Color.fromARGB(
//                     //                 255, 224, 212, 211)
//                     //                 .withOpacity(0.15),
//                     //             elevation: 2,
//                     //             height: 60,
//                     //             minWidth: 60,
//                     //             shape: const CircleBorder(),
//                     //             child: const Icon(
//                     //               Icons.delete,
//                     //               color: Color.fromARGB(255, 226, 218, 218),
//                     //               size: 30,
//                     //             ),
//                     //             onPressed: () {
//                     //               setState(() {
//                     //                 AnimatedList.of(context).removeItem(
//                     //                     index, (context, animation) {
//                     //                   return createProductList( index, products, productItems, products[index], cartItems,animation,context);
//                     //                 });
//                     //               });
//                     //             },
//                     //           ),
//                     //
//                     //         ],
//                     //         child: createProductList( index, products, productItems, products[index], cartItems,animation,context),
//                     //
//                     //
//                     //       );
//                     //       Text("lahat3");
//                     //     })
//                     //     : Container(),
//                     //  ),
//                     //  return Center(
//                     //  // return Container(
//                     //  //     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     //      // height: MediaQuery.of(context).size.height * 40,
//                     //      child: products.isNotEmpty ?
//                     //
//                     //      AnimatedList(
//                     //          scrollDirection: Axis.vertical,
//                     //          // initialItemCount: productItems.length,
//                     //          initialItemCount: products.length,
//                     //          itemBuilder: (context, index, animation) {
//                     //            return Slidable(
//                     //              // actionPane: const SlidableDrawerActionPane(),
//                     //              //secondaryActions: [
//                     //              groupTag: <Widget>[
//                     //
//                     //                MaterialButton(
//                     //                  color: const Color.fromARGB(
//                     //                      255, 224, 212, 211)
//                     //                      .withOpacity(0.15),
//                     //                  elevation: 2,
//                     //                  height: 60,
//                     //                  minWidth: 60,
//                     //                  shape: const CircleBorder(),
//                     //                  child: const Icon(
//                     //                    Icons.delete,
//                     //                    color: Color.fromARGB(255, 226, 218, 218),
//                     //                    size: 30,
//                     //                  ),
//                     //                  onPressed: () {
//                     //                    setState(() {
//                     //                      AnimatedList.of(context).removeItem(
//                     //                          index, (context, animation) {
//                     //                    return createProductList( index, products, productItems, products[index], cartItems,animation,context);
//                     //                      });
//                     //                    });
//                     //                  },
//                     //                ),
//                     //
//                     //              ],
//                     //                child: createProductList( index, products, productItems, products[index], cartItems,animation,context),
//                     //
//                     //
//                     //            );
//                     //            Text("lahat3");
//                     //          })
//                     //          : Container(),
//                     //
//                     //
//                     // );
//                   }).toList(),
//                   // fine map tabs
//
//                 ),
//
//               );
//             }),
//           );
//         }
//
//     );
//   }
//
//
//   Widget getText({
//     required String text,
//     int? index,
//     required double fontSize,
//     bool isBold = false,
//     color = Colors.black,
//   }) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: fontSize,
//         fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//         color: color,
//       ),
//     );
//   }
//
//
//   newCartItems(CartItem newCartItem) {
//     CartItem cartItem = CartItem(
//         id: newCartItem.id,
//         codeProd: newCartItem.codeProd,
//         type: newCartItem.type,
//         name: newCartItem.name,
//         description: newCartItem.description,
//         price: newCartItem.price,
//         quantityStock: newCartItem.quantityStock,
//         quantity: newCartItem.quantity,
//         imageURL: newCartItem.imageURL,
//         image: newCartItem.image);
//
//     return cartItem;
//   }
//
//   // newCartItemsProduct(Product product) {
//   //   CartItem cartItem = CartItem(
//   //       id: product.id,
//   //       codeProd: product.codeProd,
//   //       name: product.name,
//   //       description: product.description,
//   //       price: product.price,
//   //       quantityStock: product.quantityStock,
//   //       quantity: product.quantity,
//   //       imageURL: product.imageURL,
//   //       image: product.image);
//   //
//   //   return cartItem;
//   // }
//   /// Widget createProductList(int index, List<Product> products, Map<String, Product> productItems, Product product, Animation<double> animation) {}
//
//   Widget createProductList(int index, List<Product> products,
//       Map<String, Product> productItems, Product product, Map<String, CartItem> cartItemsMap,
//       Animation<double> animation, BuildContext context) {
//
//     // List<dynamic> productsList=[];
//     //
//     // for(var amount in products){
//     //   int counter=0;
//     //   productsList.add(products[index].quantity);
//     //
//     // }
//     /** if the product is selected in my car , get itemCart product
//      * else get items products list
//      * */
//     // if (cartItemsMap.isNotEmpty){
//     //   var extratoCartItem= cartItemsMap.entries.map((e){
//     //     itemCart = newCartItems(e.value);
//     //   }).toList();
//     //
//     // }else{
//     //   var extratoCartItem= productItems.entries.map((e){
//     //     itemCart = newCartItemsProduct(e.value);
//     //
//     //   }).toList();
//     // }
//     // var extratoCartItem= productItems.entries.map((e){
//     //         itemCart = newCartItems(e.value);
//     //         // var index =e.key;
//     //          ///int  indexProd=cartItems.elementAt(index);
//     //
//     //        }).toList();
//
//     // itemCart;
//
//     return GestureDetector(
//
//       // Popup onClik single row Product
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     ProductViewPage(product: products[index],products:products )));
//       },
//
//       child: SlideTransition(
//         position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
//             .animate(animation),
//
//         child: Container(
//           /// height: MediaQuery.of(context).size.height * 0.15,
//           margin: const EdgeInsets.only(bottom: 5),
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.shade200,
//                 offset: const Offset(0, 2),
//                 blurRadius: 6,
//               ),
//             ],
//           ),
//
//           child: Row(
//             children: <Widget>[
//               Container(
//                 margin: const EdgeInsets.only(right: 10),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   // imageURL of link String
//                   child: Image.asset(
//                     product.image,
//                     fit: BoxFit.cover,
//                     height: 100,
//                     width: 100,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 // width: 130,
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         product.brand.toString(),
//                         style: const TextStyle(
//                           color: Color.fromARGB(255, 20, 179, 28),
//                           fontSize: 14,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       //PRODUCT NAME
//                       Text(
//                         product.name,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Text(
//                         '€ ${product.price}',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.grey.shade800,
//                         ),
//                       ),
//                       //   const SizedBox(height: 10),
//
//                     ]),
//
//               ),
//
//               Row(
//                 children: [
//
//                   ///DECREMENT AMOUNT CARSCREEN
//                   iconWidget(Icons.remove, iconColor: AppColors.darkGrey,
//                     onPressed: () {
//                       setState(() {
//                         products[index].quantity--;
//                         CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(products[index]));
//                       });
//                       // cartItems.removeAt(index);
//                       //cartItemCount.removeAt(index);
//                     },),
//                 //  const SizedBox(width: 18),
//                   /// QUANTITY CARTSCREEN
//                   SizedBox(
//                       //width: 30,
//                     width: MediaQuery.of(context).size.width,
//                       child: Center(
//                           child:
//                           getText(
//                               text:CartProvider.getAmount(products[index],products[index].quantity).toString(), fontSize: 18, isBold: true
//                           )
//                       )
//                   ),
//                   ///INCREMENT AMOUNT CARSCREEN
//                //   const SizedBox(width: 18),
//                   iconWidget(Icons.add, iconColor: AppColors.primaryColor,
//                     onPressed: () {
//                       setState(() {
//                         products[index].quantity++;
//                         CartProvider.addItemCart(CartProvider().newCartItemsProduct(products[index]));
//                       });
//                     },
//                   ),
//
//                 ],
//               ),
//
//               const Row(
//                 children: [
//                   AppText(
//                     text: "ciao",
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   Spacer(),
//                   //  addWidget(),
//                   Padding(padding: EdgeInsets.only(left: 15)),
//                   //   addFavoriteWidget(product),
//                 ],
//               )
//
//
//               // Column(
//               //   // DELETE PRODOCT FROM  LIST
//               //  // crossAxisAlignment: CrossAxisAlignment.center,
//               //   children: [
//               //     MaterialButton(
//               //       minWidth: 10,
//               //       padding: const EdgeInsets.all(0),
//               //       onPressed: () {
//               //         setState(() {
//               //           products[index].quantity--;
//               //           CartProvider.decrementItemCart(newCartItemsProduct(products[index]));
//               //         });
//               //         // cartItems.removeAt(index);
//               //         //cartItemCount.removeAt(index);
//               //       },
//               //       shape: const CircleBorder(),
//               //       child: const Icon(
//               //         // Icons.delete,
//               //         Icons.remove_circle_outline,
//               //         // color: Color.fromARGB(255, 144, 133, 133),
//               //         size: 30,
//               //       ),
//               //     ),
//               //     Container(
//               //       child: Center(
//               //         child: Text(
//               //           // products[index].quantity.toString(),
//               //
//               //           CartProvider.getAmount(products[index].id,products[index].quantity).toString(),
//               //           style:
//               //           TextStyle(fontSize: 20, color: Colors.grey.shade800),
//               //         ),
//               //       ),
//               //     ),
//               //     //>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
//               //     MaterialButton(
//               //       padding: const EdgeInsets.all(0),
//               //       minWidth: 10,
//               //       splashColor: const Color.fromARGB(255, 12, 146, 46),
//               //       onPressed: () {
//               //         setState(() {
//               //          // cartItemCount[index]++;
//               //           products[index].quantity++;
//               //
//               //             CartProvider.addItemCart(newCartItemsProduct(products[index]));
//               //        });
//               //       },
//               //       shape: const CircleBorder(),
//               //       child: const Icon(
//               //         //Icons.add_shopping_cart,
//               //         Icons.add_circle,
//               //         color: Color.fromARGB(255, 46, 126, 59),
//               //         size: 30,
//               //       ),
//               //     ),
//               //   ],
//               // ),
//
//
//               /*OOOKKKK ItemCounterWidget(
//                 onAmountChanged: (newAmount) {
//                   setState(() {
//                     // widget.itemCart.quantity;
//                     /// amount =newAmount;
//                     /// amount ?? newAmount;
//                     // product.quantity;
//                   });
//                 },
//                 itemCart: itemCart,
//                 // itemCart: widget.itemCart,
//               )
//
//               */
//
//
//             ],
//           ),
//
//         ),
//
//       ),
//
//
//     );
//   }
//
//   Widget addWidget() {
//     return Container(
//       height: 45,
//       width: 45,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(17),
//           color: AppColors.primaryColor),
//       child: const Center(
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//           size: 25,
//         ),
//       ),
//     );
//   }
//
//   Widget addFavoriteWidget(Product product) {
//     return Container(
//
//       height: 45,
//       width: 45,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(17),
//           color: AppColors.withColor),
//
//       child: FavoriteToggleIcon(product: product, favorite: product.isFavorite,),
//
//     );
//   }
//   void decrementAmount(int amount,Product product) {
//     if (amount <= 0) return;
//     setState(() {
//       amount = amount - 1;
//       updateParent(amount,product);
//     });
//   }
//
//   void updateParent(amount,product) {
//     if (widget.onAmountChanged != null) {
//       widget.onAmountChanged!(amount);
//       ///widget.onAmountChanged!(amounts[amount]);
//     }
//   }
//
//   Widget iconWidget(IconData iconData, {Color? iconColor, int? index, onPressed}) {
//     return GestureDetector(
//       onTap: () {
//         if (onPressed != null) {
//           onPressed();
//           ///  incrementAmount();
//         }
//       },
//       child: Container(
//         height: 45,
//         width: 45,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(17),
//           border: Border.all(
//             color: const Color(0xffE2E2E2),
//           ),
//         ),
//         child: Center(
//           child: Icon(
//             iconData,
//             color: iconColor ?? Colors.black,
//             size: 25,
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Product>  productListFilter (int tabIndex,List<Product> products ) {
//     // Arrivo dalla home Tab default = 0 Fruits and Vegetable
//
//     List<Product> listFilter=[];
//     // TAB_0 --> FRUITS  AND VEGETABLE
//     if (tabIndex == 0) {
//       // products.clear();
//       for (var i in products) {
//
//         listFilter.add(i);
//
//         /// 1- ADD PRODUCT INTO THE CART
//         ///  CartItem().addItemCart(i, tabIndex);
//       }
//
//       //  AgricultureBiologique(item: products[tabIndex],).createState().products=products;
//       //flagItemEnabled = false;
//     } else
//       // TAB_1 --> FRUITS
//     if (tabIndex == 1) {
//       /// products.clear();
//       for (var i in products) {
//         if (i.category.toString().toLowerCase() ==
//             AppLocalizations.translate('fruits').toString().toLowerCase()) {
//           listFilter.add(i);
//           // category = i.category.toString().toLowerCase();
//         }
//       }
//     } else {
//       // TAB_0 --> VEGETABLE
//       if (tabIndex == 2) {
//         //  products.clear();
//         AgricultureBiologicalProvider().products.clear();
//         for (var i in products) {
//           if (i.category.toString().toLowerCase() ==
//               AppLocalizations.translate('vegetables')
//                   .toString()
//                   .toLowerCase()) {
//             listFilter.add(i);
//             AgricultureBiologicalProvider().products.add(i);
//
//             break;
//             // category = i.category;
//           }
//         }
//       }
//     }
//
//
//
//     return listFilter;
//   }
//
//
//
//
//
//
//
// }
//
//
//
//
//
//
//
// // @override
// // Widget build1(BuildContext context) {
// //
// //   // final cart = Provider.of<Cart>(context);
// //   //
// //   ///    List cartListNew = cartList.values.toList();
// //
// //   return Scaffold(
// //     appBar: AppBar(
// //       backgroundColor: Colors.transparent,
// //       elevation: 0,
// //       //leading: const Icon(Icons.close),
// //       title: const Text('Back Cart',
// //           style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
// //       leading: const BackButton(
// //         color: Colors.black,
// //       ),
// //     ),
// //     resizeToAvoidBottomInset: false,
// //     backgroundColor: Colors.grey.shade100,
// //     body: Builder(
// //       ///key: index,
// //       builder: (context) {
// //         return ListView(
// //           children: <Widget>[
// //            // createHeader(),
// //            // createSubTitle(),
// //             createCartList(context),
// //             createFooter(context)
// //
// //           ],
// //
// //         );
// //       },
// //
// //     ),
// //   );
// // }
// //
// // createHeader() {
// //   return Container(
// //     alignment: Alignment.topLeft,
// //     child: const Text("BIENVENU CART",
// //       style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
// //     ),
// //   );
// //
// // }
// //
// // //>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
// // createSubTitle() {
// //   return Container(
// //     alignment: Alignment.topLeft,
// //     child: const Text("Total(3) PRODUCTS",
// //       style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
// //     ),
// //   );
// // }
// //
// // createFooter(BuildContext context) {
// //   return Column(
// //     crossAxisAlignment: CrossAxisAlignment.center,
// //     mainAxisAlignment: MainAxisAlignment.end,
// //     children: <Widget>[
// //       Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children:<Widget>[
// //           Container(
// //             margin: const EdgeInsets.only(left: 30),
// //             child:
// //             AppText(
// //               // text: "${getPrice().toStringAsFixed(2)}€",
// //               text: "Total: ${CartProvider().totalPrice.toStringAsFixed(2)}€",
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //               textAlign: TextAlign.right,
// //             ),
// //             // child: const Text("Total",
// //             //     style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
// //             //   // style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey, fontSize: 12),
// //             // ),
// //
// //           )
// //         ],
// //       )
// //     ],
// //   );
// // }
// //
// // createCartList(context) {
// //   return MultiProvider(
// //     // providers: [],
// //       providers: [
// //         ChangeNotifierProvider(create: (_) => AgicultureBiologicalProvider()),
// //         ChangeNotifierProvider(create: (_) => CartProvider())
// //       ],
// //       builder: (context, child) {
// //
// //         final gestionAgriculture = Provider.of<AgicultureBiologicalProvider>(context);
// //         var dataAgri=  context.read<AgicultureBiologicalProvider>().getData();
// //
// //         /// final CartProvider = Provider.of<CartProvider>(context);
// //         ///  var dataCart = context.read<CartProvider>().getDataCart();
// //
// //
// //         // CartProvider cartItems= Provider.of<CartProvider>(context);
// //
// //         cartItems= context.read<CartProvider>().cartItems;
// //
// //         products = context.read<AgicultureBiologicalProvider>().products;
// //
// //         productItems=context.read<AgicultureBiologicalProvider>().productItems;
// //
// //         // itemCart =context.read<CartProvider>().itemCart;
// //
// //         return DefaultTabController(
// //           length: tabs.length,
// //           // The Builder widget is used to have a different BuildContext to access
// //           // closest DefaultTabController.
// //           child: Builder(builder: (BuildContext context) {
// //             final TabController tabController = DefaultTabController.of(
// //                 context);
// //
// //             tabController.addListener(() {
// //               if (!tabController.indexIsChanging) {
// //                 print('The Tab has changed :)');
// //
// //                 //recalculateElementTab(tabController.index);
// //                 // Your code goes here.
// //                 // To get index of current tab use tabController.index
// //               }
// //             });
// //             return Scaffold(
// //               appBar: AppBar(
// //                 bottom: TabBar(
// //                   // controller: _tabController,
// //                   tabs: tabs,
// //                 ),
// //               ),
// //               body: TabBarView(
// //                 // controller: _tabController,
// //                 children: tabs.map((Tab tab) {
// //                   return Container(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     height: MediaQuery.of(context).size.height * 40,
// //                     child: products.isNotEmpty ?
// //
// //                     AnimatedList(
// //                         scrollDirection: Axis.vertical,
// //                         // initialItemCount: productItems.length,
// //                         initialItemCount: products.length,
// //                         itemBuilder: (context, index, animation) {
// //                           return Slidable(
// //                             // actionPane: const SlidableDrawerActionPane(),
// //                             //secondaryActions: [
// //                             groupTag: <Widget>[
// //
// //                                   MaterialButton(
// //                                 color: const Color.fromARGB(
// //                                     255, 224, 212, 211)
// //                                     .withOpacity(0.15),
// //                                 elevation: 2,
// //                                 height: 60,
// //                                 minWidth: 60,
// //                                 shape: const CircleBorder(),
// //                                 child: const Icon(
// //                                   Icons.delete,
// //                                   color: Color.fromARGB(255, 226, 218, 218),
// //                                   size: 30,
// //                                 ),
// //                                 onPressed: () {
// //                                   setState(() {
// //                                     AnimatedList.of(context).removeItem(
// //                                         index, (context, animation) {
// //                                       return createProductList(
// //                                           index, products, productItems,
// //                                           products[index],cartItems, animation, context);
// //                                     });
// //                                   });
// //                                 },
// //                               ),
// //                               const SizedBox(height: 30),
// //
// //                               Text("lahat2"),
// //
// //                               Container(
// //                                 padding: const EdgeInsets.symmetric(horizontal: 20),
// //                                 child: const Row(
// //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                   children: <Widget>[
// //                                     //Shipping
// //                                     Text('Trasporto', style: TextStyle(fontSize: 20)),
// //                                     Text(' 5.99 €',
// //                                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
// //                                   ],
// //                                 ),
// //                               ),
// //
// //                               Padding(
// //                                 padding: const EdgeInsets.all(20.0),
// //                                 child: DottedBorder(
// //                                     color: Colors.grey.shade400,
// //                                     dashPattern: const [10, 10],
// //                                     padding: const EdgeInsets.all(0),
// //                                     child: Container()),
// //                               ),
// //                             ],
// //                             // child: cartItem(cartItems[index], index, animation),
// //                             child: createProductList(
// //                                 index, products, productItems,
// //                                 products[index], cartItems,animation,context),
// //
// //
// //
// //                           );
// //                           Text("lahat3");
// //                         })
// //                         : Container(),
// //
// //
// //                   );
// //                 }).toList(),
// //                 // fine map tabs
// //
// //               ),
// //
// //             );
// //           }),
// //         );
// //       }
// //
// //   );
// // }
