import 'package:ecobioweb/roots/trunk/branches/business/agricultures/agriculture_biological/screens/agriculture_biologique_screenOK.dart';
import 'package:ecobioweb/shopping/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import '../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
import '../../commun_data_utils/utils/theme/app_theme.dart';
import '../../products/components/product.dart';
import '../../products/screens/product_view.dart';
import '../components/cart_item.dart';
import '../provider/cart_provider.dart';


class ItemCounterWidget extends StatefulWidget {



 static List<int> amounts = AgricultureBiologiqueScreen.amounts;

 static List<Product> listProductItemsCart= AgricultureBiologiqueScreen.cartItemsProducts;
   ///final int? amount;

    const ItemCounterWidget({Key? key,this.onAmountChanged, this.itemCart}) : super(key: key);

 final CartItem? itemCart;

 final Function? onAmountChanged;

 ///final int? index;
 //final int? amount;
 ///final Product? product;

  @override
  _ItemCounterWidgetState createState() => _ItemCounterWidgetState();

 /// iconWidget(IconData add, {required iconColor, required onPressed}) {}
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {


  /// **********************************************************************************
  ///Map<String, CartItem> cartItemsMap =CartScreen.cartItems;
  final Map<String, CartItem> cartItemsMap = CartProvider().cartItems;


  ///   /// **********************************************************************************
// int amount = 0;
  // int? amount = const ItemCounterWidget().amount;

List<int> amounts = AgricultureBiologiqueScreen.amounts;
///int amount = 0;

//Map<Product, int> amountProductMap=AgricultureBiologique.amountProductMap;

List<Product> cartItems =  ShoppingCartScreen().createState().cartItems;

  var amountIndex=0;


@override


List<Product> listProductItemsCart= ItemCounterWidget.listProductItemsCart;

  CartProvider gc = CartProvider();

  @override

  @override
  Widget build(BuildContext context) {
    CartItem? cartItem =widget.itemCart;
    int? quantity = widget.itemCart?.quantity;

    return Row(
      children: [
        iconWidget(Icons.remove, iconColor: AppColors.darkGrey, onPressed: decrementAmount),
        const SizedBox(width: 18),
        /// QUANTITY CARTSCREEN
        Container(
            width: 30,
            child: Center(
                child:
                getText(
                  //  text: widget.amount.toString(), fontSize: 18, isBold: true
                    text:widget.itemCart!.quantity.toString() , fontSize: 18, isBold: true
                    // text: amount[index].toString(), fontSize: 18, isBold: true
                    // text: amounts[amount].toString(), fontSize: 18, isBold: true
                    //text: cartlist.values.toList()[amount].toString(), fontSize: 18, isBold: true
                )
            )
        ),
        const SizedBox(width: 18),
        // iconWidget(Icons.add, iconColor: AppColors.primaryColor, onPressed: incrementAmount),

        iconWidget(Icons.add, iconColor: AppColors.primaryColor,  onPressed:() => CartProvider.addItemCart(cartItem!)),

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
      // Popup onClik single row Product
      // onTap: () {
      //   if (onPressed != null) {
      //     onPressed();
      //   ///  incrementAmount();
      //         Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) =>
      //                         ProductViewPage(product: products[index])));
      //   }
      // },


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
