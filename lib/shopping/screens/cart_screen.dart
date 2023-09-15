


import 'dart:ffi';

import 'package:ecobioweb/category/BrandsAgriculture/Vegetables.dart';
import 'package:ecobioweb/category/components/gestion_agriculture_bio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../cart/cart.dart';
import '../../cart/checkout_bottom_sheet.dart';
import '../../cart/widgets/chart_item_widget.dart';
import '../../category/detailCategory/agriculture_biologique.dart';
import '../../commonWidgets/app_button.dart';
import '../../helpers/column_with_seprator.dart';
import '../../products/components/product.dart';
import '../../products/screen/product_view.dart';
import '../../providers/cart_provider.dart';

class CartScreen extends StatefulWidget{
    // const CartScreen(Map<String, Product> cartItemMap, {super.key});
  const CartScreen({super.key});

  static const routeName="/cartScreen";

   /// **********************************************************************************
   static Map<String, Product> get cartItemsMaps {
     return {...cartItemsMap};
   }
   static final Map<String, Product> cartItemsMap = {};

   /// **********************************************************************************

   ///Map<String, CartItem> cartMapList = Cart().cartItems;

  /// static Map<String, CartItem> cartMapList = Cart().cartItems;

  static List<CartItem> cartList =Cart().getItemsCarts();




   @override
_CartScreenState  createState()=>_CartScreenState();


}

class _CartScreenState extends State<CartScreen>{

  /// **********************************************************************************
  ///Map<String, CartItem> cartItemsMap =CartScreen.cartItems;
  final Map<String, Product> cartItemsMap = CartScreen.cartItemsMap;
  ///   /// **********************************************************************************

  ///**********************************************************************************
  ///Agriculture Bio
  /// List<dynamic> cartItemsList = [];
  List<dynamic>? productItemsList =  GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsList;

  Map<String, Product>? productItemsMap=GestionAgricultureBio(productItemsList:  [], productItemsMap:  {},).productItemsMap;
  ///**********************************************************************************
  ///
  ///
  List<Product> cartItems = AgricultureBiologique.cartItemsProducts;
  ///List<CartItem> cartItemsMa = _cartItemsMap.values.toList();



  List<CartItem> cartList =CartScreen.cartList;

  // List<Product> productItemsList = GestionAgricultureBio().productItemsList;
  List<int> amounts = AgricultureBiologique.amounts;

  var index;


  // Map<String, CartItem> get cartItems {
  //   return {..._cartItems};
  // }


