import 'package:ecobioweb/roots/trunk/branches/business/agricultures/agriculture_biological/screens/agriculture_biologique_screenOK.dart';
import 'package:ecobioweb/shopping/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import '../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
import '../../commun_data_utils/utils/theme/app_theme.dart';
import '../../products/components/product.dart';
import '../components/cart_item.dart';
import '../provider/cart_provider.dart';

class ItemCounterCartWidget extends StatefulWidget {



 static List<int> amounts = AgricultureBiologiqueScreen.amounts;

  static List<Product> listProductItemsCart= AgricultureBiologiqueScreen.cartItemsProducts;
   ///final int? amount;

     ItemCounterCartWidget({Key? key,this.onAmountChanged, required this.itemCart}) : super(key: key);

 // final CartItem? itemCart = CartProvider().cartItem;
 final CartItem itemCart ;

 final Function? onAmountChanged;

 ///final int? index;
 //final int? amount;
 ///final Product? product;

  @override
  _ItemCounterCartWidgetState createState() => _ItemCounterCartWidgetState();

 /// iconWidget(IconData add, {required iconColor, required onPressed}) {}
}

class _ItemCounterCartWidgetState extends State<ItemCounterCartWidget> {


  /// **********************************************************************************
  ///Map<String, CartItem> cartItemsMap =CartScreen.cartItems;
  final Map<String, CartItem> cartItemsMap = CartProvider().cartItems;

  // CartScreen cartScreen =  CartScreen();

  ///   /// **********************************************************************************
// int amount = 0;
  // int? amount = const ItemCounterCartWidget().amount;

List<int> amounts = AgricultureBiologiqueScreen.amounts;
///int amount = 0;

//Map<Product, int> amountProductMap=AgricultureBiologique.amountProductMap;

List<Product> cartItems = const ShoppingCartScreen().createState().cartItems;

  var amountIndex=0;

List<Product> listProductItemsCart= ItemCounterCartWidget.listProductItemsCart;



@override
  Widget build(BuildContext context) {
 CartItem? cartItem =widget.itemCart;
 int? quantity = widget.itemCart.quantity;
    return Row(
      children: [
        iconWidget(context,Icons.remove, iconColor: AppColors.darkGrey, onPressed:() =>decrementAmount(context,cartItem,quantity)),
        const SizedBox(width: 20),
        /// QUANTITY CARTSCREEN
        SizedBox(
            width: 35,
            child: Center(
                child:
                getText(
                  text:CartProvider.getAmount(newCartItems(widget.itemCart),widget.itemCart.quantity).toString() ,fontSize: 15, isBold: true,
                    //text:widget.itemCart.quantity.toString() , fontSize: 15, isBold: true

                )
            )
        ),

        const SizedBox(width: 18),
        iconWidget(context, Icons.add, iconColor: AppColors.primaryColor, onPressed:() => incrementAmount(context)),

        // const SizedBox(width: 18),
        // iconWidget(Icons.add,
        //     iconColor: AppColors.primaryColor, onPressed:(){
        //      setState(() {
        //
        //        for(var value in cartItemsMap.entries){
        //          int amount=value.value.quantity;
        //         // Product product=value.value;
        //          int index=value.key.length;
        //
        //          var _list =cartItemsMap.values.toList();
        //         /// var index2= _list[1];
        //
        //
        //      ///    AgricultureBiologique().createState().incrementAmount(index,product,value.value.quantity);
        //        }
        //       /// AgricultureBiologique().createState().incrementAmount(widget.index!.toInt(),widget.product!,widget.amount);
        //         incrementAmount(widget.amount, widget.product);
        //      });
        //     }
        //     )
        // iconWidget(Icons.add,
        //     iconColor: AppColors.primaryColor, onPressed:(){
        //       setState(() {
        //        incrementAmount(widget.amount, widget.product);
        //     });
        // })
      ],
    );
  }

   newCartItems(CartItem cartItem) {

    Product product = Product(
        id: cartItem.id,
        codeProd: cartItem.codeProd,
        name: cartItem.name,
        description: cartItem.description,
        price: cartItem.price,
        quantityStock: cartItem.quantityStock,
        quantity: cartItem.quantity,
        category: cartItem.category.toString(),
        imageURL: cartItem.imageURL.toString(),
        image: cartItem.image.toString());

    return product;
  }

  ///  - INCREMENT PRODUCT QUANTITY INTO THE CART
  void incrementAmount(BuildContext context) {
    setState(() {
      CartProvider.updateItemCart(widget.itemCart);
         updateParent(widget.itemCart);

    });
  }

  void decrementAmount(BuildContext context,CartItem cartItem,int quantity){

    setState(() {
      Product prod= CartProvider().findById(widget.itemCart.codeProd);

      if(prod.quantity <=0){
        return;
      }else {
        // get prod from map
        CartProvider.decrementItemCart(widget.itemCart);
        updateParent(widget.itemCart);

      }
    });



    // else if(quantity==1){
    //
    //   setState(() {
    //    // CartProvider.removeCartItem(widget.itemCart);
    //     CartProvider.decrementItemCart(widget.itemCart);
    //     updateParent(widget.itemCart);
    //     //  CartProvider.removeCartItem(widget.itemCart.id.toString());
    //   });
    // //     CartProvider.removeCartItem(widget.itemCart);
    // // //  CartProvider.removeCartItem(widget.itemCart.id.toString());
    // }else {
    //   setState(() {
    //     CartProvider.decrementItemCart(widget.itemCart);
    //
    //     updateParent(widget.itemCart);
    //   });
    // }
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

  void updateParent(CartItem cartItem) {
    if (widget.onAmountChanged != null) {
         widget.onAmountChanged!(cartItem.quantity);
       ///widget.onAmountChanged!(amounts[amount]);
    }
  }

  Widget iconWidget(BuildContext context,IconData iconData, {Color? iconColor, int? index, onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        ///  incrementAmount();
        }
      },
      child: Container(
        height: 40,
        width: 40,
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
