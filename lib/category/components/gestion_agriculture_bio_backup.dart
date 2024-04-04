//
//
//
// import 'package:flutter/material.dart';
//
// import '../../roots/trunk/branches/products/components/product.dart';
//
// class GestionAgricultureBio extends StatefulWidget with ChangeNotifier{
//
//    GestionAgricultureBio({Key? key, this.product}): super(key: key);
//
//
//   final Product? product;
//    List<dynamic>  productItemsListT =[];
//    Map<String, Product>  productItemsMapT= {};
//
//    // List<dynamic> productItemsList = [];
//    // Map<String,Product>? productItemsMap=<String,Product>{} ;
//
//    ///Map<String, List<dynamic>>? productItemsMap2 =  <String, List<dynamic>>{};
//
//
//    @override
//
// _GestionAgriBioStatate createState() => _GestionAgriBioStatate();
//
//
//   }
//
// class _GestionAgriBioStatate extends State<GestionAgricultureBio> with TickerProviderStateMixin {
//
//   bool flagLoaderIsEnabled = true;
//
//   // List<dynamic>?  productItemsList =  GestionAgricultureBio().productItemsList;
//   // Map<String, Product>?  productItemsMap=GestionAgricultureBio().productItemsMap;
//
//     List<dynamic>  productItemsList =[];
//     Map<String, Product>  productItemsMap={};
//
//     // List<Product> _items=[];
//     //
//     // List<Product> get items {
//     //   return _items;
//     // }
//     //     // int indexss = _items.indexWhere((element) => element.id== id);
//
//   late List<dynamic>  productItemsData;
//
//   @override
//   // void initState() {
//   //
//   //   ///  DataLoader dataLoader= const DataLoader();
//   //   // fetchItems(indexTab, flagLoaderIsEnabled).whenComplete(() => setState(() {}));
//   //   //   fetchItems(flagLoaderIsEnabled).whenComplete(() => setState(() {}));
//   //   // super.initState();
//   //
//   //  DataLoader().createState().fetchItems("true", true).whenComplete(() => setState(() {}));
//   //
//   // }
//   // Future<void> fetchItems(bool flagLoaderIsEnabled) async {
//   //
//   //   final String response =
//   //   await rootBundle.loadString('assets/json/products.json');
//   //   final data = await json.decode(response);
//   //
//   //   productItemsList= data['products'].map((data) => Product.fromJson(data)).toList();
//   //
//   //
//   //   ///productItemsMap?.putIfAbsent("product", () => productItemsList.toList());
//   //
//   //
//   //
//   //
//   //   // Navigator.of(context).push(MaterialPageRoute(
//   //   //   builder: (context) => AgricultureBiologique(),
//   //   // ));
//   //   // Future build(BuildContext context) {
//   //   //   return  Navigator.of(context).push(MaterialPageRoute(
//   //   //       builder: (context) => AgricultureBiologique(),
//   //   //      )
//   //   //   );
//   //   // }
//   //
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//   return Container();
//   }
//
//   void  setProductItemsMap(Product product) {
//
//     if (productItemsMap.containsKey(product.codeProd)) {
//
//     } else {
//       productItemsMap.putIfAbsent(
//           product.codeProd,
//               () => Product(
//             id :product.id,
//             codeProd:product.codeProd ,
//             type: product.type,
//             name:product.name ,
//             description:product.description ,
//             price:product.price ,
//             quantityStock:product.quantityStock ,
//             quantity:product.quantity ,
//             category:product.category ,
//             brand:product.brand ,
//             brandModel:product.brandModel ,
//             codeEan:product.codeEan ,
//             codeQr:product.codeQr ,
//             country:product.country ,
//             city:product.city ,
//             currency:product.currency ,
//             kilometer:product.kilometer ,
//             imageURL:product.imageURL ,
//             image:product.image ,
//             datePublication:DateTime.now().toString() ,
//             dateUpdate:product.dateUpdate ,
//             isFavorite:product.isFavorite,
//             isEnabled:product.isEnabled,
//           )
//       );
//     }
//
//   }
//
//   void setProductItemsList(List? productItemsListData) {
//
//     productItemsList.add(productItemsListData);
//
//  ///   productItemsData.add(productItemsListData);
//
//     productItemsListData= productItemsListData;
//   }
//
//
//   /// ==============================  INIT ADD DATA PRODUCT FROM CART MAP CART   =============================================
// //  aggiunge prodotti nel carello
//   void addItemCart(Product product,int index) {
// //   void addItemCart(String productId, double price, String title, String imgUrl) {
//
//     if (productItemsMap.containsKey(product.codeProd)) {
//
//     } else {
//       productItemsMap.putIfAbsent(product.codeProd, () =>
//           Product(
//               id :product.id,
//               codeProd:product.codeProd ,
//               type: product.type,
//               name:product.name ,
//               description:product.description ,
//               price:product.price ,
//               quantityStock:product.quantityStock ,
//               quantity:product.quantity ,
//               category:product.category ,
//               brand:product.brand ,
//               brandModel:product.brandModel ,
//               codeEan:product.codeEan ,
//               codeQr:product.codeQr ,
//               country:product.country ,
//               city:product.city ,
//               currency:product.currency ,
//               kilometer:product.kilometer ,
//               imageURL:product.imageURL ,
//               image:product.image ,
//               datePublication:DateTime.now().toString() ,
//               dateUpdate:product.dateUpdate ,
//               isFavorite:product.isFavorite,
//               isEnabled:product.isEnabled
//           ));
//
//     }
//    // AgricultureBiologique.cartItemsMap.putIfAbsent(product.codeProd, () => product);
//     //  cartItemCount[index]++;
//    /// notifyListerner();
//   }
//
//
//   /// UPDATE ITEM CART
//   void incrementItemCart(Product product,int index) {
//     ///notifyListerner();
//     if (productItemsMap.containsKey(product.codeProd)) {
//       productItemsMap.update(
//           product.codeProd,
//               (existingCartItem) => Product(
//               id :existingCartItem.id,
//               codeProd:existingCartItem.codeProd ,
//               type: existingCartItem.type,
//               name:existingCartItem.name ,
//               description:existingCartItem.description ,
//               price:existingCartItem.price ,
//               quantityStock:existingCartItem.quantityStock ,
//               quantity:existingCartItem.quantity + 1 ,
//               category:existingCartItem.category ,
//               brand:existingCartItem.brand ,
//               brandModel:existingCartItem.brandModel ,
//               codeEan:existingCartItem.codeEan ,
//               codeQr:existingCartItem.codeQr ,
//               country:existingCartItem.country ,
//               city:existingCartItem.city ,
//               currency:existingCartItem.currency ,
//               kilometer:existingCartItem.kilometer ,
//               imageURL:existingCartItem.imageURL.toString() ,
//               image:existingCartItem.image.toString() ,
//               datePublication:DateTime.now().toString() ,
//               dateUpdate:existingCartItem.dateUpdate ,
//               isFavorite:existingCartItem.isFavorite,
//               isEnabled:existingCartItem.isEnabled
//           ));
//
//     }
//   }
//
//
//
//
// // void onCategoryItemClicked(BuildContext context) {
//   //   Navigator.of(context).push( MaterialPageRoute(
//   //     builder: (BuildContext context) {
//   //       return ShoppingCartScreen();
//   //     },
//   //   ));
//   // }
// }
//
//
//
//
//
