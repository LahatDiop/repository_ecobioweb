import 'package:flutter/material.dart';

import '../../../../../../category/screens/categorySlider.dart';
import '../../../../../../category/widgets/gridTiles_category.dart';
import '../../../../../../products/widgets/CircularProgress.dart';
import '../models/brandModel.dart';

BrandModel? brandModel;

class BrandHomePage extends StatefulWidget {
  late String slug;
  late bool isSubList;

  BrandHomePage({Key? key, required this.slug, this.isSubList = false})
      : super(key: key);
  @override
  _BrandHomePageState createState() => _BrandHomePageState();
}

class _BrandHomePageState extends State<BrandHomePage> {
  @override
  void initState() {
    super.initState();
  }

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
  BrandModel values = snapshot.data;
  List<Results> results = values.results;
  return GridView.count(
    crossAxisCount: 3,
    padding: const EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(results.length, (index) {
      var fsp;
      var newKey;
      return GridTile(
          child: GridTilesCategory(
        name: results[index].name,
        imageUrl: results[index].imageUrl,
        slug: results[index].slug,
        fromSubProducts: fsp,
        key: newKey,
      ));
    }),
  );
}

/*
Future<BrandModel> getCategoryList(String slug, bool isSubList) async {
  //if (brandModel == null) {

    if(brandModel.is){
   Response response = await get(Urls.ROOT_URL + slug);
    //  Response response = await http.get(Urls.ROOT_URL + slug);
    int statusCode = response.statusCode;
    var body = json.decode(response.body);
    log('${body}');
    if (statusCode == 200) {
      brandModel = BrandModel.fromJson(body);
//    brandModel = (body).map((i) =>BrandModel.fromJson(body)) ;
      return brandModel;
    }
  } else {
    return brandModel;
  }
}
*/

//https://api.evaly.com.bd/core/public/brands/?limit=20&page=1&category=bags-luggage-966bc8aac