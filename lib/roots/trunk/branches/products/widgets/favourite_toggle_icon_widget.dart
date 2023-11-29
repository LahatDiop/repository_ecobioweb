import 'package:ecobioweb/roots/trunk/branches/business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/business/agricultures/agriculture_biological/screens/agriculture_biologique_screenOK.dart';
import 'package:ecobioweb/roots/trunk/branches/cart/provider/cart_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/favorites/provider/favorites_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/favorites/screens/favourite_screen.dart';
import 'package:flutter/material.dart';

import '../components/product.dart';

class FavoriteToggleIcon extends StatefulWidget {

   bool? favorite=false;
   bool? productIsfavorite=false;
    Product product;
   List<Product>? productsList = [];

   FavoriteToggleIcon({ this.productsList, required this.product,this.favorite, super.key});



  @override
  _FavoriteToggleIconState createState() => _FavoriteToggleIconState();
}

class _FavoriteToggleIconState extends State<FavoriteToggleIcon> {
  bool productIsfavorite = false;

  bool isFavorite = false;

  var indexp;

  ///bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(

      ///flex: 3,
      child: InkWell(


        child: checkGestureDetector(context),


        // onTap: () {
        //   setState(() {
        // // bool  productIsfavorite=FavoriteProvider().findByProductIsFavorite(widget.product);
        // /// setState(() {
        //
        // List<Product>? products = FavoriteProvider().itemsFavoritesList;
        //
        // Product prodSelected = widget.product;
        //
        // indexp= widget.product.id.toString();
        //
        // if (products.isEmpty) {
        //   prodSelected.isFavorite = true;
        //   widget.product = prodSelected;
        //   FavoriteProvider().addFavorite(prodSelected);
        // } else {
        //
        //   products.forEach((element) {
        //     int? index = products.indexWhere((element) =>
        //     element.id == widget.product.id);
        //
        //     if (index == -1) {
        //       if (widget.product.isFavorite == true) {
        //         prodSelected.isFavorite = false;
        //       } else {
        //         prodSelected.isFavorite = true;
        //       }
        //       widget.product = prodSelected;
        //       FavoriteProvider().addFavorite(prodSelected);
        //     } //else{
        //
        //         // if (products[widget.product.id].isFavorite == true) {
        //     if (products[index].isFavorite == true) {
        //         prodSelected.isFavorite = false;
        //         FavoriteProvider().removeFavorite(prodSelected.id.toString());
        //
        //         widget.product = prodSelected;
        //     }
        //
        //
        //       //   else {
        //       //     if (products[widget.product.id.toInt()].isFavorite == false) {
        //       //       prodSelected.isFavorite = true;
        //       //       widget.product = prodSelected;
        //       //       FavoriteProvider().updateFavorite(prodSelected);
        //       //     }
        //       // }
        //
        //
        //    //}
        //   }
        //   );
        //   }
        // }
        // );
        //
        // },
        //
        //
        //
        // child: Icon(
        //
        //     checkStatus(widget.product)! ? Icons.favorite : Icons.favorite_border,
        //   color: checkStatus(widget.product)! ? Colors.red : Colors.blueGrey,
        //   size: 25,
        // ),

        // child: Icon(
        //   widget.favorite! ? Icons.favorite : Icons.favorite_border,
        //   color: widget.favorite! ? Colors.red : Colors.blueGrey,
        //   size: 30,
        // ),
        //);
      ),
    );
  }

  Widget checkGestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // bool  productIsfavorite=FavoriteProvider().findByProductIsFavorite(widget.product);
          /// setState(() {

          List<Product>? products = FavoriteProvider().itemsFavoritesList;

          Product prodSelected = widget.product;

          indexp = widget.product.id.toString();

          if (products.isEmpty) {
            prodSelected.isFavorite = true;
            widget.product = prodSelected;
            FavoriteProvider().addFavorite(prodSelected);
          } else {
            products.forEach((element) {
              int? index = products.indexWhere((element) =>
              element.id == widget.product.id);

              if (index == -1) {
                if (widget.product.isFavorite == true) {
                  prodSelected.isFavorite = false;
                } else {
                  prodSelected.isFavorite = true;
                }
                widget.product = prodSelected;
                FavoriteProvider().addFavorite(prodSelected);
              } //else{

              // if (products[widget.product.id].isFavorite == true) {
              if (products[index].isFavorite == true) {
                prodSelected.isFavorite = false;
                FavoriteProvider().removeFavorite(prodSelected.id.toString());

                widget.product = prodSelected;
              }


              //   else {
              //     if (products[widget.product.id.toInt()].isFavorite == false) {
              //       prodSelected.isFavorite = true;
              //       widget.product = prodSelected;
              //       FavoriteProvider().updateFavorite(prodSelected);
              //     }
              // }


              //}
            }
            );
          }
        }
        );
      },
      child: Icon(

        checkStatus(widget.product)! ? Icons.favorite : Icons.favorite_border,
        color: checkStatus(widget.product)! ? Colors.red : Colors.blueGrey,
        size: 25,
      ),

    );
  }

  checkStatus(Product product) {
    // if(product.isFavorite==true){
    //   isFavorite=false;
    // }else {
    List<Product> list = FavoriteProvider().favoriteItems;
    for (var prod in list) {
      if (prod.id.toString() == product.id.toString()) {
        if (prod.isFavorite == true) {
          isFavorite = true;
          // product.isFavorite = true;
          // Product prodSelected=product;
          // FavoriteProvider().updateFavorite(prodSelected);
          break;
        } else {
          isFavorite = false;
          break;
        }
      } else {
        isFavorite = false;
      }
    }
    // }
    return isFavorite;
  }

}
