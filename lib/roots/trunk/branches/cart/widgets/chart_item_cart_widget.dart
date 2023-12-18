import 'package:flutter/material.dart';
import '../../commun_data_utils/utils/text/app_text.dart';
import '../../commun_data_utils/utils/theme/app_theme.dart';
import '../../products/components/product.dart';
import '../../products/screens/product_details_screen.dart';
import '../components/cart_item.dart';
import '../counter/screens/counter_cart_widget.dart';
import '../provider/cart_provider.dart';

class ChartItemCartWidget extends StatefulWidget {

  const ChartItemCartWidget({Key? key,  this.itemCart, this.product, this.heroSuffix}) : super(key: key);

  final CartItem? itemCart;
  final Product? product;
  final String? heroSuffix;

  @override
  _ChartItemCartWidgetState createState() => _ChartItemCartWidgetState();
}


class _ChartItemCartWidgetState extends State<ChartItemCartWidget> {


  // final double height = 110;
  final double height = 60;

  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRadius = 18;

  /// **********************************************************************************

  // static final Map<String, CartItem> cartItems = CartProvider().cartItems;

  Function? onPress;

  /// **********************************************************************************



  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 15, ),
        //  child: IntrinsicHeight(
        child: Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget> [
              /// IMAGE PRODUCT CART SCREEN
              Hero(
                tag: "GroceryItem:${widget.product!.name}-${widget.heroSuffix ?? ""}",
                child:  SizedBox(
                  //  width: MediaQuery.of(context).size.width * widthImg,
                  // height: MediaQuery.of(context).size.height * heightImg,
                 // child: imageWidget(context,widget.itemCart!.imageURL),

                 child: GestureDetector(
                            onTap: () {
                      onItemClicked(context, widget.product!);
                      },
                        child: Container(
                        //  padding: const EdgeInsets.all(10),
                          child:imageWidget(context,widget.itemCart!.imageURL),
                        ),
                      ),
                ),
              ),
              /// COUNTER CART
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      CounterCartWidget(
                        product: widget.product,
                        cartItem: widget.itemCart,
                        heroSuffix: 'counterCartWidget',
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                // flex: 3,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   /// INFO DETAIL PRODUCT
                    // Container(
                    //   // padding: const EdgeInsets.only(left: 20, right: 20),
                    //   height: 40,
                    //   width: 60,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.green.shade100,width: 1),
                    //       borderRadius: BorderRadius.circular(17),
                    //       color: Colors.green.shade100
                    //   ),
                    //   child:  Center(
                    //     child: GestureDetector(
                    //       onTap: (){
                    //         // Navigator.pop(context);
                    //         onItemClicked(context, Product(id: widget.itemCart!.id, codeProd: widget.itemCart!.codeProd, name: widget.itemCart!.name, description: widget.itemCart!.description, price: widget.itemCart!.price, quantityStock: widget.itemCart!.quantityStock, quantity: widget.itemCart!.quantity, category: widget.itemCart!.category!, imageURL: widget.itemCart!.imageURL!, image: widget.itemCart!.image!));
                    //       },
                    //       child: const Icon(
                    //         Icons.info,
                    //         color: AppColors.dark,
                    //         size: 20,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(right: 20.0),
                    // ),
                    ///PRICE CART
                    AppText(
                      //  text: "${getPrice().toStringAsFixed(2)}€",
                      text: "${CartProvider.getPrice(widget.itemCart!).toStringAsFixed(2)}€",
                      ///   text: "${CartProvider().subTotalPrice.toStringAsFixed(2)}€",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.right,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                    ),
                    Container(
                      // padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade100,width: 1),
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.green.shade100
                      ),
                      child:  Center(
                        child: GestureDetector(
                          onTap: (){
                            CartProvider.removeCartItem(widget.itemCart!);
                            // Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: AppColors.dark,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                    ),
                    ///BACK
                    // Container(
                    //   // padding: const EdgeInsets.only(left: 20, right: 20),
                    //   height: 40,
                    //   width: 60,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.green.shade100,width: 1),
                    //       borderRadius: BorderRadius.circular(17),
                    //       color: Colors.green.shade100
                    //   ),
                    //   child:  Center(
                    //     child: GestureDetector(
                    //       onTap: (){
                    //         Navigator.pop(context);
                    //         // onItemClicked(context, Product(id: widget.itemCart!.id, codeProd: widget.itemCart!.codeProd, name: widget.itemCart!.name, description: widget.itemCart!.description, price: widget.itemCart!.price, quantityStock: widget.itemCart!.quantityStock, quantity: widget.itemCart!.quantity, category: widget.itemCart!.category!, imageURL: widget.itemCart!.imageURL!, image: widget.itemCart!.image!));
                    //       },
                    //       child: const Icon(
                    //         Icons.arrow_back,
                    //         color: AppColors.dark,
                    //         size: 20,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(right: 20.0),
                    // ),

                    //   ],
                    // ),

                    const SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
            ],
          ),
        )
      //  ),
    );
  }

  Widget imageWidget(context,item) {
    return Container(
      margin: const EdgeInsets.only(right: 2,left: 2,top: 2,bottom: 0),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          borderRadius:const BorderRadius.all(Radius.circular(14)) ,
          color: Colors.blue.shade200,
          image: DecorationImage(image: AssetImage(item), fit: BoxFit.cover)),
    );
  }
  void onItemClicked(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
          product,
          heroSuffix: "cart_screen",
        ),
      ),
    );
  }


}
