import 'dart:collection';
import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:ecobioweb/cart/widgets/item_counter_widget.dart';
import 'package:ecobioweb/category/detailCategory/agriculture_biologique.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../../animation/fade_animation.dart';

import '../../../providers/cart_provider.dart';
import '../../cart/cart.dart';
import '../../cart/checkout_bottom_sheet.dart';
import '../../cart/widgets/chart_item_widget.dart';
import '../../commonWidgets/app_button.dart';
import '../../helpers/column_with_seprator.dart';
import '../../products/components/product.dart';
import '../../products/screen/product_view.dart';
import '../../settings/payment/screens/payment.dart';


class ShoppingCartScreen extends StatefulWidget {

 ///final int amount;
  // Cart cart = Cart();
  // Map<String, CartItem> cartItemsddd =cart.cartItems;
   // Product? product;
   // final int? quantity;
  // List<dynamic>? cartItems = [];

  // Map<String, CartItem> get cartItems {
  //   return {..._cartItems};
  // }
  //
  // final Map<String, CartItem> _cartItems = {};

     /// no get item fom provider
   ///List<dynamic>? cartItems =AgricultureBiologique.cartItemsProducts;
 /// Map<String, CartItem> cartItems =  Cart().cartItems;

   // Iterable<CartItem> cartItemsProduct =Cart().getItemsCart();


