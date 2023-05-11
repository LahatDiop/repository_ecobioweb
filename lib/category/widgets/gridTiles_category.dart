import 'package:flutter/material.dart';

import '../../products/screen/products_screen.dart';
import '../screens/subCategoryScreen.dart';


/*
import 'package:flutter_ecommerce_app/screens/ProductsScreen.dart';
import 'package:flutter_ecommerce_app/screens/SubCategoryScreen.dart';

*/

// ignore: must_be_immutable
class GridTilesCategory extends StatelessWidget {
  late String name;
  late String imageUrl;
  late String slug;
  late bool fromSubProducts = false;

  GridTilesCategory(
      {required Key key,
      required this.name,
      required this.imageUrl,
      required this.slug,
      required this.fromSubProducts})
      : super(key: key);

  final elementKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (fromSubProducts) {
          print(slug);
          Navigator.push( 
            context,
            MaterialPageRoute(
                builder: (context) => ProductsScreen(
                      slug: "products/?page=1&limit=12&category=" + slug,
                      name: name,
                      key: elementKey,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategoryScreen(
                      slug: slug,
                    )),
          );
        }
      },
      child: Card(
          color: Colors.white,
          elevation: 0,
          child: Center(
            child: Column(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
                Text(name,
                    style: const TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Roboto-Light.ttf',
                        fontSize: 12))
              ],
            ),
          )),
    );
  }
}
