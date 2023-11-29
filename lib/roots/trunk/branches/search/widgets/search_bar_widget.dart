import 'package:ecobioweb/main_menu_ok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../products/screen/products_screen.dart';
import '../../business/agricultures/agriculture_biodynamica/screens/agriculture_biodynamica_screen.dart';
import '../../business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
import '../../cart/provider/cart_provider.dart';
import '../../localisation/translation/components/appLocalizations.dart';
import '../../menu/menu_home/provider/home_provider.dart';
import '../../products/components/product.dart';

class SearchBarWidget extends StatelessWidget {
  // padded(SearchBarWidget(textInputSearch)),
  final String searchIcon = "/assets/icons/search_icon.svg";
  TextEditingController textInputSearch =  TextEditingController();
  List<Product> products = [];

   String? dataSearchInfo;

  SearchBarWidget(this.textInputSearch);

  @override

  Widget build(BuildContext context) {
    return MultiProvider(providers:  [
      ChangeNotifierProvider<AgricultureBiologicalProvider>(create: (_) => AgricultureBiologicalProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ],
      child: Navigator(onGenerateRoute: (RouteSettings settings){

        return MaterialPageRoute(builder: (context){
          return SearchBarWidget(textInputSearch);
        });
      },),

      builder: (context,child) {
        int tabIndex = 0;
        final productProvider = Provider.of<AgricultureBiologicalProvider>(context);
        var listProducts= context.read<AgricultureBiologicalProvider>().getData(tabIndex);

        products =context.read<AgricultureBiologicalProvider>().products;

        return  Container(
          padding: const EdgeInsets.all(16),
          width: double.maxFinite,
          // decoration: BoxDecoration(
          //   color: const Color(0xFFF2F3F2),
          //   borderRadius: BorderRadius.circular(20),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              // SvgPicture.asset(
              //   searchIcon,
              // ),
              // const SizedBox(
              //   width: 8,
              // ),
               Flexible(
                  child: TextField(
                    controller:textInputSearch ,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.white70,
                        fillColor: Colors.green.shade100,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          // borderSide:  const BorderSide(color: Colors.white),
                          borderSide:  const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:  const BorderSide(color: Colors.white),
                          borderRadius:  BorderRadius.circular(25.7),
                        ),

                        hintText: AppLocalizations.translate("search_point"),
                        // labelText: "",
                        labelText: dataSearchInfo,
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          color: const Color.fromRGBO(90, 25, 72, 1),
                          onPressed: () {
                            showSearch(context: context, delegate: DataSearch(products, textInputSearch.value.text.toString()));
                          },
                        )
                    ),
                    style: const TextStyle(color: Colors.black, fontSize: 15.0),

                  )
               ),

              // SvgPicture.asset(
              //   searchIcon,
              // ),
              // const SizedBox(
              //   width: 8,
              // ),

              // Text(
              //   "Search Store",
              //   style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xFF7C7C7C)),
              // )
              ///Search
              // const Text(
              //   "",
              //   style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xFF7C7C7C)),
              // )
              //  TextField(
              //   controller:textInputSearch ,
              //   cursorColor: Colors.white,
              //   decoration: InputDecoration(
              //       filled: true,
              //       // fillColor: Colors.white70,
              //       fillColor: Colors.green.shade100,
              //       contentPadding: const EdgeInsets.only(
              //           left: 14.0, bottom: 8.0, top: 8.0),
              //       focusedBorder: OutlineInputBorder(
              //         // borderSide:  const BorderSide(color: Colors.white),
              //         borderSide:  const BorderSide(color: Colors.white),
              //         borderRadius: BorderRadius.circular(25.7),
              //       ),
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide:  const BorderSide(color: Colors.white),
              //         borderRadius:  BorderRadius.circular(25.7),
              //       ),
              //
              //       hintText: AppLocalizations.translate("search_point"),
              //       labelText: "",
              //       border: InputBorder.none,
              //       suffixIcon: IconButton(
              //         icon: const Icon(Icons.search),
              //         color: const Color.fromRGBO(90, 25, 72, 1),
              //         onPressed: () {
              //           showSearch(context: context, delegate: DataSearch(products, textInputSearch.value.text.toString()));
              //         },
              //       )
              //   ),
              //   style: const TextStyle(color: Colors.black, fontSize: 15.0),
              // ),

            ],
          ),
            );
      },
    );

  }

  Widget build1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            searchIcon,
          ),
          const SizedBox(
            width: 8,
          ),
          // Text(
          //   "Search Store",
          //   style: TextStyle(
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold,
          //       color: Color(0xFF7C7C7C)),
          // )
          TextField(
            controller:textInputSearch ,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                filled: true,
                // fillColor: Colors.white70,
                fillColor: Colors.green.shade100,
                contentPadding: const EdgeInsets.only(
                    left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  // borderSide:  const BorderSide(color: Colors.white),
                  borderSide:  const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:  const BorderSide(color: Colors.white),
                  borderRadius:  BorderRadius.circular(25.7),
                ),

                hintText: AppLocalizations.translate("search_point"),
                labelText: "",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  color: const Color.fromRGBO(90, 25, 72, 1),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch(products, textInputSearch.value.text.toString()));
                  },
                )
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15.0),
          )
        ],
      ),
    );
  }
}
