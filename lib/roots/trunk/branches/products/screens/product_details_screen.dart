import 'package:ecobioweb/roots/trunk/branches/products/components/product.dart';
import 'package:flutter/material.dart';

import '../../cart/widgets/item_counter_widget.dart';
import '../../commun_data_utils/utils/button/app_button.dart';
import '../../commun_data_utils/utils/text/app_text.dart';
import '../../localisation/translation/components/appLocalizations.dart';
import '../widgets/favourite_toggle_icon_widget.dart';


class ProductDetailsScreen extends StatefulWidget {
  // final GroceryItem groceryItem;
  final Product item;

  final String? heroSuffix;

  const ProductDetailsScreen(this.item, {this.heroSuffix});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int amount = 1;

  TextEditingController textInputSearch =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromRGBO(250, 101, 243, 105),
        // toolbarHeight: 60.0,
        toolbarHeight: 100.0,

        title: TextField(
          controller:textInputSearch ,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white70,
              contentPadding: const EdgeInsets.only(
                  left: 10.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide:  const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:  const BorderSide(color: Colors.white),
                borderRadius:  BorderRadius.circular(25.7),
              ),
              hintText: AppLocalizations.translate("search_point"),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: const Color.fromRGBO(90, 25, 72, 1),
                onPressed: () {


                 /// showSearch(context: context, delegate: DataSearch(products,textInputSearch.value.text.toString()));
                },
              )),
          style: const TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        // backgroundColor: Colors.blueGrey,

      ),
      body: SafeArea(
        child: Column(
          children: [
            getImageHeaderWidget(),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        widget.item.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: AppText(
                        text: widget.item.description,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff7C7C7C),
                      ),
                      trailing: FavoriteToggleIcon(product: widget.item,favorite: widget.item.isFavorite),
                    ),
                    const Spacer(),
                    // Row(
                    //   children: [
                    //     ItemCounterWidget(
                    //       onAmountChanged: (newAmount) {
                    //         setState(() {
                    //           amount = newAmount;
                    //         });
                    //       },
                    //     ),
                    //     const Spacer(),
                    //     Text(
                    //       "\$${getTotalPrice().toStringAsFixed(2)}",
                    //       style: const TextStyle(
                    //         fontSize: 24,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const Spacer(),
                    const Divider(thickness: 1),
                    getProductDataRowWidget("Product Details"),
                    const Divider(thickness: 1),
                    getProductDataRowWidget("Nutritions",
                        customWidget: nutritionWidget()),
                    const Divider(thickness: 1),
                    getProductDataRowWidget(
                      "Review aaa",
                      customWidget: ratingWidget(),
                    ),
                    const Spacer(),
                    const AppButton(
                      label: "Add To Basket",
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageHeaderWidget() {
    return Container(
      // height: 250,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF).withOpacity(0.1),
              const Color(0xFF3366FF).withOpacity(0.09),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Hero(
        tag: "GroceryItem:" +
            widget.item.name +
            "-" +
            (widget.heroSuffix ?? ""),
        child: Image(
          image: AssetImage(widget.item.imageURL),
        ),
      ),
    );
  }

  Widget getProductDataRowWidget(String label, {Widget? customWidget}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        children: [
          AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
          const Spacer(),
          if (customWidget != null) ...[
            customWidget,
            const SizedBox(
              width: 20,
            )
          ],
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget nutritionWidget() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffEBEBEB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const AppText(
        text: "100gm",
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xff7C7C7C),
      ),
    );
  }

  Widget ratingWidget() {
    Widget starIcon() {
      return const Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }

    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }

  double getTotalPrice() {
    return amount * widget.item.price;
  }
}
