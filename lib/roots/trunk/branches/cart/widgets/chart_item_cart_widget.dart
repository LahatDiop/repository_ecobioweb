import 'package:ecobioweb/shopping/components/gestion_cart.dart';
import 'package:flutter/material.dart';

import '../../commun_data_utils/utils/text/app_text.dart';
import '../../commun_data_utils/utils/theme/app_theme.dart';
import '../components/cart_item.dart';
import '../provider/cart_provider.dart';
import 'item_counter_cart_widget.dart';

class ChartItemCartWidget extends StatefulWidget {


   const ChartItemCartWidget({Key? key, required this.itemCart}) : super(key: key);

   final CartItem itemCart;
  /// final Product product;

   @override
   _ChartItemCartWidgetState createState() => _ChartItemCartWidgetState();
}


class _ChartItemCartWidgetState extends State<ChartItemCartWidget> {


 final double height = 110;
  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRadius = 18;

  /// **********************************************************************************

  static final Map<String, CartItem> cartItems = CartProvider().cartItems;

 /// **********************************************************************************

  @override

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: IntrinsicHeight(
        child: Expanded(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// IMAGE PRODUCT CART SCREEN
            imageWidget(widget.itemCart.imageURL),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: '${widget.itemCart.name}  ${widget.itemCart.price.toDouble()} /Kg',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppText(
                    text: widget.itemCart.description,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGrey),
                const SizedBox(
                  height: 12,
                ),
                const Spacer(),
                    ItemCounterCartWidget(
                      onAmountChanged: (newAmount) {
                    setState(() {
                     // widget.itemCart.quantity;
                      CartProvider.getAmountCartItem(widget.itemCart, widget.itemCart.quantity);
                     /// amount =newAmount;
                      /// amount ?? newAmount;
                    });
                  }, itemCart: widget.itemCart, //itemCart: widget.itemCart,  //itemCart: widget.itemCart,
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    //CartProvider.removeCartItem(widget.itemCart.id.toString());
                    Navigator.pop(context);
                  },
                  child: const Icon(
                      Icons.close,
                      color: AppColors.darkGrey,
                      size: 25,
                    ),
                ),
                const Spacer(
                  flex: 5,
                ),
                ///PRICE CART
                SizedBox(
                  width: 70,
                  child: AppText(
                  //  text: "${getPrice().toStringAsFixed(2)}€",
                    text: "${CartProvider.getPrice(widget.itemCart).toStringAsFixed(2)}€",
                   ///   text: "${CartProvider().subTotalPrice.toStringAsFixed(2)}€",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right,
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
        )
      ),
    );
  }

  Widget imageWidget(item) {
    return Container(
        margin: const EdgeInsets.only(right: 2,left: 2,top: 2,bottom: 0),
        width: 130,
        height: 100,
        decoration: BoxDecoration(
          borderRadius:const BorderRadius.all(Radius.circular(14)) ,
          color: Colors.blue.shade200,
          image: DecorationImage(image: AssetImage(item), fit: BoxFit.cover)),
    );
  }


  // Widget imageWidget() {
  //   return Container(
  //     width: 100,
  //     child: Image.asset(widget.item.imageURL),
  //   );
  // }

  double getPrice() {
    ///return widget.item.price * amount;
    return widget.itemCart.price * widget.itemCart.quantity;
  }

  getAmount() {

  }
}
