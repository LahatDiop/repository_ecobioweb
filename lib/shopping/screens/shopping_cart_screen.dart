import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import '../../../animation/fade_animation.dart';

import '../../../providers/cart_provider.dart';
import '../../cart/cart.dart';
import '../../products/components/product.dart';
import '../../products/screen/product_view.dart';
import '../../settings/payment/screens/payment.dart';


class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with TickerProviderStateMixin {
//  class car che gestisce il carello

  final Map<String, CartItem> _cartItemsProd = {};
  late List<dynamic> cartItems = [];
  // List<int> cartItemCount = [1, 1, 1, 1, 1, 1, 1, 1];
  List<int> cartItemCount = [];
  //List<int> cartItemCount = []..length;
  //List<int> cartItemCount = [0, 0, 0, 0, 0, 0, 0, 0];
  //List<int> quantity = []..length;
  //List<int> quantity = ;
  int quantityPro = 0;
  //List<int> cartItemCount = [1, 1, 1, 1, 1, 1, 1, 1];
  int totalPrice = 0;

  //Cart cart = Cart();
  //final cart = Provider.of<Cart>(context);
  //Map<String, CartItem> cartList = cart.cartItems;
  //Cart? cart;

  //final cart = Provide.of<Cart>(context);
  // late Cart myCart;
  // Map<String, CartItem> cartList = Cart.item;
  //List<dynamic> cartList = [];

  int quantity = 0;

  Cart? cart;

  Future<void> fetchItems() async {
    final String response =
        await rootBundle.loadString('../../assets/json/products.json');

    final data = await json.decode(response);
    cartItems = data['products'].map((data) => Product.fromJson(data)).toList();
    check();

    //  sumTotal();
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
      totalPrice = item.price + totalPrice;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchItems().whenComplete(() => setState(() {}));
    super.initState();
  }

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
                                  cartItems[index], index, animation),
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
                child: Image.network(
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
                Container(
                  child: Center(
                    child: Text(
                      //  cartItemCount[index].toString(),
                      // map  _cartItemsProd[index].toString(),
                      //quantityPro.toString(),
                      // cartItems[index].cart.quantity.toString(),

                      //   cart.quantity.toString(),

                    //  cartQuantity.toString(),
                      "5555",
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade800),
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
}
