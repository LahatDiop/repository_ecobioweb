import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/products_model.dart';
import '../widgets/CircularProgress.dart';
import '../widgets/gridTiles_products.dart';
import 'package:http/http.dart' as http;




// ignore: must_be_immutable
class ProductsScreen extends StatefulWidget {
  String name;
  String slug;

  ProductsScreen({required Key key, required this.name, required this.slug})
      : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var elementKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBarWidget(context),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(color: Colors.red),
      ),
      body: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ProductListWidget(
            slug: widget.slug,
            key: elementKey,
          )),
    );
  }
}

class ProductListWidget extends StatelessWidget {
  String slug;

  ProductListWidget({required Key key, required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProductList(slug, false),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgress();
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return createListView(context, snapshot);
            }
        }
      },
    );
  }

  getProductList(String slug, bool bool) {}
}

ProductsModels? products;

Future<ProductsModels?> getProductList(String slug, bool isSubList) async {
  if (isSubList) {
    products = null;
  }
  if (products == null) {
    http.Response response;
    //response = await get(Urls.ROOT_URL+ slug?);
    // response = await http.get(Urls.ROOT_URL+ slug?);
    response = http.get(Uri.parse('https://www.google.com')) as http.Response;
    int statusCode = response.statusCode;
    final body = json.decode(response.body);
    if (statusCode == 200) {
      products = ProductsModels.fromJson(body);
      return products;
    } else {
      var vf;
      return products = ProductsModels(results: [], count: vf, next: '');
    }
  } else {
    return products;
  }
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  ProductsModels values = snapshot.data;
  List<Results> results = values.results;
  return GridView.count(
    crossAxisCount: 2,
//    physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 12.0,
    children: List<Widget>.generate(results.length, (index) {
      var newKey;
      var newFsp;
      return GridTile(
          child: GridTilesProducts(
        name: results[index].name,
        imageUrl: results[index].imageUrls[0],
        slug: results[index].slug,
        price: results[index].maxPrice,
        key: newKey,
        fromSubProducts: newFsp,
      ));
    }),
  );
}
