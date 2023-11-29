import 'package:flutter/material.dart';

import '../../../../../../category/screens/categorySlider.dart';
import '../../../../../../category/widgets/gridTiles_category.dart';
import '../../../../../../products/widgets/CircularProgress.dart';
import '../../../../../../shopping/models/shop_model.dart';

List<ShopModel> shopModel = List<ShopModel>.empty(growable: true);

class ShopHomePage extends StatefulWidget {
  String slug;
  bool isSubList;

  ShopHomePage({Key? key, required this.slug, this.isSubList = false})
      : super(key: key);
  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryList(widget.slug, widget.isSubList),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const CircularProgress();
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
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  ShopModel values = snapshot.data;
  List<Data> results = values.data;
  return GridView.count(
    crossAxisCount: 3,
    padding: const EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(results.length, (index) {
      var fsp;
      var fsb;
      return GridTile(
          child: GridTilesCategory(
        name: results[index].shopName,
        imageUrl: results[index].shopImage,
        slug: results[index].slug,
        fromSubProducts: fsp,
        key: fsb,
      ));
    }),
  );
}

/*
Future<List<ShopModel>> getCategoryList1(String slug, bool isSubList) async {
  if (isSubList) {
    shopModel = null;
  }
  if (shopModel == null) {
    Response response =
        await get(Urls.ROOT_URL + slug);
    int statusCode = response.statusCode;
    var body = json.decode(response.body);
    log('${body}');
    if (statusCode == 200) {
      shopModel = ShopModel.fromJson(body);
//    brandModel = (body).map((i) =>BrandModel.fromJson(body)) ;
      return shopModel;
    }
  } else {
    return shopModel;
  }
}
*/
/*
Future<List<ShopModel>> getCategoryList(String slug, bool isSubList) async {
  if (isSubList) {
    //shopModel = null;
    shopModel.isEmpty;
  }
  if (shopModel.isNotEmpty) {
    /*Response response = await get(Urls.ROOT_URL + slug);
    int statusCode = response.statusCode;
    var body = json.decode(response.body);

    */
    /* Response response;
    response = await get(Urls.ROOT_URL + slug);
    int statusCode = response.statusCode;
    final body = json.decode(response.body);
    */
    var http;
    var identifier = 'shopHomePage';
    var page;
    var token = 001258;
    final response = await http.post(Urls.ROOT_URL + slug,
        body: json.encode({
          "filter": {"categoryname": identifier, "status": 1},
          "sortOrder": "ASC",
          "sortField": "",
          // "pageNumber" : page,
          //"pageSize" : 20
        }),
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer $token',
        });

    int statusCode = response.statusCode;
    final body = json.decode(response.body);

    log('${body}');
    if (statusCode == 200) {
      shopModel = ShopModel.fromJson(body) as List<ShopModel>;

      ///var brandModel = (body).map((i) =>BrandModel.fromJson(body)) ;
      return shopModel;
    }
  } else {
    return shopModel;
  }
}

*/
//https://api.evaly.com.bd/core/public/category/shops/bags-luggage-966bc8aac/?page=1&limit=15
