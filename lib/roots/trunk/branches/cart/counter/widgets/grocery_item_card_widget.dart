// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:ecobioweb/roots/trunk/branches/products/components/product.dart';
// import 'package:ecobioweb/roots/trunk/branches/products/widgets/favourite_toggle_icon_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:path/path.dart';
//
// import '../../cart/provider/cart_provider.dart';
// import '../../commun_data_utils/utils/text/app_text.dart';
// import '../../commun_data_utils/utils/theme/app_theme.dart';
//
//
// class GroceryItemCardWidget extends StatelessWidget {
//
//   late PageController _pageController;
//   CarouselController buttonCarouselController = CarouselController();
//
//
//   List imgList=[
// //add your items here
//     "assets/images/apiculture/honey/miele_3.jpg",
//     "assets/images/apiculture/honey/miele_1.jpg",
//     "assets/images/apiculture/honey/miele_4.jpg",
//   ];
//
// //   List imageSliders=[
// // //add your items here
// //     'assets/images/apiculture/honey/miele_3.jpg',
// //     'assets/images/apiculture/honey/miele_1.jpg',
// //     'assets/images/apiculture/honey/miele_4.jpg',
// //   ];
//
//
//   void initState() {
//   // super.initState();
//     _pageController = PageController(viewportFraction: 0.8);
//   }
//
//   GroceryItemCardWidget({Key? key, required this.item, this.heroSuffix})
//       : super(key: key);
//
//
//   // final GroceryItem item;
//  final Product item;
//   final String? heroSuffix;
//    Function? onPress;
//
//   // final double width = 174;
//   // final double height = 250;
//   final double width = 180;
//   final double height = 295;
//   final double widthImg = 0.2;
//   final double heightImg = 0.2;
//   final Color borderColor = const Color(0xffE2E2E2);
//   final double borderRadius = 18;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         border: Border.all( color: borderColor, width: 3),
//         borderRadius: BorderRadius.circular( borderRadius),
//       ),
//
//        child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 15,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//                  // SizedBox(
//                  //   width: MediaQuery.of(context).size.width * width_img,
//                  //   height: MediaQuery.of(context).size.height * height_img,
//                  //   child: imageWidget(context,item.image),
//                  // ),
//
//
//             Expanded(
//               flex: 7,
//               child: Center(
//                 child: Hero(
//                   tag: "GroceryItem:" + item.name + "-" + (heroSuffix ?? ""),
//                   // child: imagesWidget(context,item.images!),
//                    child:  SizedBox(
//                      //  width: MediaQuery.of(context).size.width * widthImg,
//                      // height: MediaQuery.of(context).size.height * heightImg,
//                      child: imageWidget(context,item.image),
//                    ),
//                 ),
//               ),
//             ),
//
//             // Expanded(
//             //   //flex: 7,
//             //   child: Center(
//             //     child: Hero(
//             //       tag: "GroceryItem:" + item.name + "-" + (heroSuffix ?? ""),
//             //       // child: imagesWidget(context,item.images!),
//             //        child: imageWidget(context,item.image),
//             //     ),
//             //   ),
//             // ),
//             // Expanded(
//             //   // flex: 70,
//             // child: Center(
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.center,
//             //     crossAxisAlignment: CrossAxisAlignment.center,
//             //     children: [
//             //       imageWidget(context,item.image),
//             //     ],
//             //
//             //   ),
//             //   )
//             // ),
//         Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//             // const SizedBox(
//             //   height: 20,
//             // ),
//             AppText(
//               text: item.name,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             AppText(
//               text: item.description,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: const Color(0xFF7C7C7C),
//             ),
//             // AppText(
//             //   //text: "${item.weight}  ${item.unit}",
//             //   text: " ${item.price.toStringAsFixed(2)} / ${item.unit}",
//             //   fontSize: 14,
//             //   fontWeight: FontWeight.w600,
//             //   color: const Color(0xFF7C7C7C),
//             // ),
//            ]
//         ),
//    // const Spacer(),
//             // Column(
//             //     crossAxisAlignment: CrossAxisAlignment.center,
//             //     children: [
//             //       // const SizedBox(
//             //       //   height: 20,
//             //       // ),
//             //       AppText(
//             //         //text: "${item.weight}  ${item.unit}",
//             //         text: " ${item.price.toStringAsFixed(2)} / ${item.unit}",
//             //         fontSize: 14,
//             //         fontWeight: FontWeight.w600,
//             //         color: const Color(0xFF7C7C7C),
//             //         textAlign: TextAlign.right,
//             //       ),
//             //
//             //     ]
//             // ),
//             // const SizedBox(
//             //   height: 20,
//             // ),
//             // Row(
//             //
//             //   children: [
//             //     AppText(
//             //       text: "\$${item.price.toStringAsFixed(2)}",
//             //       fontSize: 18,
//             //       fontWeight: FontWeight.bold,
//             //     ),
//             // //   const Spacer(),
//             //
//             //     // addWidgetCounterCard(context,item,onPress),
//             //     // const Padding(padding: EdgeInsets.only(left: 25)),
//             //     // addWidget(),
//             //     //  const Padding(padding: EdgeInsets.only(left: 30)),
//             //     // addFavoriteWidget(context),
//             //
//             //   ],
//             // ),
//             // const SizedBox(
//             //   height: 10,
//             // ),
//             Row(
//               children:<Widget> [
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     padding: const EdgeInsets.only(top: 10),
//                     alignment: Alignment.topLeft,
//
//                     child:  AppText(
//                       //text: "${item.weight}  ${item.unit}",
//                       text: " ${item.price.toStringAsFixed(2)} € / ${item.unit}",
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: const Color(0xFF7C7C7C),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//
//
//               ],
//             ),
//             Row(
//               children:<Widget> [
//
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     padding: const EdgeInsets.only(top: 10),
//
//                     child: addWidgetCounterCard(context,item,onPress),
//                     // const Padding(padding: EdgeInsets.only(left: 25)),
//                     // addWidget(),
//                     //  const Padding(padding: EdgeInsets.only(left: 30)),
//                     //  addFavoriteWidget(context),
//                   ),
//                 ),
//
//
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               children:<Widget> [
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     child:
//                     addWidget(),
//
//                   ),
//                 ),
//                 const Padding(padding: EdgeInsets.only(left: 5),),
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     child: addFavoriteWidget(context,item,onPress),
//                   ),
//                 ),
//               ],
//             ),
//             // Row(
//             //   children: [
//             //
//             //     const Spacer(),
//             //
//             //     addWidgetCounterCard(context,item,onPress),
//             //    // const Padding(padding: EdgeInsets.only(left: 25)),
//             //     addWidget(),
//             //     const Padding(padding: EdgeInsets.only(left: 30)),
//             //     addFavoriteWidget(context),
//             //
//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget addWidgetCounterCard(BuildContext context, Product product,onPress) {
//
//     return Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         ///DECREMENT AMOUNT CARSCREEN
//         iconWidgetDecrement( product,Icons.remove, iconColor: AppColors.darkGrey,
//             onPressed:(){
//               // int index=product.id;
//               // product.quantity--;
//               Product prod= CartProvider().findById(product.codeProd);
//
//               if(prod.quantity <=0){
//                 return;
//               }else {
//                 // get prod from map
//                 CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(product));
//
//                 if(!CartProvider.productItems.containsKey(product.codeProd)){
//                   CartProvider.productItems.putIfAbsent(product.codeProd, () => product) ;
//                 }else {
//                   //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
//                   CartProvider.productItems.update(product.codeProd, (value) => product);
//                 }
//               }
//              // CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(product));
//
//               // decrementAmount(context,CartProvider().newCartItemsProduct(product),item.quantity);
//             }
//
//         ),
//         const SizedBox(width: 12),
//         /// QUANTITY CARTSCREEN
//         SizedBox(
//             width: 30,
//             child: Center(
//                 child:
//                 getText(
//                     text:CartProvider.getAmount(product,product.quantity).toString(), fontSize: 18, isBold: true
//                   // text: "111", fontSize: 12,
//                   //    text:CartProvider.getAmount(products[index].id,products[index].quantity).toString(), fontSize: 18, isBold: true
//                 )
//             )
//         ),
//         ///INCREMENT AMOUNT CARSCREEN
//         const SizedBox(width: 12),
//         iconWidgetIncrement(product,Icons.add, iconColor: AppColors.primaryColor,
//
//             onPressed:(){
//
//               CartProvider.addItemCart(CartProvider().newCartItemsProduct(product));
//
//               if(!CartProvider.productItems.containsKey(product.codeProd)){
//                    CartProvider.productItems.putIfAbsent(product.codeProd, () => product) ;
//               }else {
//                 //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
//                 CartProvider.productItems.update(product.codeProd, (value) => product);
//               }
//             }
//         ),
//
//       ],
//     );
//   }
//
//   // void decrementAmount(BuildContext context,CartItem cartItem,int quantity){
//   //   if (quantity <= 0) {
//   //     return;
//   //   }else if(quantity==1){
//   //
//   //     setState(() {
//   //       CartProvider.removeCartItem(widget.itemCart);
//   //       //  CartProvider.removeCartItem(widget.itemCart.id.toString());
//   //     });
//   //     //     CartProvider.removeCartItem(widget.itemCart);
//   //     // //  CartProvider.removeCartItem(widget.itemCart.id.toString());
//   //   }else {
//   //     setState(() {
//   //       CartProvider.decrementItemCart(widget.itemCart);
//   //
//   //       updateParent(widget.itemCart);
//   //     });
//   //   }
//   // }
//   Widget imagesWidget (BuildContext context, List<String> images){
//     return CarouselSlider(
//       options: CarouselOptions(
//         //height: 500,
//       ),
//      // items: imgList
//       items: images
//           .map((item) => Center(
//             // child:Image.asset(item, fit: BoxFit.cover, width: 300)
//             child: Image.asset(item)
//           ))
//           .toList(),
//     );
//
//   }
//
//   Widget imageWidget(BuildContext context, String image) {
//     return ClipRRect(
//       child: Image.asset(
//         item.image,
//           //  fit: BoxFit.fill,
//           //      height: 400,
//           //      width: 300,
//       ),
//     );
//   }
//   Widget imageWidget11(BuildContext context, String image) {
//     return Image.asset(item.imageURL,
//       // fit: BoxFit.cover,
//       // height: 200,
//       // width: 200,
//     );
//   }
//
//   Widget imageWidgetOK (BuildContext context){
//     return Container(
//         child: CarouselSlider(
//           options: CarouselOptions(
//             height: 600,
//           ),
//           items: imgList
//               .map((item) => Container(
//             child: Center(
//                  // child:Image.asset(item, fit: BoxFit.cover, width: 300)
//                    //child: Image.asset(item),
//
//               child: Container(
//                 margin: const EdgeInsets.all(5.0),
//                 child: ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//                     child: Stack(
//                       children: <Widget>[
//                         Image.asset(item, fit: BoxFit.cover, width: 400.0),
//                         Positioned(
//                           bottom: 0.0,
//                           left: 0.0,
//                           right: 0.0,
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromARGB(200, 0, 0, 0),
//                                   Color.fromARGB(0, 0, 0, 0)
//                                 ],
//                                 begin: Alignment.bottomCenter,
//                                 end: Alignment.topCenter,
//                               ),
//                             ),
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 10.0, horizontal: 20.0),
//
//                             child: Image.asset(item),
//                             // child: Text(
//                             //   'No. ${imgList.indexOf(item)} image',
//                             //   style: const TextStyle(
//                             //     color: Colors.white,
//                             //     fontSize: 20.0,
//                             //     fontWeight: FontWeight.bold,
//                             //   ),
//                             // ),
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//             ),
//           ))
//               .toList(),
//         )
//     );
//
// }
//
//
//
//
//
//
//
//   Widget imageWidgetTxt(BuildContext context) {
//     return Container(
//         child: CarouselSlider(
//           options: CarouselOptions(
//               height: 200.0),
//           items: imgList.map((i) {
//             return Builder(
//               builder: (BuildContext context, ) {
//                 return Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: const BoxDecoration(
//                         color: Colors.amber
//                     ),
//                    child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
//
//                 );
//               },
//             );
//           }).toList(),
//         )
//     );
//   }
//
//   Widget addWidget() {
//     return Container(
//       height: 40,
//       width: 40,
//       decoration: BoxDecoration(
//           border: Border.all(color: AppColors.primaryColor,width: 2),
//           borderRadius: BorderRadius.circular(17),
//          color: AppColors.primaryColor
//       ),
//       child: const Center(
//         child: Icon(
//           Icons.perm_device_information,
//           color: Colors.black,
//           size: 25,
//         ),
//       ),
//     );
//   }
//
// Widget addFavoriteWidget(BuildContext context, Product product,onPress) {
//     return Container(
//       height: 40,
//        width: 40,
//       ///width: MediaQuery.of(context).size.width* 2,
//       decoration: BoxDecoration(
//         border: Border.all(color: borderColor,width: 2),
//         borderRadius: BorderRadius.circular(17),
//          // color: AppColors.darkGrey
//       )
//       ,
//
//       child: FavoriteToggleIcon(product: product, favorite: product.isFavorite,),
//
//     );
// }
//
//   Widget locationWidget() {
//     String locationIconPath = "assets/icons/location_icon.svg";
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(
//           locationIconPath,
//         ),
//         const SizedBox(
//           width: 8,
//         ),
//         const Text(
//           "Khartoum,Sudan",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         )
//       ],
//     );
//   }
//
//   Widget padded(Widget widget) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       child: widget,
//     );
//   }
//
//   Widget iconWidgetDecrement( Product product,IconData iconData, {Color? iconColor, int? index, onPressed}) {
//     return GestureDetector(
//       onTap: () {
//         if (onPressed != null) {
//          /// onPressed();
//           ///  incrementAmount();
//
//             // int index=product.id;
//             // product.quantity--;
//             Product prod= CartProvider().findById(product.codeProd);
//
//             if(prod.quantity <=0){
//               return;
//             }else {
//               // get prod from map
//               CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(product));
//
//               if(!CartProvider.productItems.containsKey(product.codeProd)){
//                 CartProvider.productItems.putIfAbsent(product.codeProd, () => product) ;
//               }else {
//                 //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
//                 CartProvider.productItems.update(product.codeProd, (value) => product);
//               }
//             }
//             // CartProvider.decrementItemCart(CartProvider().newCartItemsProduct(product));
//
//             // decrementAmount(context,CartProvider().newCartItemsProduct(product),item.quantity);
//           }
//
//       },
//       child: Container(
//         height: 35,
//         width: 35,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(17),
//           border: Border.all(
//             color: const Color(0xffE2E2E2),
//           ),
//         ),
//         child: Center(
//           child: Icon(
//             iconData,
//             color: iconColor ?? Colors.black,
//             size: 20,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget iconWidgetIncrement( Product product,IconData iconData, {Color? iconColor, int? index, onPressed}) {
//     return GestureDetector(
//       onTap: () {
//         if (onPressed != null) {
//           /// onPressed();
//           ///  incrementAmount();
//           CartProvider.addItemCart(CartProvider().newCartItemsProduct(product));
//
//           if(!CartProvider.productItems.containsKey(product.codeProd)){
//             CartProvider.productItems.putIfAbsent(product.codeProd, () => product) ;
//           }else {
//             //CartProvider.products.removeWhere((element) => element.codeProd== product.codeProd);
//             CartProvider.productItems.update(product.codeProd, (value) => product);
//           }
//
//         }
//
//       },
//       child: Container(
//         height: 35,
//         width: 35,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(17),
//           border: Border.all(
//             color: const Color(0xffE2E2E2),
//           ),
//         ),
//         child: Center(
//           child: Icon(
//             iconData,
//             color: iconColor ?? Colors.black,
//             size: 20,
//           ),
//         ),
//       ),
//     );
//   }
//   Widget getText({
//     required String text,
//     int? index,
//     required double fontSize,
//     bool isBold = false,
//     color = Colors.black,
//   }) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: fontSize,
//         fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//         color: color,
//       ),
//     );
//   }
//
//
//
//
// }
//
//
