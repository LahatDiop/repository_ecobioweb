
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
import '../../business/honey/honet_Propolis_bio/provider/honey_biological_provider.dart';
import '../../commun_data_utils/utils/button/app_button.dart';
import '../../commun_data_utils/utils/text/app_text.dart';
import '../../commun_data_utils/utils/columns/column_with_seprator.dart';
import '../../commun_data_utils/utils/theme/app_theme.dart';
import '../../favorites/screens/favourite_screen.dart';
import '../../favorites/screens/filter_screen.dart';
import '../../localisation/translation/components/appLocalizations.dart';
import '../../menu/menu_settings/settings/payment/screens/payment.dart';
import '../../products/components/product.dart';
import '../checkout_bottom_sheet.dart';
import '../components/cart_item.dart';
import '../provider/cart_provider.dart';
import '../widgets/chart_item_cart_widget.dart';


class CartScreen extends StatefulWidget{

    Map<String, CartItem> cartItems=CartProvider().cartItems;
    List<CartItem> carts =CartProvider().carts;

  var description;

  var quantity;
  var itemCart;

  // const  CartScreen(Map<String, CartItem>? cartItemsMap, {Key? key}) : super(key: key);
    CartScreen({Key? key}) : super(key: key);

  ///static const routeName="/cartScreen";
   @override
_CartScreenState  createState()=>_CartScreenState();


}

class _CartScreenState extends State<CartScreen>{

  // Map<String, CartItem> cartItems=CartProvider().cartItems ;
  //
  // List<CartItem> cartList =CartProvider().carts;


  Map<String, CartItem> cartItems=CartScreen().cartItems;

  List<CartItem> carts =CartScreen().carts;

  TextEditingController textInputSearch =  TextEditingController();
   List<Product> products = [];

