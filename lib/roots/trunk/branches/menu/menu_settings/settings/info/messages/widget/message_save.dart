import 'dart:collection';


import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../../../../business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../../../../../cart/provider/cart_provider.dart';
import '../../../../../../cart/screens/cart_screen.dart';
import '../../../../../../commun_data_utils/utils/helper/padded.dart';
import '../../../../../../commun_data_utils/utils/theme/app_theme.dart';
import '../../../../../../favorites/provider/favorites_provider.dart';
import '../../../../../../favorites/screens/favourite_screen.dart';
import '../../../../../../favorites/screens/filter_screen.dart';
import '../../../../../../favorites/widgets/grocery_item_card_widget.dart';
import '../../../../../../products/components/product.dart';
import '../../../../../../search/widgets/search_bar_widget.dart';
// import 'package:firebase_database/firebase_database.dart';


class MessageSave extends StatefulWidget {
  const MessageSave({super.key});

  @override
  _MessageSaveState createState() => _MessageSaveState();
}

class _MessageSaveState extends State<MessageSave> {
  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController textInputSearch =  TextEditingController();

    return MultiProvider(providers:  [
      ChangeNotifierProvider<FavoriteProvider>(create: (_)=>FavoriteProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_)=>CartProvider()),
      ChangeNotifierProvider<AgricultureBiologicalProvider>(create: (_) => AgricultureBiologicalProvider()),
    ],
      child: Navigator(onGenerateRoute: (RouteSettings settings){

        return MaterialPageRoute(builder: (context){
          return const MessageSave();
        });
      },),

      builder: (context,child){

        final favoriteProvider=Provider.of<FavoriteProvider>(context);
        final cartProvider=Provider.of<CartProvider>(context);
        ///final agriBio=Provider.of<AgricultureBiologicalProvider>(context);
        /// var listProducts= context.read<AgricultureBiologicalProvider>().getData(tabIndex);


        List<Product>?  productsFavorite=FavoriteProvider().favoriteItems;

        // cartItems=context.read<CartProvider>().cartItems;
        // //  products =context.read<CartProvider>().products;
        // products =context.read<CartProvider>().getProducts();


        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: const BackButton(
              color: Colors.black,
            ),

            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilterScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.sort,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: ( ) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavouriteScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: const Icon(
                    Icons.shopping_cart_checkout,
                    color: AppColors.greenColor,
                  ),
                ),
              ),
            ],
            ///Search
            ///Search
            title: Padded.padded(SearchBarWidget(textInputSearch)),

          ),

          // resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.grey.shade100,
          body:Builder(builder: (context){
            return   Column(
                children:<Widget> [

                  /// Title Agriculture Biodynamic
                  /// createSubTitle(),
                  Expanded(
                    // padding: const EdgeInsets.symmetric(horizontal: 20),
                    // height: MediaQuery.of(context).size.height * 100,
                    child: SingleChildScrollView(
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 3.0,
                        crossAxisSpacing: 0.0,
                        // I only need two card horizontally
                        children: productsFavorite.asMap().entries.map<Widget>((e) {
                          // GroceryItem groceryItem = e.value;
                          Product product = e.value;
                          return GestureDetector(
                            onTap: () {
                              onItemClicked(context, product);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: GroceryItemCardWidget(
                                item: product,
                                heroSuffix: "favorite_screen",
                              ),
                            ),
                          );
                        }).toList(), // add some space
                      ),
                    ),

                  ),
                ]
            );
          }
          ),
        );
      },
    );


  }

  void onItemClicked(BuildContext context, product) {}

  // ignore: deprecated_member_use
  // final databaseRef = FirebaseDatabase.instance.reference();
  // //final Future<FirebaseApp> _future = Firebase.initializeApp();
  //
  // List productList = [];
  //
  // ///List<Map<String, dynamic>> resultf =  List<Map<String, dynamic>>();
  //
  // List<Map<String, dynamic>> result = <Map<String, dynamic>>[];
  //
  // //Future<void> saveProductFromJson(String data) async {
  // Future<void> saveProductFromJson1(String data) async {
  //   //  List<dynamic> productList = [];
  //
  //   final String response =
  //       await rootBundle.loadString('../../assets/json/product.json');
  //   final data = await json.decode(response);
  //
  //   productList =
  //       data['product'].map((data) => Product.fromJson(data)).toList();
  //
  //   databaseRef.push().set({'product': data});
  //   //  databaseRef.push().set({'product': productList, 'comment': 'Save the data list'});
  //
  //   // setState(() {
  //   //  productList =
  //   //    data['market'].map((data) => Product.fromJson(data)).toList();
  //   // });
  }

  //List<dynamic> productList = [];

  /* void printFirebase(){
    databaseRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
*/
  @override
  // Widget build(BuildContext context) {
  //   /// printFirebase();
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Firebase Demo"),
  //     ),
  //     body: FutureBuilder(
  //         // future: _future,
  //         builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Text(snapshot.error.toString());
  //       } else {
  //         var textcontroller;
  //         return Container(
  //           child: Column(
  //             children: <Widget>[
  //               const SizedBox(height: 250.0),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: TextField(
  //                   controller: textcontroller,
  //                 ),
  //               ),
  //               const SizedBox(height: 30.0),
  //               Center(
  //                 //  child: RaisedButton(
  //                    child: ElevatedButton(
  //                      // color: Colors.pinkAccent,
  //                       child: const Text("Save to Database"),
  //                       onPressed: () {
  //                         // addData(textcontroller.text);
  //                         //  addData('Lahat 2');
  //                         //call method flutter upload
  //
  //                         saveProductFromJson();
  //                       })),
  //
  //               // onPressed: () => FirebaseFirestore.instance
  //               // .collection('product')
  //               //   .add({"point": productList}),
  //               //))
  //             ],
  //           ),
  //         );
  //       }
  //     }),
  //   );
  // }

  void addData(String data) {
   // databaseRef.push().set({'name': data, 'comment': 'Save the data'});
  }

