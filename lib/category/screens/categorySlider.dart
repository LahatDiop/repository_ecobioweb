import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../products/widgets/CircularProgress.dart';
import '../../roots/trunk/branches/commun_data_utils/utils/helper/urls.dart';
import '../models/categoryModel.dart';
import '../widgets/gridTiles_category.dart';

//List<CategoryModel> categories;
List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

class CategoryPage extends StatefulWidget {
  String slug;
  bool isSubList;

  CategoryPage({Key? key, required this.slug, this.isSubList = false})
      : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
              return createListView(context, snapshot, widget.isSubList);
            }
        }
      },
    );
  }
}

Widget createListView(
    BuildContext context, AsyncSnapshot snapshot, bool isSubList) {
  List<CategoryModel> values = snapshot.data;
  return GridView.count(
    crossAxisCount: 3,
//    physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(values.length, (index) {
      var elKey;
      return GridTile(
          child: GridTilesCategory(
        name: values[index].name,
        imageUrl: values[index].imageUrl,
        slug: values[index].slug,
        fromSubProducts: isSubList,
        key: elKey,
      ));
    }),
  );
}

Future<List<CategoryModel>> getCategoryList(String slug, bool isSubList) async {
  if (isSubList) {
    // categories = null;
    categories.isEmpty;
  }
  // if (categories == null) {
  if (categories.isEmpty) {
    Response response;
    //response = await http.get(Urls.ROOT_URL + slug);
    var http;

   response = await http.get(Urls.ROOT_URL + slug);
    response = await http.get(Urls.ROOT_URL + slug);
    int statusCode = response.statusCode;
    final body = json.decode(response.body);
    if (statusCode == 200) {
      categories =
          (body as List).map((i) => CategoryModel.fromJson(i)).toList();

      return categories;
    } else {
      // ignore: deprecated_member_use
      // return categories = List();
      return categories = [];
    }
  } else {
    return categories;
  }
}

// https://api.evaly.com.bd/core/public/categories/?parent=bags-luggage-966bc8aac     sub cate by slug
