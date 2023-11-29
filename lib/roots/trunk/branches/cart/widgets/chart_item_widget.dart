
import 'package:ecobioweb/category/detailCategory/agriculture_biologique.dart';
import 'package:ecobioweb/roots/trunk/branches/business/agricultures/agriculture_biological/screens/agriculture_biologique_screenOK.dart';
import 'package:ecobioweb/shopping/components/gestion_cart.dart';
import 'package:flutter/material.dart';
import '../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
import '../../commun_data_utils/utils/text/app_text.dart';
import '../../commun_data_utils/utils/theme/app_theme.dart';
import '../components/cart_item.dart';
import '../provider/cart_provider.dart';
import 'item_counter_widget.dart';



class ChartItemWidget extends StatefulWidget {


   const ChartItemWidget({Key? key,required this.itemCart}) : super(key: key);

   final CartItem itemCart;
  /// final Product product;

   @override
   _ChartItemWidgetState createState() => _ChartItemWidgetState();
}


class _ChartItemWidgetState extends State<ChartItemWidget> {


  final double height = 110;

  final Color borderColor = const Color(0xffE2E2E2);

  final double borderRadius = 18;

  List<int> amounts=AgricultureBiologiqueScreen.amounts;


  late int index;

  /// **********************************************************************************
  ///Map<String, CartItem> cartItemsMap =CartScreen.cartItems;
  final Map<String, CartItem> cartItems = CartProvider().cartItems;

 /// **********************************************************************************


 // ItemCounterWidget itemCounterWidget =   ItemCounterWidget(amount: widget.item.quantity);

  int amount=0;

  get itemCart => null;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   //super.initState();
  //   // Create TabController for getting the index of current tab
  //   ///Implement the list tab of controller
  //
  //
  //   ///  DataLoader dataLoader= const DataLoader();
  //   // fetchItems(indexTab, flagItemEnabled).whenComplete(() => setState(() {}));
  //   fetchIndexItems().whenComplete(() => setState(() {}));
  //   super.initState();
  // }

  // Future<void> fetchIndexItems() async {
  //
  //   // List<int> indexList = ItemCounterWidget.index;
  //
  //   for(var amountCart in amounts ){
  //
  //       amount=amountCart;
  //    // if(amount[newIndex]==indexList[newIndex]){
  //      amounts.elementAt(amount);
  //        amounts.indexed.elementAt(amount);
  //          amount=amount.toInt();
  //          indexList.add(amount);
  //          indexList.first.toInt();
  //    // }
  //
  //   }
  // }


 /// int? amount = ChartItemWidget(item: null,).amount.toInt();

  ///List<int> amount=AgricultureBiologique.amount;
  ///
  //List<int> amount=[];




  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: IntrinsicHeight(
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
                  text: widget.itemCart.name,
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

                // AppText(
                //     text: widget.item.quantity.toString(),
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: AppColors.darkGrey),
                // const Spacer(),
                ItemCounterWidget(
                  onAmountChanged: (newAmount) {
                    setState(() {
                      /// amount = widget.item.quantity;
                      amount =newAmount;
                      /// amount ?? newAmount;
                    });
                  }, itemCart: widget.itemCart,/// amount: widget.item.quantity,
                 // itemCart: itemCart,

                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.close,
                  color: AppColors.darkGrey,
                  size: 25,
                ),
                const Spacer(
                  flex: 5,
                ),
                Container(
                  width: 70,
                  child: AppText(
                    text: "\$${getPrice().toStringAsFixed(2)}",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.right,
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
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
    return widget.itemCart.price;
  }

  getAmount() {

  }
}
