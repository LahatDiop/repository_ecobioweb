import 'package:ecobioweb/cart/cart.dart';
import 'package:ecobioweb/category/detailCategory/agriculture_biologique.dart';
import 'package:ecobioweb/products/components/product.dart';
import 'package:flutter/material.dart';

import '../../commonWidgets/app_text.dart';
import '../../utils/theme/app_theme.dart';
import 'item_counter_widget.dart';



class ChartItemWidget extends StatefulWidget {


   ChartItemWidget({Key? key, required this.item, required this.index}) : super(key: key);
  // final GroceryItem item;
  ///final CartItem item;
  ///
   final Product item;

   final int index;

  @override
  _ChartItemWidgetState createState() => _ChartItemWidgetState();
}

class _ChartItemWidgetState extends State<ChartItemWidget> {
  final double height = 110;

  final Color borderColor = const Color(0xffE2E2E2);

  final double borderRadius = 18;

  List<int> amounts=AgricultureBiologique.amounts;
  final List<int> indexList=AgricultureBiologique.indexList;

  late int index;

 ItemCounterWidget itemCounterWidget =  const ItemCounterWidget();

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    // Create TabController for getting the index of current tab
    ///Implement the list tab of controller


    ///  DataLoader dataLoader= const DataLoader();
    // fetchItems(indexTab, flagItemEnabled).whenComplete(() => setState(() {}));
    fetchIndexItems().whenComplete(() => setState(() {}));
    super.initState();
  }

  Future<void> fetchIndexItems() async {

    // List<int> indexList = ItemCounterWidget.index;

    for(var amount in amounts ){

     // if(amount[newIndex]==indexList[newIndex]){
       amounts.elementAt(amount);
         amounts.indexed.elementAt(amount);
           amount=amount.toInt();
           indexList.add(amount);
           indexList.first.toInt();
     // }

    }
  }








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
            imageWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: widget.item.name,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppText(
                    text: widget.item.description,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGrey),
                const SizedBox(
                  height: 12,
                ),
                const Spacer(),

                // ItemCounterWidget(
                //   onAmountChanged: (newAmount) {
                //     setState(() {
                //       amounts[index] = newAmount;
                //     });
                //   },
                // )

                /// QUNTITY PRODUCT
                Container(
                    child: itemCounterWidget.createState().getText(
                        text: getAmount().toString(), fontSize: 18, isBold: true, color: Colors.grey.shade800
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

  Widget imageWidget() {
    return Container(
      width: 100,
      child: Image.asset(widget.item.imageURL),
    );
  }

  double getPrice() {
    ///return widget.item.price * amount;
    return widget.item.price;
  }

  getAmount() {

  }
}