  @override
  Widget build(BuildContext context) {


    return MultiProvider(providers:  [
      ChangeNotifierProvider<CartProvider>(create: (_)=>CartProvider()),
      ChangeNotifierProvider<AgricultureBiologicalProvider>(create: (_) => AgricultureBiologicalProvider()),
    ],
      child: Navigator(onGenerateRoute: (RouteSettings settings){

        return MaterialPageRoute(builder: (context){
          return CartScreen();
        });
      },),

      builder: (context,child){
        int tabIndex=0;
        final cartProvider=Provider.of<CartProvider>(context);
        var listProducts= context.read<AgricultureBiologicalProvider>().getData(tabIndex);

        cartItems=context.read<CartProvider>().cartItems;
        //  products =context.read<CartProvider>().products;
        products =context.read<CartProvider>().getProducts();


        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 25),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilterScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.sort,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: ( ) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavouriteScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.shopping_cart_checkout,
                    color: AppColors.greenColor,
                  ),
                ),
              ),
            ],
            ///Search
            title: TextField(
              controller:textInputSearch ,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  filled: true,
                  // fillColor: Colors.white70,
                  fillColor: Colors.green.shade100,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    // borderSide:  const BorderSide(color: Colors.white),
                    borderSide:  const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:  const BorderSide(color: Colors.white),
                    borderRadius:  BorderRadius.circular(25.7),
                  ),

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

          ),

          // resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.grey.shade100,
          body: Builder(
            ///key: index,
            builder: (context) {
              return ListView(
                children: <Widget>[
                  createHeader(),
                  //createSubTitle(),
                  createCartList(cartItems,context),
                  //  createFooter(context),
                  //createCheckout(context),

                ],

              );
            },

          ),
        );
      },
    );


  }


  @override
  Widget build1(BuildContext context) {
    // var listProductsBioHoney= context.read<CartProvider>().getData(1);
    // products =context.read<CartProvider>().products;
    // final cart = Provider.of<Cart>(context);
    //
  ///    List cartListNew = cartList.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 25),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(right: 25),
              child: const Icon(
                Icons.sort,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: ( ) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouriteScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(right: 25),
              child: const Icon(
                Icons.favorite,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(right: 25),
              child: const Icon(
                Icons.shopping_cart_checkout,
                color: AppColors.greenColor,
              ),
            ),
          ),
        ],
        ///Search
        title: TextField(
          controller:textInputSearch ,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              filled: true,
              // fillColor: Colors.white70,
              fillColor: Colors.green.shade100,
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                // borderSide:  const BorderSide(color: Colors.white),
                borderSide:  const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:  const BorderSide(color: Colors.white),
                borderRadius:  BorderRadius.circular(25.7),
              ),

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

      ),

      // resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.grey.shade100,
      body: Builder(
        ///key: index,
        builder: (context) {
          return ListView(
            children: <Widget>[
              createHeader(),
              //createSubTitle(),
              createCartList(cartItems,context),
             //  createFooter(context),
              //createCheckout(context),

            ],

          );
        },

      ),
    );
  }

  //createHeader() {
  //   return Container(
  //      alignment: Alignment.topLeft,
  //     child: const Text("BIENVENU CART",
  //       style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
  //     ),
  //   );
  //
  // }

  /// Agriculture Biodynamic header
  Widget createHeader() {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      alignment: Alignment.topLeft,
      child:
      Text(
        AppLocalizations.translate('welcome').toString().toUpperCase(),
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Agriculture Biodynamic
  createSubTitle() {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      alignment: Alignment.topLeft,
      child:
      Text(
        AppLocalizations.translate('cart').toString(),
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ),
    );
  }

  //>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
  createSubTitle2() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text("Total(3) PRODUCTS",
            style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }

   Widget createCartList(Map<String, CartItem> cartItems, BuildContext context) {

    return  Stack(
       children:<Widget> [
         Container(
           margin: const EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 0),
           padding: const EdgeInsets.symmetric(horizontal: 10),
           height: MediaQuery.of(context).size.height * 0.72,
           //height: 110,
           width: MediaQuery.of(context).size.width * 90,
          decoration:  const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),

          // child: cartItems.isNotEmpty?
             child: cartItems.isNotEmpty?

                    SingleChildScrollView(
                     child: Column(
                       children: [
                         const SizedBox(
                           height: 25,
                         ),
                         // const Text(
                         //   "My Cart",
                         //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                         // ),

                         Text(
                           AppLocalizations.translate('cart').toString().toUpperCase(),
                           style: const TextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontFamily: 'Quicksand',
                               fontWeight: FontWeight.bold),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Column(
                           children: getChildrenWithSeperator(
                             addToLastChild: false,
                           ///  widgets: cartItems.map((e) {
                            //  widgets: cartList.map((e) {
                           //  widgets: _cartItemsMap.values.toString().map((e) {
                             widgets: cartItems.entries.map((e){
                                   var value=e.value;
                                   var index =e.key;
                              ///int  indexProd=cartItems.elementAt(index);
                               return Container(
                                 padding: const EdgeInsets.symmetric(
                                   horizontal: 25,
                                 ),
                                 width: double.maxFinite,
                                 child: ChartItemCartWidget(
                                   itemCart: e.value,
                                  /// evalue,
                                   //itemCart: e.value,
                                   ///amount:e.value.quantity,
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
                             ),
                           ),
                         ),
                         const Divider(
                           thickness: 1,
                         ),
                        // createFooter(context),
                        getCheckoutButton(context)
                       ],
                     ),
             ):Container()
         )


               // Container(
               //   margin: const EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 0),
               //   width: 80,
               //   height: 80,
               //   decoration: BoxDecoration(
               //     borderRadius:const BorderRadius.all(Radius.circular(14)) ,
               //     color: Colors.blue.shade200,
               //     image: const DecorationImage(image: AssetImage("images/shoes_1.png"))
               //   ),
               // ),
               // Expanded(
               //     child: Container(
               //       padding: const EdgeInsets.all(8.0),
               //       child: Column(
               //         mainAxisSize: MainAxisSize.max,
               //         crossAxisAlignment: CrossAxisAlignment.start,
               //         children:<Widget> [
               //           Container(
               //             padding: const EdgeInsets.only(right: 8, top: 4),
               //             child: const Text("Carote", maxLines: 2, softWrap: true,
               //               style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
               //             ),
               //           )
               //         ],
               //       ),
               //     )
               //
               // )


              ],
           );


  }


  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "Go To Check Out",
        fontWeight: FontWeight.w600,
        padding: const EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(context),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }
  Widget getButtonPriceWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xff489E67),
        borderRadius: BorderRadius.circular(4),
      ),
      child:  Text(
         CartProvider().totalPrice.toStringAsFixed(2).toString(),
       // "\$12.96",
        style: const TextStyle(fontWeight: FontWeight.w600),
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
Widget createFooter(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Container(
            margin: const EdgeInsets.only(left: 30),
            child:
            AppText(
              //text: "Total: ${CartProvider.totalPriceTotal().toStringAsFixed(2)}€",
              // text: "${getPrice().toStringAsFixed(2)}€",
               text: "Total: ${CartProvider().totalPrice.toStringAsFixed(2)}€",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.right,
            ),
          ),

        ],
      )
    ],
  );

  // return GestureDetector(
  //
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: <Widget>[
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:<Widget>[
  //           Container(
  //             margin: const EdgeInsets.only(left: 30),
  //             child:
  //             AppText(
  //               // text: "${getPrice().toStringAsFixed(2)}€",
  //               text: "Total: ${CartProvider().totalPrice.toStringAsFixed(2)}€",
  //               fontSize: 16,
  //               fontWeight: FontWeight.bold,
  //               textAlign: TextAlign.right,
  //             ),
  //           ),
  //
  //         ],
  //       )
  //     ],
  //   )
  // );

  }
  createCheckout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[

           // const SizedBox(height: 10),
            // FadeAnimation( 1.4,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentPage(totalPrice: CartProvider().totalPrice)));
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
                    "Checkout",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }



}
