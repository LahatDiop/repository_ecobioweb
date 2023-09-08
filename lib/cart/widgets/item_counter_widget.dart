import 'dart:ffi';

import 'package:ecobioweb/category/detailCategory/agriculture_biologique.dart';
import 'package:ecobioweb/shopping/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:quiver/collection.dart';
import '../../products/components/product.dart';
import '../../utils/theme/app_theme.dart';

class ItemCounterWidget extends StatefulWidget {
  final Function? onAmountChanged;


 static List<int> amount = AgricultureBiologique.amounts;
  static List<int> indexList = AgricultureBiologique.indexList;
  static List<Product> listProductItemsCart= AgricultureBiologique.cartItemsProducts;
   ///final int? amount;

   const ItemCounterWidget({Key? key, this.onAmountChanged}) : super(key: key);

  @override
  _ItemCounterWidgetState createState() => _ItemCounterWidgetState();

 /// iconWidget(IconData add, {required iconColor, required onPressed}) {}
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {


// int amount = 1;
// int amount = 0;
  // int? amount = const ItemCounterWidget().amount;

List<int> amounts = AgricultureBiologique.amounts;
List<Product> cartItems = const ShoppingCartScreen().createState().cartItems;


  // int amount = 0;
// int index =0;
  List<int> indexList = ItemCounterWidget.indexList;

List<Product> listProductItemsCart= ItemCounterWidget.listProductItemsCart;


    int indexCartProd =0;

  var index;



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

    for(var newIndex in amounts ){

     // if(amount[newIndex]==indexList[newIndex]){
           index=newIndex.toInt();
     // }

    }
  }

  @override
  Widget build(BuildContext context) {

    // return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: cartItems.length,
    //     itemBuilder: (context,index){
    //       return Row(
    //         children: [
    //           iconWidget(Icons.remove,
    //               iconColor: AppColors.darkGrey,index: index, onPressed: decrementAmount),
    //           const SizedBox(width: 18),
    //           Container(
    //               width: 30,
    //               child: Center(
    //                   child: getText(
    //                     // text: amount[index].toString(), fontSize: 18, isBold: true
    //                       text: amounts[index].toString(), fontSize: 18, isBold: true
    //                   )
    //               )
    //           ),
    //           const SizedBox(width: 18),
    //           iconWidget(Icons.add,
    //               iconColor: AppColors.primaryColor, onPressed: incrementAmount)
    //         ],
    //       );
    //     });

    return Row(
      children: [
        iconWidget(Icons.remove,
            iconColor: AppColors.darkGrey, onPressed: decrementAmount),
        const SizedBox(width: 18),
        Container(
            width: 30,
            child: Center(
                child: getText(
                    // text: amount[index].toString(), fontSize: 18, isBold: true
                    text: amounts[index].toString(), fontSize: 18, isBold: true
                )
            )
        ),
        const SizedBox(width: 18),
        iconWidget(Icons.add,
            iconColor: AppColors.primaryColor, onPressed: incrementAmount)
      ],
    );
  }

  void incrementAmount(int index) {
    //index=[indexProd];


    indexCartProd= amounts[index];
    indexList.add(amounts[index]);
   // index.add(amount[indexProd]);
   /// updateParent(indexProd);
    // updateParent();
    // //setState(() {
    //   for (var amountCart in AgricultureBiologique.amount){
    //     if(amountCart==index){
    //        amount[index] = (amount[index] + 1);
    //      // updateParent();
    //     }
    //   }
    //   // amount = (amount + 1);
    //   // updateParent();
    // //});
  }

void decrementAmount(int indexProd) {

  amounts[indexProd] = (amounts[indexProd] - 1);

  indexList.add(amounts[indexProd]);
  ///index.add(amount[indexProd]);
  /// updateParent(indexProd);
  // setState(() {
  //   for (var amountCart in AgricultureBiologique.amount ){
  //     if(amountCart==indexProd){
  //       amount[indexProd] = (amount[indexProd] - 1);
  //      // updateParent();
  //     }
  //   }
    // amount = (amount - 1);
    // updateParent();
  // });
}

  // void decrementAmountSingle() {
  //   if (amount! <= 0) return;
  //   setState(() {
  //     amount = (amount- 1);
  //     updateParent();
  //   });
  // }

  void updateParent(int indexProd) {
    if (widget.onAmountChanged != null) {
      widget.onAmountChanged!(amounts[indexProd]);
    }
  }

  Widget iconWidget(IconData iconData, {Color? iconColor, int? index, onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        ///  incrementAmount();
        }
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: const Color(0xffE2E2E2),
          ),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: iconColor ?? Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }

  Widget getText({
    required String text,
    required double fontSize,
    bool isBold = false,
    color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }


}
