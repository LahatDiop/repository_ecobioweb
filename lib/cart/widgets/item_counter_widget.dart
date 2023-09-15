import 'dart:ffi';

import 'package:ecobioweb/category/detailCategory/agriculture_biologique.dart';
import 'package:ecobioweb/shopping/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiver/collection.dart';
import '../../products/components/product.dart';
import '../../shopping/screens/cart_screen.dart';
import '../../utils/theme/app_theme.dart';

class ItemCounterWidget extends StatefulWidget {



 static List<int> amounts = AgricultureBiologique.amounts;

  static List<Product> listProductItemsCart= AgricultureBiologique.cartItemsProducts;
   ///final int? amount;

    const ItemCounterWidget({Key? key,this.index, this.amount, this.onAmountChanged, this.product}) : super(key: key);

 final Function? onAmountChanged;

 final int? index;
 final int? amount;
 final Product? product;

  @override
  _ItemCounterWidgetState createState() => _ItemCounterWidgetState();

 /// iconWidget(IconData add, {required iconColor, required onPressed}) {}
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {


  /// **********************************************************************************
  ///Map<String, CartItem> cartItemsMap =CartScreen.cartItems;
  final Map<String, Product> cartItemsMap = CartScreen.cartItemsMap;

  CartScreen cartScreen = const CartScreen();

  ///   /// **********************************************************************************
// int amount = 0;
  // int? amount = const ItemCounterWidget().amount;

List<int> amounts = AgricultureBiologique.amounts;
///int amount = 0;

//Map<Product, int> amountProductMap=AgricultureBiologique.amountProductMap;

List<Product> cartItems = const ShoppingCartScreen().createState().cartItems;

  var amountIndex=0;


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
//     amount=amountCart;
//
//     amountIndex=amountCart;
//     // // if(amount[newIndex]==indexList[newIndex]){
//     // amounts.elementAt(amount);
//     // amounts.indexed.elementAt(amount);
//     // amount=amount.toInt();
//     // indexList.add(amount);
//     // indexList.first.toInt();
//     // // }
//
//   }
// }



List<Product> listProductItemsCart= ItemCounterWidget.listProductItemsCart;


    int indexCartProd =0;



 /// int amount = widget.amount.toInt();




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
  //   for(var newIndex in amounts ){
  //
  //    // if(amount[newIndex]==indexList[newIndex]){
  //          index=newIndex.toInt();
  //    // }
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    // final cart = Provider.of<Product>(context);
    // final cartlist=cart.codeProd;

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
        /// QUANTITY CARTSCREEN
        Container(
            width: 30,
            child: Center(
                child:
                getText(
                    text: widget.amount.toString(), fontSize: 18, isBold: true

                    // text: amount[index].toString(), fontSize: 18, isBold: true
                    // text: amounts[amount].toString(), fontSize: 18, isBold: true
                    //text: cartlist.values.toList()[amount].toString(), fontSize: 18, isBold: true
                )
            )
        ),
        const SizedBox(width: 18),
        iconWidget(Icons.add,
            iconColor: AppColors.primaryColor, onPressed:(){
             setState(() {

               for(var value in cartItemsMap.entries){
                 int amount=value.value.quantity;
                 Product product=value.value;
                 int index=value.key.length;

                 var _list =cartItemsMap.values.toList();
                /// var index2= _list[1];


                 AgricultureBiologique().createState().incrementAmount(index,product,value.value.quantity);
               }
              /// AgricultureBiologique().createState().incrementAmount(widget.index!.toInt(),widget.product!,widget.amount);
                incrementAmount(widget.amount, widget.product);
             });
            }
            )
        // iconWidget(Icons.add,
        //     iconColor: AppColors.primaryColor, onPressed:(){
        //       setState(() {
        //        incrementAmount(widget.amount, widget.product);
        //     });
        // })
      ],
    );
  }

  void incrementAmount(amount, product) {
   // setState(() {
      amount = amount + 1;
      // AgricultureBiologique().createState().incrementAmount(index,product, amount);

      /// 2- INCREMENT PRODUCT QUANTITY INTO THE CART
     // cartScreen.createState().incrementItemCart(cartItemsMap, index) ;

     /// updateParent(amount, product);
   // }
   // );
  }

  void decrementAmount(int amount,Product product) {
    if (amount <= 0) return;
    setState(() {
      amount = amount - 1;
      updateParent(amount,product);
    });
  }

  void incrementAmount2(int index) {
    //index=[indexProd];




   // index.add(amount[indexProd]);
       //  updateParent(index);
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

void decrementAmount22(int indexProd) {

  amounts[indexProd] = (amounts[indexProd] - 1);


  ///index.add(amount[indexProd]);
 //  updateParent(indexProd);
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

  void updateParent(amount,product) {
    if (widget.onAmountChanged != null) {
         widget.onAmountChanged!(amount);
       ///widget.onAmountChanged!(amounts[amount]);
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
    int? index,
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