    const ShoppingCartScreen({Key? key,Map<int, Product>? amountProductMap}) : super(key: key);



  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with TickerProviderStateMixin {
//  class car che gestisce il carello

  Map<String, CartItem> cartItemsddd =Cart().cartItems;

  final Map<String, CartItem> _cartItemsProd = {};

  // List<dynamic> cartItems = Cart().cartItems.values.toList();

  /// get list from class loder   /// get list from class loder

   List<Product> cartItems = AgricultureBiologique.cartItemsProducts;
  //List<String> cartItems = AgricultureBiologique.cartItemsProducts;
   List<int> cartItemCount =AgricultureBiologique.cartItemCount;
  List<int> amounts = AgricultureBiologique.amounts;
   Map<int, Product> amountProductMap= AgricultureBiologique.amountProductMap;


  late List<dynamic> cartItems2 = [];

  int quantityPro = 0;

  double totalPrice = 0;

  ItemCounterWidget itemCounterWidget =  const ItemCounterWidget();


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: const Icon(Icons.close),
        title: const Text('My Cart shopping',
            style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.40,
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
                                          (int.parse(cartItems[index]
                                                  .price
                                                  .toString()) *
                                              cartItemCount[index]);

                                      AnimatedList.of(context).removeItem(index,
                                          (context, animation) {
                                      // return cartItem(cartItems[index], cart!,index, animation);
                                            return cartItem(cartItems[index], index, animation);
                                      });

                                      cartItems.removeAt(index);
                                      cartItemCount.removeAt(index);
                                      // quantity[index]++;
                                    });
                                  },
                                ),
                              ],
                              child: cartItem(
                                 // cartItems[index], cart!, index, animation),
                                 // cartItems[index] as Product, index, animation),
                                  cartItems[index] , index, animation),
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
                    Text('Shipping', style: TextStyle(fontSize: 20)),
                    //  Text('\$5.99',
                    //  Text('\$${totalPrice + 8.99}',
                    // Text(cart.subTotalPrice.toString(),  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
             // ),
            ),
            // FadeAnimation(
            //     1.3,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DottedBorder(
                      color: Colors.grey.shade400,
                      dashPattern: const [10, 10],
                      padding: const EdgeInsets.all(0),
                      child: Container()),
                ),
           // ),
           //  FadeAnimation(
           //      1.3,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Total :', style: TextStyle(fontSize: 20)),
                      Text('\$${totalPrice + 8.99}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
               // )
            ),
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
                ),
            //)
          ]),
      // ),
    );
  }

 // cartItem(Product product, Cart cart, int index, animation) {
  cartItem(Product product, int index, animation) {
    //int cartQuantity = cart.quantity;

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
                child: Image.asset(
                  // product.imageURL,
                  product.image,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),

              /* child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("../../assets/images/verdure/aglio_1.png",
                    fit: BoxFit.cover),
              ),
              */
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.brand,
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ]),
            ),
            Column(
              // DELETE PRODOCT FROM  LIST
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 10,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      if (cartItemCount[index] >= 1) {
                        // cartItemCount[index]--;
                        //  totalPrice = totalPrice - product.price;
                      //  totalPrice == cart.totalPrice;
                      }
                    });
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey.shade400,
                    size: 30,
                  ),
                ),

                // QUANTITY
                // Container(
                //   child: Center(
                //     child: Text(
                //         ///cartItemCount[index].toString()
                //         cartItemCount[index].toString(),
                //       // map  _cartItemsProd[index].toString(),
                //       //quantityPro.toString(),
                //       // cartItems[index].cart.quantity.toString(),
                //
                //       //   cart.quantity.toString(),
                //
                //     //  cartQuantity.toString(),
                //     //  ShoppingCartScreen().quantity.toString(),
                //       //quantity.toString(),
                //      ///"5555",
                //       style:
                //           TextStyle(fontSize: 20, color: Colors.grey.shade800),
                //     ),
                //   ),
                // ),

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
                //>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
                MaterialButton(
                  padding: const EdgeInsets.all(0),
                  minWidth: 10,
                  splashColor: const Color.fromARGB(255, 12, 146, 46),
                  onPressed: () {
                    setState(() {
                      // cart.addItem(productId, price, title, imgUrl);

                    /*  cart.addItem(product.code_prod, product.price.toDouble(),
                          product.name, product.imageURL);

                      cart.addItem(
                          _cartItemsProd.keys.toList()[index],
                          _cartItemsProd.values.toList()[index].price,
                          _cartItemsProd.values.toList()[index].title,
                          _cartItemsProd.values.toList()[index].imgUrl);*/
                      /*cart.addItem(
                                cartList.keys.toList()[index],
                                cartList.values.toList()[index].price,
                                cartList.values.toList()[index].title,
                                cartList.values.toList()[index].imgUrl
                                );
                                */
                      //   },
                      //   c++;
                      //quantity.add(quantityPro++);
                      //quantity == cart.quantity.toString();
                      //  quantityPro++;
                      // totalPrice = totalPrice + product.price;

                      //totalPrice == cart.totalPrice;
                    });
                  },
                  shape: const CircleBorder(),
                  child: const Icon(
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
  Widget buildGrocer(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: const Icon(Icons.close),
        title: const Text('Back',
            style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "My Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget> [
                  SizedBox(
                    height: 10,
                    child: Container(
                      color: const Color(0xFFf5f6f7),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.56,

                    /// child: cartItems.isNotEmpty?
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {

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

                            widgets: cartItems.map((e) {
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
                                  index: index,
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

                      },),
                  ),

                ],
              ),

              // Column(
              //   children: getChildrenWithSeperator(
              //     addToLastChild: false,
              //     /// widgets: demoItems.map((e) {
              //     widgets: cartItems.asMap().entries.map((e){
              //       int index =e.key;
              //         var indexNew=cartItems.indexOf(e.value);
              //         var index2=e.key;
              //         var value =e.value;
              //       //Product product=e.value;
              //
              //       return Container(
              //         padding:  const EdgeInsets.symmetric(
              //           horizontal: 25,
              //         ),
              //         width: double.maxFinite,
              //         child: ChartItemWidget(
              //           item:e.value,
              //          index: [e.key],
              //          /// amount: const [],
              //         ),
              //       );
              //     }).toList(),
              //     // widgets: cartItems.asMap().entries.map<Widget>((e){
              //     //   int index =e.key;
              //     //   Product product=e.value;
              //     //   return Container(
              //     //     padding:  const EdgeInsets.symmetric(
              //     //       horizontal: 25,
              //     //     ),
              //     //     width: double.maxFinite,
              //     //     child: ChartItemWidget(
              //     //       item:e.value,
              //     //       index: const [],
              //     //       amount: const [],
              //     //     ),
              //     //   );
              //     // }).toList(),
              //
              //     // widgets: cartItems.map((e) {
              //     //   var indexNew=cartItems.indexOf(e);
              //     //   var index2=e.key;
              //     //   var value =e.value;
              //     //   return Container(
              //     //     padding: const EdgeInsets.symmetric(
              //     //       horizontal: 25,
              //     //     ),
              //     //     width: double.maxFinite,
              //     //     child: ChartItemWidget(
              //     //       item: e,
              //     //      index: cartItemCount,
              //     //     /// amount: amount,
              //     //      /// amount:amount ,
              //     //     ),
              //     //   );
              //     // }).toList(),
              //
              //     seperator: const Padding(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 25,
              //       ),
              //       child: Divider(
              //         thickness: 1,
              //       ),
              //     ),
              //   ),
              // ),
              // const Divider(
              //   thickness: 1,
              // ),
              // getCheckoutButton(context)
            ],
          ),
        ),
      ),
    );
  }


  check() {
    for (var value in cartItems) {
      // cartItemCount.add(cartItems.length);
      cartItemCount.add(cartItems.length);
    }
  }

  sumTotal() {
    //cartItems.forEach((item) {totalPrice = item.price + totalPrice;
    for (var item in cartItems) {
      totalPrice = (item.price + totalPrice);
    }
  }
  Future<List> getListProdBuy() async {

    final Map<String, String> item = Map<String, String>();
    SharedPreferences prefs = await  SharedPreferences.getInstance();

    cartItems;

    //cartItems = prefs.getStringList('cartItemsListDynamic')??[];

    check();
    cartItems2 =prefs.getStringList('cartItemsList')!;

    List<String>? cart =prefs.getStringList('cartItemsList');


   // print('cartItemsList'+cartItems.toString());

    // ADD THE LIST OF PRODUCTS INTO THE MAP PRODUCT LIST
    // for (var product in cartItemsList) {
    //   addListProductItems(product);
    // }

    return cartItems;
  }

  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "Go To Check Out",
        fontWeight: FontWeight.w600,
        padding: const EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xff489E67),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        "\$12.96",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return CheckoutBottomSheet();
        });
  }
}
