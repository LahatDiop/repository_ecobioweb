
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../../business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../../commun_data_utils/utils/theme/app_theme.dart';
import '../../../favorites/screens/filter_screen.dart';
import '../../../products/components/product.dart';
import '../../components/cart_item.dart';
import '../../provider/cart_provider.dart';
import '../../screens/cart_screen.dart';

/// CLASS FOR MANAGING COUNTER CART APP
class CounterCartWidget extends StatelessWidget{

  CounterCartWidget({super.key, this.product, this.heroSuffix, this.cartItem, });

  final Product? product;
 final CartItem? cartItem;
  final String? heroSuffix;
  Function? onPressed;


  //Map<String, CartItem> cartItems=CartScreen().cartItems;
  // List<CartItem> carts =CartScreen().carts;

  Map<String, CartItem> cartItems=CartProvider().cartItems;
  List<CartItem> carts =CartProvider().carts;

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
          return CounterCartWidget(product: product);
        });
      },),

      builder: (context,child){
        int tabIndex=0;
       final cartProvider=Provider.of<CartProvider>(context);
        final AgricultureBioProvider=Provider.of<AgricultureBiologicalProvider>(context);
       /// var listProducts= context.read<AgricultureBiologicalProvider>().getData(tabIndex);

        cartItems=context.read<CartProvider>().cartItems;
        //  products =context.read<CartProvider>().products;
        products =context.read<CartProvider>().getProducts();


        return  GestureDetector(
          onTap: () {
            if (onPressed != null) {
                 onPressed;
              }
          },
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              ///DECREMENT AMOUNT CARSCREEN
              iconWidgetDecrement( product!,Icons.remove, iconColor: AppColors.darkGrey,
                  onPressed:(){
                    // int index=product.id;
                    // product!.quantity--;
                    Product prod= CartProvider().findById(product!.codeProd);

                    if(prod.quantity <=0){
                      return;
                    }else {
                      // get prod from map
                      CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(product!));

                      if(!CartProvider.productItems.containsKey(product!.codeProd)){
                        CartProvider.productItems.putIfAbsent(product!.codeProd, () => product!) ;
                      }else {
                        //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
                        CartProvider.productItems.update(product!.codeProd, (value) => product!);
                      }
                    }
                    // CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(product));

                    // decrementAmount(context,CartProvider().newCartItemsproduct!(product),item.quantity);
                  }

              ),
              const SizedBox(width: 12),
              /// QUANTITY CARTSCREEN
              SizedBox(
                  width: 30,
                  child: Center(
                      child:
                      getText(
                          text:CartProvider.getAmount(product!,product!.quantity).toString(), fontSize: 18, isBold: true
                        // text: "111", fontSize: 12,
                        //    text:CartProvider.getAmount(products[index].id,products[index].quantity).toString(), fontSize: 18, isBold: true
                      )
                  )
              ),
              ///INCREMENT AMOUNT CARSCREEN
              const SizedBox(width: 12),
              iconWidgetIncrement(product!,Icons.add, iconColor: AppColors.primaryColor,

                  onPressed:(){

                    CartProvider.addItemCart(CartProvider().newCartItemsProduct(product!));

                    if(!CartProvider.productItems.containsKey(product!.codeProd)){
                      CartProvider.productItems.putIfAbsent(product!.codeProd, () => product!) ;
                    }else {
                      //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
                      CartProvider.productItems.update(product!.codeProd, (value) => product!);
                    }
                  }
              ),

            ],
          ),
        );
      },
    );
  }


  Widget padded(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  Widget iconWidgetDecrement( Product product,IconData iconData, {Color? iconColor, int? index, onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          /// onPressed();
          ///  incrementAmount();

          // int index=product.id;
          // product.quantity--;
          Product prod= CartProvider().findById(product.codeProd);

          if(prod.quantity <=0){
            return;
          }else {
            // get prod from map
            CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(product));

            if(!CartProvider.productItems.containsKey(product.codeProd)){
              CartProvider.productItems.putIfAbsent(product.codeProd, () => product) ;
            }else {
              //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
              CartProvider.productItems.update(product.codeProd, (value) => product);
            }
          }
          // CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(product));

          // decrementAmount(context,CartProvider().newCartItemsProduct(product),item.quantity);
        }

      },
      child: Container(
        height: 35,
        width: 35,
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
            size: 20,
          ),
        ),
      ),
    );
  }


  Widget iconWidgetIncrement( Product product,IconData iconData, {Color? iconColor, int? index, onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          /// onPressed();
          ///  incrementAmount();
          CartProvider.addItemCart(CartProvider().newCartItemsProduct(product));

          if(!CartProvider.productItems.containsKey(product.codeProd)){
            CartProvider.productItems.putIfAbsent(product.codeProd, () => product) ;
          }else {
            //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
            CartProvider.productItems.update(product.codeProd, (value) => product);
          }

        }

      },
      child: Container(
        height: 35,
        width: 35,
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
            size: 20,
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






