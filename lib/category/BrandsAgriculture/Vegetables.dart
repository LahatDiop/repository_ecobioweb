import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';


import '../../roots/trunk/branches/menu/menu_settings/settings/payment/screens/payment.dart';
import '../../roots/trunk/branches/products/components/product.dart';
import '../../roots/trunk/branches/products/screens/product_view.dart';


class Vegetables extends StatefulWidget {
  Vegetables({selectedIndex? selectedIndex, Key? key}) : super(key: key);

  @override
  _VegetablesState createState() => _VegetablesState();
  dynamic selectedIndss = selectedIndex;
}

mixin selectedIndex {
  int selectedIndexTab = selectedIndex as int;
}

class _VegetablesState extends State<Vegetables> with TickerProviderStateMixin {
  List<dynamic> cartItems = [];
  List<dynamic> cartItemsList = [];
  List<dynamic> cartItemsFruits = [];
  List<dynamic> cartItemsVegetables = [];
  List<dynamic> cartItemsFruitsVegetable = [];
  //List<int> cartItemCount =[];
  List<int> cartItemCount = [0, 0, 0, 0, 0, 0, 0, 0];

  late String category;
  //generate list number elements
  //var list = new List<int>.generate(10, (i) => i + 1);

  // ViewList 10 product of page
  //var cartItemCount = List<int>.generate(10, (index) => index + 1);
  // List<int> cartItemCount = List<int>.generate(10, (index) => index + 1);
  //List<int> cartItemCount = List<int>.generate(cartItems.length, (index) => index + 1);

  double totalPrice = 0;

  late String tabName;

  Future<void> fetchItems() async {
    final String response =
        await rootBundle.loadString('../../assets/json/products.json');
    final data = await json.decode(response);

    cartItemsList =
        data['products'].map((data) => Product.fromJson(data)).toList();

    //var indexTab = _controller.index.toString();

    /*int indexTab = selectedIndexTab;
    switch (indexTab) {
      case 0:
        tabName = "fruitsVegetables";
        break;
      case 1:
        tabName = "fruits";
        break;
      case 2:
        tabName = "vegetables";
        break;
      default:
    }
    */

    for (var i in cartItemsList) {
      if (i.category == "VERDURE") {
        cartItemsVegetables.add(i);
        category = i.category;
        cartItems.add(i);
      } else if (i.category == "FRUTTO") {
        cartItemsFruits.add(i);
        category = i.category;
        // cartItems.clear();
      } else {
        cartItemsFruitsVegetable.add(i);
      }
    }

    // cartItemCount.add(cartItems);

    //cartItemCount = cartItems.length as List<int>;

    //List<int> cartItemCount = [cartItems.length];
    //cartItemCount = List<int>.generate(cartItems.length, (index) => index + 1);

    //  cartItemCount = List<int>.generate(cartItems.length, (index) => index + 1);

    //for (var i in cartItems) {
    //  cartItemCount[i]=cartItems.;
    /// }

    // CALCULATED TOTAL PRICE
    //  sumTotal();
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
  }

  @override
  Widget build(BuildContext context) {
    //List<int> cartItemCount =List<int>.generate(cartItems.length, (index) => index + 1);
    //final formatCurrency = NumberFormat.simpleCurrency();
    //final formatCurrency = new NumberFormat("#,##0.00", "eu_$");
    final formatCurrency = NumberFormat.currency(locale: 'eu').format(12);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: const Icon(Icons.close),
        title: const Text('Verdure Biologica',
            style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        //SearchWidget(),
        SizedBox(
          height: 10,
          child: Container(
            color: const Color(0xFFf5f6f7),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //height: MediaQuery.of(context).size.height * 0.50,
          height: MediaQuery.of(context).size.height * 0.40,
          child: cartItems.isNotEmpty?
         // FadeAnimation(
                  //1.4,
                  AnimatedList(
                      scrollDirection: Axis.vertical,
                      initialItemCount: cartItems.length,
                      itemBuilder: (context, index, animation) {
                        return Slidable(
                          //key: UniqueKey(),
                          //actionPane: const SlidableDrawerActionPane(),
                          // secondaryActions: [
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
                                  //totalPrice = totalPrice -(int.parse(cartItems[index].price.toString()) *cartItemCount);

                                  AnimatedList.of(context).removeItem(index,
                                      (context, animation) {
                                    return cartItem(
                                        cartItems[index], index, animation);
                                  });

                                  cartItems.removeAt(index);
                                  //cartItemCount.removeAt(index);
                                });
                              },
                            ),
                          ],
                          child: cartItem(cartItems[index], index, animation),
                        );
                      })
                //)
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
                Text(' 5.99 €',
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
            ),
          //),
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
          //  )
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
                splashColor: Colors.yellow[700],
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
            )
        //)
      ]),
      // ),
    );
  }

  cartItem(Product product, int index, animation) {
    // LIMITI THE LIST INDEX 12,12,.... OR cartItems.length
    // List<int> cartItemCount = List<int>.generate(cartItems.length, (index) => index + 1);

    // CLEAR THE LIST CARTCOUNTITEM EQUAL 0 IF NOTE SELECTED PRODOCT
    //List<int> cartItemCount =  List<int>.generate(cartItems.length, (index) => index + 0);

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
                      '€ ${product.price}',
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
                        cartItemCount[index]--;
                        totalPrice == totalPrice - product.price;
                      }
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
                Container(
                  child: Center(
                    child: Text(
                      cartItemCount[index].toString(),
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
                      cartItemCount[index]++;
                      // totalPrice = totalPrice + product.price;
                      totalPrice = (totalPrice + product.price);
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
}