/*
  Future<List<Product>> _getCartList() async {
  final querySnapshot = await FirebaseFirestore.instance.collection('OrderID').get();
  List<QueryDocumentSnapshot> docs = querySnapshot.docs;

 // productList = data['product'].map((data) => Product.fromJson(data)).toList();
           final cartList = docs.map((doc) => Product.fromJson(doc.data())).toList();
  return cartList;
}
*/
  void addDatalist() {
    Map<String, dynamic> list = <String, dynamic>{};

    HashMap hashMap = HashMap<String, String>();
    HashMap hashMapInt = HashMap<String, int>();
    HashMap hashMap3 = HashMap<String, dynamic>();

    // list.put("alanisawesome", new Market("June 23, 1912", "Alan Turing"));
    //  markets.put("gracehop", new Market("December 9, 1906", "Grace Hopper"));
    List<String> listElements = [];
  }

  void saveProductFromJson() {
    List productList = [];
    List marketList = [];
    List marketFr = [];
    List marketSp = [];
    productList.add('code_prod: 1001');
    productList.add('name: Carote');
    productList.add('category: VERDURE');
    productList.add('brand: EcoBio Shop');
    productList.add('imageURL: assets/images/verdure/carote_1.png');
    productList.add('datePublication: 2022-11-03T10:14:45');

    marketList.add(' id:110 ');
    marketList.add('name:Italia');
    marketList.add('description: it_IT');
    marketList.add('code: IT');
    marketList.add('dialCode:+39');
    marketList.add('flagUri:assets/images/flags/it.png');
    marketList.add('isShowMarket:true');
    marketList.add('isShowCategory:true');
    marketList.add('isVisibility:true');
    marketList.add('isEnabled:true');
    marketList.add('isIva:true');
    marketList.add('isFavorite:true');

    marketFr.add(' id:120 ');
    marketFr.add('name:France');
    marketFr.add('description:fr_FR');
    marketFr.add('code: FR');
    marketFr.add('dialCode:+39');
    marketFr.add('flagUri:../assets/images/flags/fr.png');
    marketFr.add('isShowMarket:true');
    marketFr.add('isShowCategory:true');
    marketFr.add('isVisibility:true');
    marketFr.add('isEnabled:true');
    marketFr.add('isIva:true');
    marketFr.add('isFavorite:false');

    marketSp.add(' id:140 ');
    marketSp.add('name:España');
    marketSp.add('description:es_ES');
    marketSp.add('code: ES');
    marketSp.add('dialCode:+45');
    marketSp.add('flagUri:assets/images/flags/es.png');
    marketSp.add('isShowMarket:true');
    marketSp.add('isShowCategory:true');
    marketSp.add('isVisibility:true');
    marketSp.add('isEnabled:true');
    marketSp.add('isIva:true');
    marketSp.add('isFavorite:true');

    //databaseRef.child('MARKET');

    // databaseRef.push().set({
    //   // 'structures': 1001,
    //   // 'products': productList,
    //   'Markets': 'markets',
    //   '0': marketList,
    //   '1': marketFr,
    //   '2': marketSp,
    // });
  //}
}
