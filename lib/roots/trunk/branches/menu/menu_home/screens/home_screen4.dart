// import 'dart:convert';
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../../category/components/gestion_agriculture_bio.dart';
// import '../../../../../../category/detailCategory/agriculture_integration.dart';
// import '../../../../../../category/detailCategory/agriculture_km_zero.dart';
// import '../../../../../../category/detailCategory/info_producers.dart';
// import '../../../../../../category/detailCategory/products_biologique.dart';
// import '../../../business/agricultures/agriculture_biodynamica/screens/agriculture_biodynamica_screen.dart';
// import '../../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
// import '../../../commun_data_utils/utils/theme/app_theme.dart';
// import '../../../groups/components/groups.dart';
// import '../../../groups/provider/groups_provider.dart';
// import '../../../localisation/translation/components/appLocalizations.dart';
// import '../../../search/widgets/search_bar_widget.dart';
// import '../components/home_items.dart';
// import '../provider/home_provider.dart';
// import '../widgets/grocery_featured_Item_widget.dart';
// import '../widgets/home_banner_widget.dart';
// import '../widgets/home_item_card_widget.dart';
//
//
// TextEditingController textInputSearch =  TextEditingController();
//
// class HomeScreen extends StatelessWidget {
//
//   HomeItems? item;
//   List<HomeItems> items = [];
//
//   List<Groups> groups=[];
//
//   List<MapEntry<String, HomeItems>> itemsMap=[];
//
//   List<HomeItems> agricultureBiologique = [];
//   List<HomeItems> beekeepingBiologique = [];
//
//   List<HomeItems> homeItemsList = [];
//   Map<String, HomeItems> homeItems = {};
//
//   Map<String, Groups> groupsItems = {};
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(providers: [
//       ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
//       // ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
//      ChangeNotifierProvider<GroupsProvider>(create: (_) => GroupsProvider()),
//
//     ],
//       child: Navigator(onGenerateRoute: (RouteSettings setting) {
//         return MaterialPageRoute(builder: (context) {
//           return HomeScreen();
//         });
//       },
//       ),
//       builder: (context, child) {
//
//         final homeProvider = Provider.of<HomeProvider>(context);
//         final groupsProviderDeclare = Provider.of<GroupsProvider>(context);
//
//          final loadListItem=context.read<HomeProvider>().getData();
//          final loadGroups=context.read<GroupsProvider>().getData();
//
//
//         items = context.read<HomeProvider>().items;
//
//          //
//          // homeItems = context.read<HomeProvider>().homeItems;
//          // /// items = context.read<HomeProvider>().items;
//          //     homeItems.forEach((key, value) {
//          //         if(!(items.length == homeItems.length)){
//          //              items.add(value);
//          //         }
//          //     });
//
//
//          groupsItems = context.read<GroupsProvider>().groupsItems;
//         /// groups = context.read<GroupsProvider>().groups;
//
//         // groupsItems.forEach((key, value) {
//         //   if(!(groups.length == groupsItems.length) ){
//         //     groups.add(value);
//         //   }
//         //
//         // });
//
//
//
//       ///  List<HomeItems> itemsList = List<HomeItems>.from(homeItems.map((item) => HomeItems.fromJsonFactory(item)));
//
//         //  List<HomeItems> groupsHome=[];
//         // List<HomeItems> groupsAgricultureBiologique=[];
//         // List<HomeItems> groupsBeekeepingBiologique=[];
//         // List<HomeItems> groupsGreenBuilding=[];
//
//         // if(items.isNotEmpty) {
//         //   for (int i = 0; i <= items.length; i++) {
//         //     for (HomeItems item in items) {
//         //       if (item.groups == "agricultureBiologique") {
//         //         groupsAgricultureBiologique.add(item);
//         //       }
//         //
//         //       if (item.groups == "beekeepingBiologique") {
//         //         groupsBeekeepingBiologique.add(item);
//         //       }
//         //
//         //       if (item.groups == "greenBuilding") {
//         //         groupsGreenBuilding.add(item);
//         //       }
//         //     }
//         //   }
//         // }
//       ///  agricultureBiologiques = context.read<HomeProvider>() .agricultureBiologiques;
//       ///  beekeepingBiologique = context.read<HomeProvider>() .beekeepingBiologique;
//
//
//
//
//         return Scaffold(
//           appBar: AppBar(
//             // backgroundColor: const Color.fromRGBO(250, 101, 243, 105),
//             toolbarHeight: 60.0,
//
//             title: TextField(
//               controller: textInputSearch,
//               cursorColor: Colors.white,
//               decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white70,
//                   contentPadding: const EdgeInsets.only(
//                       left: 14.0, bottom: 8.0, top: 8.0),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.white),
//                     borderRadius: BorderRadius.circular(25.7),
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.white),
//                     borderRadius: BorderRadius.circular(25.7),
//                   ),
//                   hintText: " Search...",
//                   border: InputBorder.none,
//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.search),
//                     color: const Color.fromRGBO(90, 25, 72, 1),
//                     onPressed: () {
//                       // showSearch(context: context, delegate: DataSearch(products,textInputSearch.value.text.toString()));
//                     },
//                   )),
//               style: const TextStyle(color: Colors.black, fontSize: 15.0),
//             ),
//             // backgroundColor: Colors.blueGrey,
//             ///Tabs
//             // bottom: TabBar(tabs: tabs),
//           ),
//           body: SafeArea(
//             child: Container(
//               child: SingleChildScrollView(
//                 child: Center(
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       SvgPicture.asset("assets/icons/app_icon_color.svg"),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       padded(locationWidget()),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       padded(SearchBarWidget()),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       padded(HomeBanner()),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                      // getHorizontalItemSlider(items),
//                        // Column(
//                        //   children:<Widget> [
//                        //     // generateWidgetSlider(items, groups),
//                        //   ///  for(var item in groups)
//                        //       // Text(item.name.toString())
//                        //      // generateWidgetSliderTitle(items, groups),
//                        //
//                        //       generateWidgetSlider(items, groups) ,
//                        //       // getHorizontalItemSliderHome(items, groups),
//                        //
//                        //     // Column(
//                        //     //   children: List<Widget>.generate(items.length, (index) => buildListItesHome(items, groups),
//                        //     //   ),
//                        //     // )
//                        //   ],
//                        //
//                        // ),
//                       const SizedBox(
//                         child: Column(
//                           children: <Widget> [
//                           //  for(var group in groups)
//                           //   Column(
//                           //     children: List<Widget>.generate(groups.length, (indexTitle) =>
//                           //         ///padded(subTitleHome(AppLocalizations.translate(groups[indexTitle].name.toString()),items, context, )),
//                           //       padded(subTitle(AppLocalizations.translate(groups[indexTitle].name.toString()))),
//                           //     ),
//                           //
//                           //   ),
//
//                             // Column(
//                             //   children: <Widget> [
//                             //     Column(
//                             //       children: List<Widget>.generate(items.length, (indexHome) =>
//                             //           getHorizontalItemSlider(context , indexHome , index, items,indexHome),
//                             //       ),
//                             //     )],
//                             // ),
//
//
//
//
//
//                             // Column(
//                             //   children: [
//                             //     ...List.generate(_alphabet.length, (index) => _getAlphabetItem(index))
//                             //   ],
//                             // ),
//
//                             // Column(
//                             //   /// children: List<Widget>.generate(items.length, (index) => buildListItemsHome(items, groups,context, index)),
//                             //   ///  children: List<Widget>.generate(homeItems.values.toList().length, (index) => buildListItemsHome(homeItems.entries.toList(), groups,context, index)),
//                             //
//                             //   // children: List<Widget>.generate(homeItems.values.toList().length, (index) => ListView.separated(
//                             //   children: List<Widget>.generate(items.length, (index) => ListView.separated(
//                             //     padding: const EdgeInsets.symmetric(horizontal: 20),
//                             //     // itemCount: items.length,
//                             //     itemCount: items.length,
//                             //     // itemCount: groups.length,
//                             //     scrollDirection: Axis.horizontal,
//                             //     itemBuilder: (context, index) {
//                             //       return GestureDetector(
//                             //         onTap: () {
//                             //           onItemClickedAll(context, items[index]);
//                             //         },
//                             //         child: HomeItemsWidget(
//                             //           item: items[index],
//                             //           heroSuffix: "home_screen",
//                             //         ),
//                             //       );
//                             //     },
//                             //     // separatorBuilder: (BuildContext context, int index) {
//                             //     separatorBuilder: (context, index) {
//                             //       return const SizedBox(
//                             //         width: 20,
//                             //       );
//                             //     },
//                             //   ),),
//                             //
//                             //
//                             // ),
//
//                           ],
//
//
//                         ),
//                       ),
//
//
//
//                          //  Column(
//                          //   children: <Widget> [
//                          //     Column(
//                          //       children: List<Widget>.generate(items.length, (indexHome) => buildListHome(items, groups),
//                          //       ),
//                          //     )],
//                          // ),
//
//                      // Column(
//                      //   children:List<Widget>.generate(length, (index) => buildListHome(itemsHome, groups),
//                      // )
//                      //  Column(
//                      //    children:<Widget> [
//                      //      // generateWidgetSlider(items, groups),
//                      //      for(var item in items)
//                      //
//                      //       /// buildListItemsHome(items, item ,groups, context, 0),
//                      //          getHorizontalItemSlider(items),
//                      //
//                      //    ],
//                      //
//                      //  ),
//
//                       // Column(
//                       //   children:<Widget> [
//                       //     // generateWidgetSlider(items, groups),
//                       //     for(var item in groups)
//                       //     // Text(item.name.toString())
//                       //       generateWidgetSlider(items, groups),
//                       //
//                       //   ],
//                       //
//                       // ),
//
//                        // padded(subTitle(AppLocalizations.translate('agricultureBiological').toString())),
//                 //      getHorizontalItemSliderHome(items, groups),
//
//
//                    //   getHorizontalItemSlider(items),
//                       // // getHorizontalItemSlider(HomeProvider().homeItems.values.toList()),
//                       // const SizedBox(
//                       //   height: 25,
//                       // ),
//                       // padded(subTitle(AppLocalizations.translate('beekeepingBiologique').toString())),
//                       // getHorizontalItemSlider(beekeepingBiologique),
//                        const Column(
//                         children: [
//                           SizedBox(
//                             height: 25,
//                           ),
//                         ],
//                       ),
//                       // padded(subTitle("hotetBiologique")),
//                       // getHorizontalItemSlider(hotetBiologique),
//                       // const SizedBox(
//                       //   height: 25,
//                       // ),
//                       // padded(subTitle("greenbuilding")),
//                       // getHorizontalItemSlider(greenbuilding),
//                       // const SizedBox(
//                       //   height: 25,
//                       // ),
//                       // padded(subTitle("hotelBiologique")),
//                       //  getHorizontalItemSlider(hotelBiologique),
//                       // const SizedBox(
//                       //   height: 15,
//                       // ),
//                       // padded(subTitle("Best Selling")),
//                       // getHorizontalItemSlider(hotetBiologique),
//                       // const SizedBox(
//                       //   height: 15,
//                       // ),
//                       padded(subTitle("Groceries")),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Container(
//                         height: 105,
//                         child: ListView(
//                           padding: EdgeInsets.zero,
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             GroceryFeaturedCard(
//                               groceryFeaturedItems[0],
//                               color: const Color(0xffF8A44C),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             GroceryFeaturedCard(
//                               groceryFeaturedItems[1],
//                               color: AppColors.primaryColor,
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//
//                       ///  getHorizontalItemSlider(hotelBiologique),
//                       const SizedBox(
//                         height: 15,
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
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
//   ///***********************************************************************************************************
//
//   Widget getHorizontalItemSlider111(List<HomeItems> items) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       height: 250,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: items.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               onItemClicked(context, items[index]);
//             },
//             child: HomeItemsWidget(
//               item: items[index],
//               heroSuffix: "home_screen",
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return const SizedBox(
//             width: 20,
//           );
//         },
//       ),
//     );
//   }
//
//
//
//   List<Widget> buildListHome(List<HomeItems> itemsHome, List<String> groups){
//
//     return itemsHome.map((elements) {
//         return   Container(
//           margin: const EdgeInsets.symmetric(vertical: 10),
//           height: 250,
//           child: ListView.separated(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             // itemCount: items.length,
//             itemCount: itemsHome.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   onItemClickedAll(context, itemsHome[index]);
//                 },
//                 child: HomeItemsWidget(
//                   // item: itemsHome[index],
//                   item: elements,
//                   heroSuffix: "home_screen",
//                 ),
//               );
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return const SizedBox(
//                 width: 20,
//               );
//             },
//           ),
//         );
//     }).toList();
//
//  }
//
//  List<Widget> buildListTitle(List<HomeItems> itemsHome, List<String> groups){
//
//     return groups.map((e) {
//       return ListTile(
//         title: padded(Text(AppLocalizations.translate(e).toString())),
//       );
//     }).toList();
//
//  }
//
//
//  // List<Widget> buildDrawerSection(List<HomeItems> itemsHome, List<String> groups){
//   List<Widget> buildDrawerSection(List<HomeItems> itemsHome, List<String> groups,Map<String, HomeItems> section){
//
//     List<Widget> titleWidgets=[];
//     List<Widget> groupesWidgets=[];
//
//     titleWidgets.add(getHorizontalItemSlider(items));
//     return [
//
//        // buildListTitle(section['chapter'] as List<HomeItems>),
//       // ...buildListHome(section['pages'])
//       // buildListTitle(section),
//       // buildListHome(itemsHome, groups),
//     ];
//  }
//
//
//    Widget generateWidgetSliderTitle(itemsHome, List<String> groups){
//
//     List<Widget> listTitleGroupHome = [];
//           for(var i=0; i<groups.length; i++){
//
//
//       listTitleGroupHome.add(padded(Text(AppLocalizations.translate(groups[i]).toString())) );
//       // for(HomeItems groupItem in itemsHome){
//       //
//       //   if(groupItem.groups.toString()== groups[i].toString()){
//       //
//       //     // listWidgetGroupHome.add(Text(groups[i]));
//       //     listTitleGroupHome.add(padded(Text(AppLocalizations.translate(groups[i]).toString())) );
//       //
//       //   }
//       // }
//
//
//     }
//
//     // for(HomeItems groupItem in itemsHome){
//     //
//     //   if(groupItem.groups.toString()== groups[i].toString()){
//     //
//     //     listWidgetGroupHome.add(getHorizontalItemSliderHome(itemsHome, groups));
//     //
//     //   }
//     // }
//      return Column(children:listTitleGroupHome);
//     // OK return Column(
//     //   mainAxisAlignment: MainAxisAlignment.center,
//     //   children:<Widget>[
//     //     Row(
//     //       // OK children:listTitleGroupHome,
//     //       children: groups.map((item) => padded(Text(AppLocalizations.translate(item.toString()).toString()))).toList(),
//     //     ),
//     //     // Row(
//     //     //   children: listWidgetGroupHome,
//     //     // ),
//     //   ],);
//
//   }
//
//   ///***********************************************************************************************************
//   ///
//   Widget buildListItemsHome(List<HomeItems>  items, HomeItems item, List<Groups> groups, BuildContext context,indexFist) {
//
//    // List<HomeItems> itemsFilter =[];
//
//     // List<HomeItems> itemsFilter =[];
//     //
//     // itemsFilter = itemsHome;
//
//    /// Map<String,dynamic> newHoeItem= HomeItems.fromJsonFactory(homeItems.entries.);
//
//     // for(int i=0; i< itemsHome.length; i++) {
//     //   for (HomeItems item in itemsHome) {
//     //     // if (item.groups.toString() == groups[i].toString()) {
//     //     for(var group in groups){
//     //
//     //       if (item.groups.toString() == group.toString()) {
//     //
//     //            if(!itemsFilter.contains(item)){
//     //           //  if (item.groups == itemsFilter[i].groups ){
//     //           itemsFilter.add(item);
//     //           // }
//     //         }
//     //       }
//     //     }
//     //   }
//     // }
//
//   //  List<HomeItems> itemsList = List<HomeItems>.from(items.map((item) => HomeItems.fromJson(item)));
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       height: 250,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         // itemCount: items.length,
//         itemCount: items.length,
//        // itemCount: groups.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // onItemClickedAll(context, itemsFilter[index]);
//               onItemClickedAll(context, item);
//             },
//             child: HomeItemsWidget(
//               // item: items[index],
//                 item: item,
//               heroSuffix: "home_screen",
//             ),
//           );
//         },
//         // separatorBuilder: (BuildContext context, int index) {
//         separatorBuilder: (context, index) {
//           return const SizedBox(
//             width: 20,
//           );
//         },
//       ),
//     );
//   }
//
//   Widget createListWidgetHome(context,List<HomeItems> items) {
//     return  getHorizontalItemSlider(items);
//   }
//
//
//   Widget getHorizontalItemSliderHome1(List<HomeItems> items) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       height: 250,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: items.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               onItemClickedAll(context, items[index]);
//             },
//             child: HomeItemsWidget(
//               item: items[index],
//               heroSuffix: "home_screen",
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return const SizedBox(
//             width: 20,
//           );
//         },
//       ),
//     );
//   }
//
//   Widget generateWidgetSlider(itemsHome, List<Groups> groups){
//
//     //  Widget? widgetGroup;
//     List<Widget> listWidgetGroupHome= [];
//
//
//     for(var i=0; i<groups.length; i++){
//
//       // listWidgetGroupHome.add(Text(groups[i]));
//       // listTitleGroupHome.add(padded(Text(AppLocalizations.translate(groups[i]).toString())) );
//       // listWidgetGroupHome.add(getHorizontalItemSliderHome(itemsHome, groups));
//
//       for(HomeItems groupItem in itemsHome){
//
//         if(groupItem.groups.toString()== groups[i].toString()){
//
//            listWidgetGroupHome.add(getHorizontalItemSliderHome(itemsHome, groups));
//
//         }
//       }
//
//     }
//     // return Column(children:listWidgetGroupHome);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children:<Widget>[
//         Row(
//            // OK children:listTitleGroupHome,
//             children: groups.map((item) => padded(Text(AppLocalizations.translate(item.toString()).toString()))).toList(),
//         ),
//         Row(
//           children: listWidgetGroupHome,
//         ),
//       ],);
//
//   }
//
//
//  Widget getHorizontalItemSliderHome(itemsHome, List<Groups> groups ){
//
//     return  Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       height: 250,
//
//       child: ListView.separated(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           scrollDirection: Axis.horizontal,
//           // itemCount: items.length,
//           itemCount: itemsHome.length,
//           itemBuilder: (BuildContext context, int index){
//             return Column(
//               children: [
//                 // padded(subTitle(AppLocalizations.translate('agricultureBiological').toString())),
//                 Row(
//                   children: [
//                     padded(subTitle(AppLocalizations.translate(items[index].name))),
//                   ],
//                 ),
//
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: (){
//                         onItemClickedAll(context, itemsHome[index]);
//                       },
//                       child: HomeItemsWidget(
//                           item: itemsHome[index],
//                           itemsList: itemsHome,
//                           heroSuffix: "home_screen"
//                       ),
//                     )
//                   ],
//                 ),
//                 // Row(
//                 //   children: [
//                 //     GestureDetector(
//                 //       onTap: (){
//                 //         onItemClickedAll(context, items[index]);
//                 //       },
//                 //       child: HomeItemsWidget(
//                 //           item: items[index],
//                 //           itemsList: items,
//                 //           heroSuffix: "home_screen"
//                 //       ),
//                 //     )
//                 //   ],
//                 // ),
//                 // Row(
//                 //   children: [
//                 //     GestureDetector(
//                 //       onTap: (){
//                 //         onItemClickedAll(context, items[index]);
//                 //       },
//                 //       child: HomeItemsWidget(
//                 //           item: items[index],
//                 //           itemsList: items,
//                 //           heroSuffix: "home_screen"
//                 //       ),
//                 //     )
//                 //   ],
//                 // ),
//
//                 // okRow(
//                 //   children: [
//                 //      GestureDetector(
//                 //       onTap: (){
//                 //         onItemClickedAll(context, items[index]);
//                 //       },
//                 //        child: HomeItemsWidget(
//                 //                    item: items[index],
//                 //                    heroSuffix: "home_screen"
//                 //        ),
//                 //      )
//                 //   ],
//                 // ),
//
//               ],
//
//             );
//
//             // return GestureDetector(
//             //   onTap: (){
//             //     onItemClickedAll(context, items[index]);
//             //   },
//             //
//             //   child: HomeItemsWidget(
//             //       item: item,
//             //     heroSuffix: "home_screen",
//             //    ) ,
//             //
//             // );
//           },
//           separatorBuilder: (BuildContext context, int index){
//             return const SizedBox(width: 20,);
//           }
//         //children: [],
//       ),
//     );
//
//   }
//
//   final List _alphabet =
//   List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));
//
//
//
//
//   getHorizontalItemSliderNew(List<HomeItems> items,BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       height: 250,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: items.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               onItemClickedAll(context, items[index]);
//             },
//             child: HomeItemsWidget(
//               item: items[index],
//               heroSuffix: "home_screen",
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return const SizedBox(
//             width: 20,
//           );
//         },
//       ),
//     );
//   }
//
//   // Widget getHorizontalItemSlider(List<homeItems> items) {
//    getHorizontalItemSlider(List<HomeItems> items) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       height: 250,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: items.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               onItemClickedAll(context, items[index]);
//             },
//             child: HomeItemsWidget(
//               item: items[index],
//               heroSuffix: "home_screen",
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return const SizedBox(
//             width: 20,
//           );
//         },
//       ),
//     );
//   }
//
//
//   void onItemClicked(BuildContext context, HomeItems homeItems) {
//
//
//     // var page = AgricultureBiologiqueScreen(item: GestionAgricultureBio().product);
//     //
//     // var pageScreen=pageScreenPathParseWidget(page);
//     //
//     // var pageFinal =pageScreen;
//
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//        // builder: (context) => pageScreen,
//          builder: (context) =>AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
//         ));
//   }
//
//
//   void onItemClickedAll(BuildContext context, HomeItems homeItems) {
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //       builder: (context) =>pageScreenPath(homeItems.pageScreenPath),
//     //    // builder: (context) =>AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
//     // ));
//
//
//     if (AppLocalizations.translate(homeItems.name) == AppLocalizations.translate('agricultureBiological').toString()) {
//       Navigator.of(context).push(MaterialPageRoute(
//         /// builder: (context) => AgricultureBiologique(item: GestionAgricultureBio().product, itemCart: GestionAgricultureBio().itemCart)
//         builder: (context) => AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
//       ));
//     }
//     if (AppLocalizations.translate(homeItems.name) ==
//         AppLocalizations.translate('agricultureBiodynamic')
//             .toString()) {
//       Navigator.of(context).push(MaterialPageRoute(
//         // builder: (context) => const AgricultureBiodymamique(),
//         builder: (context) => AgricultureBiodynamicaScreen(),
//       ));
//     }
//     if (AppLocalizations.translate(homeItems.name) ==
//         AppLocalizations.translate('agricultureIntegration')
//             .toString()) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const AgricultureIntegration(),
//       ));
//     }
//     if (AppLocalizations.translate(homeItems.name) ==
//         AppLocalizations.translate('agricultureKmZero').toString()) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const AgricultureKmZero(),
//       ));
//     }
//     if (AppLocalizations.translate(homeItems.name) ==
//         AppLocalizations.translate('productsBiologiques').toString()) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const ProductsBiologique(),
//       ));
//     } //list des producteurs agriculture biologique
//     if (AppLocalizations.translate(homeItems.name) ==
//         AppLocalizations.translate('infoProducts').toString()) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const InfoProducers(),
//       ));
//     }
//   }
//
//   // void onItemClicked(BuildContext context, HomeItems homeItems) {
//   //   Navigator.push(
//   //     context,
//   //     MaterialPageRoute(
//   //         builder: (context) => ProductDetailsScreen(
//   //           homeItems,
//   //               heroSuffix: "home_screen",
//   //             )),
//   //   );
//   // }
//
//   Widget subTitleHome(String text,  List<HomeItems> items, BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           text,
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const Spacer(),
//         const Text(
//           "See All",
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryColor),
//         ),
//
//        // getHorizontalItemSliderNew(items,context),
//       ],
//     );
//   }
//
//   Widget subTitle(String text) {
//     return Row(
//       children: [
//         Text(
//           text,
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const Spacer(),
//         const Text(
//           "See All",
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryColor),
//         ),
//
//         getHorizontalItemSlider(items),
//       ],
//     );
//   }
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
//
//   Widget fetchPath(page) {
//     final data = json.decode(page);
//     return pageScreenPathParseWidget(data);
//   }
//
//   Widget pageScreenPathParseWidget(data) {
//     // var element =AgricultureBiologiqueScreen(item: GestionAgricultureBio().product);
//     // var routePageScreen =pageScreenPath;
//
//     switch (data['class']) {
//       case 'Container':
//         return Container(
//           child: pageScreenPathParseWidget([]),
//         );
//       case 'Text':
//         return Text(data['value']);
//     }
//     return data;
//   }
//
//
//   }