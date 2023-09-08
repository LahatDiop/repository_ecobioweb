
import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
// import '../../../animation/fade_animation.dart';

import '../../products/components/product.dart';
import '../../products/screen/product_view.dart';
import '../../settings/localisation/translation/components/appLocalizations.dart';
import '../../settings/payment/screens/payment.dart';


class FruitsVegetables extends StatefulWidget {
  const FruitsVegetables({Key? key}) : super(key: key);

  @override
  _FruitsVegetablesState createState() => _FruitsVegetablesState();
}

class _FruitsVegetablesState extends State<FruitsVegetables>
    with TickerProviderStateMixin {
  List<dynamic> cartItems = [];
  List<dynamic> cartItemsFruits = [];
  List<dynamic> cartItemsVegetables = [];
  List<dynamic> cartItemsFruitsVegetable = [];
  //List<int> cartItemCount =[];
  //List<int> cartItemCount = [0, 0, 0, 0, 0, 0, 0, 0];
  List<int> cartItemCount = [1, 1, 1, 1, 1, 1, 1, 1];

 // List<int> cartItemCount = []..length;
  int quantity = 0;
  //generate list number elements
  //var list = new List<int>.generate(10, (i) => i + 1);

  // ViewList 10 product of page
  //var cartItemCount = List<int>.generate(10, (index) => index + 1);
  // List<int> cartItemCount = List<int>.generate(10, (index) => index + 1);
  //List<int> cartItemCount = List<int>.generate(cartItems.length, (index) => index + 1);

  //LIST BRAND FRUITS AND VEGETABLE
  List<String> brandFruitsVegetable = [
    AppLocalizations.translate('fruitsVegetables').toString(),
    AppLocalizations.translate('fruits').toString(),
    AppLocalizations.translate('vegetables').toString()
  ];

  //int? indexTabSelected = indexTab;

  double totalPrice = 0;

  late String category;

  //static int? get indexTab => null;

  Future<void> fetchItems() async {
    final String response =
        await rootBundle.loadString('../../assets/json/products.json');
    final data = await json.decode(response);

    cartItems = data['products'].map((data) => Product.fromJson(data)).toList();

    // GET BRAND CATEGORY  FRUITS OR VERDURE
    for (var i in cartItems) {
      if (i.category == "VERDURE") {
        if (kDebugMode) {
          print(i);
          cartItemsVegetables.add(i);
          category = i.category;
        }
      } else if (i.category == "FRUTTO") {
        if (kDebugMode) {
          print(i);
          cartItemsFruits.add(i);
          category = i.category;
        }
      } else {
        cartItemsFruitsVegetable.add(i);
      }
    }

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
    // ignore: unused_local_variable
    final formatCurrency = NumberFormat.currency(locale: 'eu').format(12);

    // ----------FRUITS AND VEGETABLE ----------

    final List<Product> itemsFruitsVegetables = <Product>[];

    /*  for (int i = 0; i < itemsFruitsVegetables.length; i++) {
      if (!itemsFruitsVegetables.isEmpty) {
        //  i.
      }
    }
*/
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: const Icon(Icons.close),
        title: const Text('Frutto Verdura Bio',
            style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
         leading: const BackButton(color: Colors.black,),
      ),
      */

      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        //SearchWidget(),
        SizedBox(
          height: 20,
          child: Container(
            color: const Color(0xFFf5f6f7),
          ),
        ),
        // _buildFoodCard(
        //      '../assets/images/frutto/avocado.png',
        //     '\$18.78',
        //     'Big single avocado fresh imported fruits from the Mexican Avocado collection',
        //   '0xFF57874E'),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height * 0.50,
          // height: MediaQuery.of(context).size.height * 0.40,
          child: cartItems.isNotEmpty ?
        //  FadeAnimation(1.4,
                  AnimatedList(
                      scrollDirection: Axis.vertical,
                      initialItemCount: cartItems.length,
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
                                  totalPrice = totalPrice -
                                      (int.parse(cartItems[index]
                                              .price
                                              .toString()) *
                                          cartItemCount[index]);

                                  AnimatedList.of(context).removeItem(index,
                                      (context, animation) {
                                    return cartItem(cartItems[index], index,
                                        category, animation);
                                  });

                                  cartItems.removeAt(index);
                                  cartItemCount.removeAt(index);
                                });
                              },
                            ),
                          ],
                          child: cartItem(
                              cartItems[index], index, category, animation),
                        );
                      })
               // )
              : Container(),
        ),
        const SizedBox(height: 30),
      //  FadeAnimation(
         // 1.2,
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
      //  ),
       // FadeAnimation(
            //1.3,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DottedBorder(
                  color: Colors.grey.shade400,
                  dashPattern: const [10, 10],
                  padding: const EdgeInsets.all(0),
                  child: Container()),
            ),
        //),
        //FadeAnimation(
           // 1.3,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Total', style: TextStyle(fontSize: 20)),
                  Text('€ ${totalPrice + 5.99}',
                      //  NumberFormat.currency(locale: 'eu', symbol: '€').format(totalPrice + 5.99),
                      // 123.456,00 ?t({totalPrice + 5.99}),
                      // Text('€ ${totalPrice + 5.99}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ),
        //),
        const SizedBox(height: 10),
       // FadeAnimation(
          //  1.4,
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
           //   )
      ]),
      // ),
    );
  }

  cartItem(Product product, int index, category, animation) {
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
                      // cartItemCount[index].toString(),
                      quantity.toString(),
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
                      totalPrice == totalPrice + product.price;
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

Widget _buildFoodCard(
    String imgPath, String price, String desc, String cardColor) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
        height: 100.0,
        width: 200.0,
        decoration: BoxDecoration(
            color: Color(int.parse(cardColor)),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(children: [
          const SizedBox(height: 15.0),
          Image.asset(imgPath, fit: BoxFit.cover, height: 100.0),
          const SizedBox(height: 10.0),
          Text(
            price,
            style: const TextStyle(
                fontFamily: 'Quicksand', color: Colors.white, fontSize: 20.0),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Text(desc,
                style: const TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.white,
                    fontSize: 12.0)),
          ),
          const SizedBox(height: 15.0),
          InkWell(
              onTap: () {},
              child: Container(
                height: 30.0,
                width: 125.0,
                decoration: BoxDecoration(
                    color: const Color(0xFF89AC83),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(
                  child: Text(
                    AppLocalizations.translate("addToCard")
                        .toString()
                        .toUpperCase(),
                    style: const TextStyle(
                        fontFamily: 'Quicksand', color: Colors.white),
                  ),
                ),
              ))
        ])),
  );
}