  @override
  Widget build(BuildContext context) {

    // final cart = Provider.of<Cart>(context);
    //
  ///    List cartListNew = cartList.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: const Icon(Icons.close),
        title: const Text('Back Cart',
            style: TextStyle(color: Color.fromARGB(255, 101, 243, 101))),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        key: index,
        builder: (context) {
          return ListView(
            children: <Widget>[
              createHeader(),
              createSubTitle(),
              createCartList(cartItemsMap),
              createFooter(context)

            ],

          );
        },

      ),
    );
  }

  createHeader() {
    return Container(
       alignment: Alignment.topLeft,
      child: const Text("BIENVENU CART",
        style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );

  }

  //>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
  createSubTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text("Total(3) PRODUCTS",
            style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }

  createCartList(Map<String, Product> cartItemsMap) {

    return  Stack(
       children:<Widget> [
         Container(
           margin: const EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 0),
           padding: const EdgeInsets.symmetric(horizontal: 10),
           height: MediaQuery.of(context).size.height * 0.65,
           //height: 110,
           width: MediaQuery.of(context).size.width * 90,
          decoration:  const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),

          // child: cartItems.isNotEmpty?
             child: cartItemsMap.isNotEmpty?

                    SingleChildScrollView(
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
                           children: getChildrenWithSeperator(
                             addToLastChild: false,
                           ///  widgets: cartItems.map((e) {
                            //  widgets: cartList.map((e) {
                           //  widgets: _cartItemsMap.values.toString().map((e) {
                             widgets: cartItemsMap.entries.map((e){
                                   var value=e.value;
                                   var index =e.key;
                              ///int  indexProd=cartItems.elementAt(index);
                               return Container(
                                 padding: const EdgeInsets.symmetric(
                                   horizontal: 25,
                                 ),
                                 width: double.maxFinite,
                                 child: ChartItemWidget(
                                   item: e.value,
                                   amount:e.value.quantity,
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
                        // getCheckoutButton(context)
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

  // cartItem(Product product, Cart cart, int index, animation) {
  cartItem(Product product, int index, amounts, animation) {
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
                      if (amounts[index] >= 1) {
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
                // Container(
                //     // child: itemCounterWidget.createState().getText(
                //     //     text: amounts[index].toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
                //     //   // text: productsItemCount[index].toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
                //     // )
                //
                //   /// QUNTITY PRODUCT
                //   child: Center(
                //     child: Text(amounts[index].toString(),
                //       style:
                //       TextStyle(fontSize: 20, color: Colors.grey.shade800),
                //       //  quantity_cart!.quantity.toString(),
                //     ),
                //   ),
                // ),
                //>>>>>> ADD PRODOCT IN TO THE CART <<<<<<<<<<<
                MaterialButton(
                  padding: const EdgeInsets.all(0),
                  minWidth: 10,
                  splashColor: const Color.fromARGB(255, 12, 146, 46),
                  onPressed: () {
                    setState(() {
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
  createFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children:<Widget>[
             Container(
               margin: const EdgeInsets.only(left: 30),
               child: const Text("Total",
                   style: TextStyle(fontSize: 20,color: Colors.grey, fontWeight: FontWeight.bold),
                 // style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.grey, fontSize: 12),
               ),
             )
           ],
        )
      ],
    );
  }


  /// ADD PRODUCT TO CART - SAVE PRODUCT TO LOCALSTORAGE - ADD PRODUCT INTO THE CART

  /// ==============================  INIT ADD DATA PRODUCT FROM CART MAP CART   =============================================
//  aggiunge prodotti nel carello
  void addItemCart(Product product,int index) {
//   void addItemCart(String productId, double price, String title, String imgUrl) {

    if (cartItemsMap.containsKey(product.codeProd)) {

    } else {
      cartItemsMap.putIfAbsent(product.codeProd, () =>
          Product(
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
    AgricultureBiologique.cartItemsMap.putIfAbsent(product.codeProd, () => product);
    //  cartItemCount[index]++;
    notifyListerner();
  }

  void deleteItemCart(Product product,int index, List<int> cartItemCount ) {
//   void addItemCart(String productId, double price, String title, String imgUrl) {

    if (cartItemsMap.containsKey(product.codeProd)) {

    } else {
      cartItemsMap.putIfAbsent(product.codeProd, () =>
          Product(
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
    AgricultureBiologique.cartItemsMap.putIfAbsent(product.codeProd, () => product);
    //  cartItemCount[index]++;
    notifyListerner();
  }



  void notifyListerner() {}

  /// UPDATE ITEM CART
  void incrementItemCart(Product product,int index) {
    notifyListerner();
    if (cartItemsMap.containsKey(product.codeProd)) {
      cartItemsMap.update(
          product.codeProd,
              (existingCartItem) => Product(
              id :existingCartItem.id,
              codeProd:existingCartItem.codeProd ,
              name:existingCartItem.name ,
              description:existingCartItem.description ,
              price:existingCartItem.price ,
              quantityStock:existingCartItem.quantityStock ,
              quantity:existingCartItem.quantity + 1 ,
              category:existingCartItem.category ,
              brand:existingCartItem.brand ,
              brandModel:existingCartItem.brandModel ,
              codeEan:existingCartItem.codeEan ,
              codeQr:existingCartItem.codeQr ,
              country:existingCartItem.country ,
              city:existingCartItem.city ,
              currency:existingCartItem.currency ,
              kilometer:existingCartItem.kilometer ,
              imageURL:existingCartItem.imageURL.toString() ,
              image:existingCartItem.image.toString() ,
              datePublication:DateTime.now().toString() ,
              dateUpdate:existingCartItem.dateUpdate ,
              isFavorite:existingCartItem.isFavorite,
              isEnabled:existingCartItem.isEnabled
          ));

    }
  }

  void decrementItemCart(Product product,int index) {
    notifyListerner();
    if (cartItemsMap.containsKey(product.codeProd)) {
      cartItemsMap.update(
          product.codeProd,
              (existingCartItem) => Product(
              id :existingCartItem.id,
              codeProd:existingCartItem.codeProd ,
              name:existingCartItem.name ,
              description:existingCartItem.description ,
              price:existingCartItem.price ,
              quantityStock:existingCartItem.quantityStock ,
              quantity:existingCartItem.quantity - 1 ,
              category:existingCartItem.category ,
              brand:existingCartItem.brand ,
              brandModel:existingCartItem.brandModel ,
              codeEan:existingCartItem.codeEan ,
              codeQr:existingCartItem.codeQr ,
              country:existingCartItem.country ,
              city:existingCartItem.city ,
              currency:existingCartItem.currency ,
              kilometer:existingCartItem.kilometer ,
              imageURL:existingCartItem.imageURL.toString() ,
              image:existingCartItem.image.toString() ,
              datePublication:DateTime.now().toString() ,
              dateUpdate:existingCartItem.dateUpdate ,
              isFavorite:existingCartItem.isFavorite,
              isEnabled:existingCartItem.isEnabled
          ));

    }
  }


}
    