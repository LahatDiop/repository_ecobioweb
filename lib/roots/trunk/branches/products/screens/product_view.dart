import 'package:ecobioweb/roots/trunk/branches/cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';


import '../../cart/provider/cart_provider.dart';
import '../../commun_data_utils/utils/text/app_text.dart';
import '../../commun_data_utils/utils/theme/app_theme.dart';
import '../../localisation/translation/components/appLocalizations.dart';
import '../components/product.dart';
import '../widgets/favourite_toggle_icon_widget.dart';
import '../widgets/products_widget.dart';

class ProductViewPage extends StatefulWidget {
  final Product product;
  final int? quatity;
  List<Product>? products = [];

   ProductViewPage({Key? key, required this.product, quantity, this.quatity, this.products}) : super(key: key);

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}




class _ProductViewPageState extends State<ProductViewPage> {
  List<dynamic> productList = [];
  List<String> size = [
    "S",
    "M",
    "L",
    "XL",
  ];

  List<Color> colors = [
    Colors.black,
    Colors.purple,
    Colors.orange.shade200,
    Colors.blueGrey,
    const Color(0xFFFFC1D9),
  ];

  final int _selectedColor = 0;
  final int _selectedSize = 1;

  Function? onPress;




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          // expandedHeight: MediaQuery.of(context).size.height * 0.6,
          expandedHeight: MediaQuery.of(context).size.height * 0.60,
          elevation: 0,
          snap: false,
          floating: true,
          stretch: false,
          backgroundColor: Colors.grey.shade50,
          flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              // background: Image.network(
              background: Image.asset(
                widget.product.imageURL,
                fit: BoxFit.cover,
                // height: 120,
                // width: 100,
              )

              ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(45),
              child: Transform.translate(
                offset: const Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                      child: Container(
                    width: 50,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
                ),
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
               //height: MediaQuery.of(context).size.height,
               // height: MediaQuery.of(context).size.height * 0.30,
             /// height: 250,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 226, 212, 212),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.product.brand.toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 33, 165, 66),
                              fontSize: 14,
                            ),

                          ),

                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // Text(
                          //   widget.product.brand.toString(),
                          //   style: const TextStyle(
                          //     color: Color.fromARGB(255, 33, 165, 66),
                          //     fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                      Text(
                        "\€ " + widget.product.price.toString() + '.00',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                       Row(
                         // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          FavoriteToggleIcon(product:widget.product,favorite: widget.product.isFavorite,productsList:widget.products,),
                          ],
                          // FavoriteToggleIcon();
                      )

                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Bio 4 ever...",
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.grey.shade800,
                      fontSize: 15,
                    ),
                  ),

                  /*  const SizedBox(
                        height: 30,
                      ),
                      Text( 
                        "Color",
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                      ),
                      */
                  const SizedBox(
                    height: 10,
                  ),
                  addWidgetCounterCard(context, widget.product,onPress),
                  // Row(
                  //   children: [
                  //     ///DECREMENT AMOUNT CARSCREEN
                  //     iconWidget(Icons.remove, iconColor: AppColors.darkGrey,
                  //       onPressed: () {
                  //         setState(() {
                  //           // products[index].quantity--;
                  //           // CartProvider.decrementItemCart(newCartItemsProduct(products[index]));
                  //
                  //           int? index=widget.products?.indexWhere((element) => element.id==widget.product.id);
                  //           widget.products![index!].quantity--;
                  //           // products[index].quantity++;
                  //           CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(widget.products![index]));
                  //
                  //         });
                  //         // cartItems.removeAt(index);
                  //         //cartItemCount.removeAt(index);
                  //       },),
                  //     const SizedBox(width: 18),
                  //     /// QUANTITY CARTSCREEN
                  //     Container(
                  //         width: 30,
                  //         child: Center(
                  //             child:
                  //             getText(
                  //                 text:CartProvider.getAmount(widget.product,widget.product.quantity).toString(), fontSize: 18, isBold: true
                  //              // text: "111", fontSize: 12,
                  //              //    text:CartProvider.getAmount(products[index].id,products[index].quantity).toString(), fontSize: 18, isBold: true
                  //             )
                  //         )
                  //     ),
                  //     ///INCREMENT AMOUNT CARSCREEN
                  //     const SizedBox(width: 18),
                  //     iconWidget(Icons.add, iconColor: AppColors.primaryColor,
                  //       onPressed: () {
                  //         setState(() {
                  //           int? index=widget.products?.indexWhere((element) => element.id==widget.product.id);
                  //              widget.products![index!].quantity++;
                  //            // products[index].quantity++;
                  //            CartProvider.addItemCart(CartProvider().newCartItemsProduct(widget.products![index]));
                  //         });
                  //       },
                  //
                  //
                  //     ),
                  //
                  //   ],
                  // ),


                //  const Spacer(),
                  const Divider(thickness: 1),
                  getProductDataRowWidget(widget.product.name),
                  const Divider(thickness: 1),
                  getProductDataRowWidget(widget.product.description,customWidget: nutritionWidget()),
                  const Divider(thickness: 1),
                   getProductDataRowWidget( "Review", customWidget: ratingWidget(),),
                  const Divider(thickness: 1),
                  /*  colori

                   SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: _selectedColor == index
                                    ? colors[index]
                                    : colors[index].withOpacity(0.5),
                                shape: BoxShape.circle),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: _selectedColor == index
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Container(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  */
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  /*   Text(
                        'Size',
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: size.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSize = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: _selectedSize == index
                                        ? const Color.fromARGB(255, 73, 197, 100)
                                        : Colors.grey.shade200,
                                    shape: BoxShape.circle),
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    size[index],
                                    style: TextStyle(
                                        color: _selectedSize == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      */
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  MaterialButton(

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>CartScreen()));
                      // MaterialPageRoute( builder: (context) => const MenuNavigationComponents()));
                    },
                    // onPressed: () {
                    //   Navigator.pop(context);
                    // },
                    height: 50,
                    elevation: 0,
                    splashColor: const Color.fromARGB(255, 43, 155, 77),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color.fromARGB(255, 104, 214, 94),
                    child: Center(
                      child: Text(
                        AppLocalizations.translate("cart"),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ))
        ])),
      ]),
    );
  }


  Widget addWidgetCounterCard(BuildContext context, Product product,onPress) {


    return       Row(
      children: [
        ///DECREMENT AMOUNT CARSCREEN
        iconWidget(Icons.remove, iconColor: AppColors.darkGrey,
            onPressed:(){
             setState(() {
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
            });
          }
        ),
        const SizedBox(width: 18),
        /// QUANTITY CARTSCREEN
        SizedBox(
            width: 30,
            child: Center(
                child:
                getText(
                    text:CartProvider.getAmount(product,product.quantity).toString(), fontSize: 18, isBold: true
                  // text: "111", fontSize: 12,
                  //    text:CartProvider.getAmount(products[index].id,products[index].quantity).toString(), fontSize: 18, isBold: true
                )
            )
        ),
        ///INCREMENT AMOUNT CARSCREEN
        const SizedBox(width: 18),
        iconWidget(Icons.add, iconColor: AppColors.primaryColor,

            onPressed:(){
                setState(() {
              CartProvider.addItemCart(CartProvider().newCartItemsProduct(product));

              if(!CartProvider.productItems.containsKey(product.codeProd)){
                CartProvider.productItems.putIfAbsent(product.codeProd, () => product) ;
              }else {
                //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
                CartProvider.productItems.update(product.codeProd, (value) => product);
              }
               });
            }
         ),

      ],
    );
  }

  Widget getImageHeaderWidget() {
    return Container(
      height: 250,
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
        tag: "GroceryItem:${widget.product.name}-"
        ,
        child: Image(
          image: AssetImage(widget.product.imageURL),
        ),
      ),
    );
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








}
