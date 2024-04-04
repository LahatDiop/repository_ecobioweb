

import 'package:ecobioweb/roots/trunk/branches/business/honey/honet_Propolis_bio/provider/honey_biological_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/business/honey/honet_Propolis_bio/screens/honey_biological_screen.dart';
import 'package:ecobioweb/roots/trunk/branches/commun_data_utils/utils/helper/padded.dart';
import 'package:ecobioweb/roots/trunk/branches/commun_data_utils/utils/helper/subtitle.dart';
import 'package:ecobioweb/roots/trunk/branches/localisation/translation/screens/tanslation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../category/components/gestion_agriculture_bio.dart';
import '../../../../../../category/detailCategory/agriculture_integration.dart';
import '../../../../../../category/detailCategory/agriculture_km_zero.dart';
import '../../../../../../category/detailCategory/info_producers.dart';
import '../../../../../../category/detailCategory/products_biologique.dart';
import '../../../business/agricultures/agriculture_biodynamica/screens/agriculture_biodynamica_screen.dart';
import '../../../business/agricultures/agriculture_biological/provider/agriculture_biological_provider.dart';
import '../../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
import '../../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screenOK.dart';
import '../../../cart/provider/cart_provider.dart';
import '../../../commun_data_utils/utils/columns/column_with_seprator.dart';
import '../../../commun_data_utils/utils/theme/app_theme.dart';
import '../../../groups/components/groups.dart';
import '../../../localisation/translation/components/appLocalizations.dart';
import '../../../products/components/product.dart';
import '../../../search/widgets/search_bar_widget.dart';
import '../components/home_items.dart';
import '../provider/home_provider.dart';
import '../widgets/grocery_featured_Item_widget.dart';
import '../widgets/home_banner_widget.dart';
import '../widgets/home_items_widget.dart';


// class HomeScreen extends StatelessWidget {

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
_HomeScreenState createState()=> _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  Map<String, List<HomeItems>> mapGroupListHomeItems={};

  Map<String, HomeItems> homeItems ={};

  List<HomeItems> items =[];
  List<HomeItems> itemsNew =[];
  /// LIST Groups
  // List<Groups> groups = [];
  List<String> groupsHome=[];

  int indexGroup=0;
  // late Translation _translation;
  // final String _text =
  //     'Toda persona tiene derecho a la educación. La educación debe ser gratuita, al menos en lo concerniente a la instrucción elemental y fundamental. La instrucción elemental será obligatoria. La instrucción técnica y profesional habrá de ser generalizada; el acceso a los estudios superiores será igual para todos, en función de los méritos respectivos.';
  // TranslationModel _translated = TranslationModel(translatedText: '', detectedSourceLanguage: '');
  // TranslationModel _detected = TranslationModel(translatedText: '', detectedSourceLanguage: '');

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  // //  fetchItems().whenComplete(() => setState(() {}));
  // }

  // fetchItems() async {
  //
  //   var dataItemsHome = await HomeProvider().getData();
  //   var dataItemsGroup = await GroupsProvider().getData();
  //
  //   items = dataItemsHome;
  //   groupsHome=groupsHome;
  //    // items = await HomeProvider().items;
  //
  // }

  TextEditingController textInputSearch =  TextEditingController();
  List<Product> products = [];



  @override

  Widget build(BuildContext context) {


    return MultiProvider(providers:  [
      ChangeNotifierProvider<HomeProvider>(create: (_)=>HomeProvider()),
      ChangeNotifierProvider<AgricultureBiologicalProvider>(create: (_) => AgricultureBiologicalProvider()),
      ChangeNotifierProvider<HoneyBiologicalProvider>(create: (_)=>HoneyBiologicalProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ],
      child: Navigator(onGenerateRoute: (RouteSettings settings){

        return MaterialPageRoute(builder: (context){
          return const HomeScreen();
          // return AgricultureBiodynamicaScreen();
        });
      },),

      builder: (context,child) {
        int tabIndex = 0;
        final adminProvider = Provider.of<HomeProvider>(context);
        var listItemsAdmin = context.read<HomeProvider>().getData();

        final productProvider = Provider.of<AgricultureBiologicalProvider>(context);
        var listProducts= context.read<AgricultureBiologicalProvider>().getData(tabIndex);


        mapGroupListHomeItems = context.read<HomeProvider>().mapGroupListHomeItems;
        homeItems = context.read<HomeProvider>().homeItems;
        items = context.read<HomeProvider>().items;
        groupsHome = context.read<HomeProvider>().groupsHome;
        products =context.read<AgricultureBiologicalProvider>().products;

        return Scaffold(
          appBar: AppBar(
            // backgroundColor: const Color.fromRGBO(250, 101, 243, 105),
            // toolbarHeight: 60.0,
            toolbarHeight: 50.0,
             /// title: SearchBarWidget(textInputSearch),
            title: Padded.padded(SearchBarWidget(textInputSearch)),

          ),
          body: SafeArea(
            child: Container(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // SvgPicture.asset("assets/icons/app_icon_color.svg"),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // Padded.padded(locationWidget()),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                     // SearchBarWidget(),
                     //  Padded.padded(SearchBarWidget()),
                     //  Padded.padded(SearchBarWidget(textInputSearch)),
                      const SizedBox(
                        height: 2,
                      ),
                       Padded.padded(HomeBanner()),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Padded.padded(SubTitle().subTitle("Exclusive Bio")),
                      //  getHorizontalItemSlider(exclusiveOffers),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // Padded.padded(subTitle("Best Selling")),
                      // //     getHorizontalItemSlider(greenbuilding),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // Padded.padded(subTitle("Groceries")),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      SizedBox(
                        // height: 105,
                        height: 80,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            GroceryFeaturedCard(
                              groceryFeaturedItems[0],
                              color: const Color(0xffF8A44C),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GroceryFeaturedCard(
                              groceryFeaturedItems[1],
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Column(
                        children: getChildrenWithSeperator(
                          addToLastChild: false,
                          ///  widgets: cartItems.map((e) {
                          //  widgets: cartList.map((e) {
                          //  widgets: _cartItemsMap.values.toString().map((e) {
                          // widgets: adminItems.entries.map((e){
                          widgets: mapGroupListHomeItems.entries.map((e){
                            //   var index =e.value.indexWhere((element) => e.key).
                            //     List<AdminItems> values=e.value;

                            String group =e.key;
                            List<HomeItems> list=e.value;

                            List<HomeItems> listItems=[];
                            listItems.addAll(e.value);

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 230,
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                itemCount: listItems.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,  index) {
                                  return GestureDetector(
                                    onTap: () {
                                      onItemClicked(context, listItems[index]);
                                      ///(context) => ProductViewPage(product: product);
                                    },
                                    child: HomeItemsWidget(
                                      /// horizontalItemSliderHome[1],
                                      groups: groupsHome,
                                      item: listItems[index],
                                      heroSuffix: "home_screen",
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(
                                    width: 20,
                                  );
                                },
                              ),
                            );

                            ///int  indexProd=cartItems.elementAt(index);
                            // return Container(
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: 25,
                            //   ),
                            //   width: double.maxFinite,
                            //   child: AdminItemsWidget(
                            //     groups: groups,
                            //     items: items,
                            //     item: e.value[index],
                            //     heroSuffix: "admin_screen",
                            //
                            //    // itemCart: e.value,
                            //     /// evalue,
                            //     //itemCart: e.value,
                            //     ///amount:e.value.quantity,
                            //   ),
                            // );


                          }).toList(),

                          seperator: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

  }

  Widget build1(BuildContext context) {

    // var data = await HomeProvider().getData();
    //
    // List<HomeItems> items = HomeProvider().items;


    // Future<List<HomeItems>> ii=   getListData();

        return Scaffold(
          appBar: AppBar(
            // backgroundColor: const Color.fromRGBO(250, 101, 243, 105),
            toolbarHeight: 60.0,

            title: TextField(
              controller: textInputSearch,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  hintText: AppLocalizations.translate("search_point"),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    color: const Color.fromRGBO(90, 25, 72, 1),
                    onPressed: () {
                      // showSearch(context: context, delegate: DataSearch(products,textInputSearch.value.text.toString()));
                    },
                  )),
              style: const TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            // backgroundColor: Colors.blueGrey,
            ///Tabs
            // bottom: TabBar(tabs: tabs),
          ),
          body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SvgPicture.asset("assets/icons/app_icon_color.svg"),
                  const SizedBox(
                    height: 5,
                  ),
                  Padded.padded(locationWidget()),
                  const SizedBox(
                    height: 15,
                  ),
                 /// Padded.padded(SearchBarWidget()),
                  const SizedBox(
                    height: 25,
                  ),
                  Padded.padded(HomeBanner()),
                  const SizedBox(
                    height: 25,
                  ),
                  Padded.padded(SubTitle().subTitle("Exclusive Order")),
                //  getHorizontalItemSlider(exclusiveOffers),
                  const SizedBox(
                    height: 15,
                  ),
                  Padded.padded(SubTitle().subTitle("Best Selling Lahat")),
             //     getHorizontalItemSlider(greenbuilding),
                  const SizedBox(
                    height: 15,
                  ),
                  Padded.padded(SubTitle().subTitle("Groceries")),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 105,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        GroceryFeaturedCard(
                          groceryFeaturedItems[0],
                          color: const Color(0xffF8A44C),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GroceryFeaturedCard(
                          groceryFeaturedItems[1],
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                 // Column(
                 //   children: [
                 //     buildTitele(groups),
                 //
                 //   ],
                 // ),
                 //  Column(
                 //    children: [
                 //    for(int y=0 ; y<groups.length ; y++)
                 //      buildList(items,groups,y),
                 //    ],
                 //  ),
                 // HomeItemsWidget(
                 //   // itemsList:horizontalItemSliderHome[1],
                 //    horizontalItemSliderHome[1],
                 //    itemsList: items,
                 //    //item: items[1],
                 //    heroSuffix:"home_screen",
                 // ),

                  //OK for(int i=0 ; i<groups.length ; i++)
                  //
                  //      //   checkGroupWidget(items,groups),
                  //    //   for(var group in groups)
                  //        getHorizontalItemSliders(items,context, i),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


// Container getHorizontalItemSlidersList(List<HomeItems> items,BuildContext context,int y) {
//
//     itemsNew=  checkGroupWidget(items,groups,context, y);
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       height: 250,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: itemsNew.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               onItemClicked(context, itemsNew[index]);
//             },
//             child: HomeItemsWidget(
//               /// horizontalItemSliderHome[1],
//               item: itemsNew[index],
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

  // Widget getHorizontalItemSliders(List<HomeItems> items,BuildContext context, int y) {
  //
  // itemsNew=  checkGroupWidget(items,groups,context, y);
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 10),
  //     height: 250,
  //     child: ListView.separated(
  //       padding: const EdgeInsets.symmetric(horizontal: 20),
  //       itemCount: itemsNew.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) {
  //         return GestureDetector(
  //           onTap: () {
  //             onItemClicked(context, itemsNew[index]);
  //           },
  //           child: HomeItemsWidget(
  //            /// horizontalItemSliderHome[1],
  //            item: itemsNew[index],
  //             heroSuffix: "home_screen",
  //           ),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) {
  //         return const SizedBox(
  //           width: 20,
  //         );
  //       },
  //     ),
  //   );
  // }

    void onItemClicked(BuildContext context, HomeItems homeItems) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) =>pageScreenPath(homeItems.pageScreenPath),
    //    // builder: (context) =>AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
    // ));


    if (AppLocalizations.translate(homeItems.name) == AppLocalizations.translate('agricultureBiological')) {
      Navigator.of(context).push(MaterialPageRoute(
        /// builder: (context) => AgricultureBiologique(item: GestionAgricultureBio().product, itemCart: GestionAgricultureBio().itemCart)
        builder: (context) => AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
      ));
    }
    if (AppLocalizations.translate(homeItems.name) ==
        AppLocalizations.translate('agricultureBiodynamic')
            .toString()) {
      Navigator.of(context).push(MaterialPageRoute(
        // builder: (context) => const AgricultureBiodymamique(),
        builder: (context) => AgricultureBiodynamicaScreen(),
      ));
    }
    if (AppLocalizations.translate(homeItems.name) ==
        AppLocalizations.translate('agricultureIntegration')
            .toString()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AgricultureIntegration(),
      ));
    }
    if (AppLocalizations.translate(homeItems.name) ==
        AppLocalizations.translate('agricultureKmZero')) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AgricultureKmZero(),
      ));
    }
    if (AppLocalizations.translate(homeItems.name) ==
        AppLocalizations.translate('productsBiologiques')) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProductsBiologique(),
      ));
    } //list des producteurs agriculture biologique
    if (AppLocalizations.translate(homeItems.name) ==
        AppLocalizations.translate('infoProducts')) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const InfoProducers(),
      ));
    }

    // var data = Text(homeItems.pageScreenPath!).data;
    //
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) {
    //         return Text(data.toString());
    //       },
    //     ));
String value = homeItems.name;
    if (AppLocalizations.translate(value) == AppLocalizations.translate('honey')) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>  HoneyBiologicalScreen(),
      ));
    }
  }
  // void onItemClicked11(BuildContext context, HomeItems groceryItem) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => ProductDetailsScreen(
  //           groceryItem,
  //           heroSuffix: "home_screen",
  //         )
  //     ),
  //   );
  // }

  // Widget subTitle(String text) {
  //   return Row(
  //     children: [
  //       Text(
  //         text,
  //         style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //       ),
  //       const Spacer(),
  //       const Text(
  //         "See All HomeScreen",
  //         style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.primaryColor),
  //       ),
  //     ],
  //   );
  // }

  Widget locationWidget() {
    String locationIconPath = "assets/icons/location_icon.svg";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          locationIconPath,
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          "Khartoum,Sudan",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }


  List<HomeItems> checkGroupWidget(List<HomeItems> items, List<Groups> groups,BuildContext context,int y) {

     List<HomeItems> itemsGroups=[];


     for( int i=y; i<groups.length; i++){
       for(int j=0; j<items.length; j++){

         if(!itemsGroups.contains(items[j]) && items[j].groups ==items[i].groups ){

           itemsGroups.add(items[j]);
           // j--;
         }else if(!(items[j].groups ==items[i].groups)) {
           // if (itemsGroups.contains(items[i])) {
           //   // for (int k = 0; k < itemsGroups.length; k++) {
           //   //   itemsGroups.remove(itemsGroups[i]);
           //   // }
           //   //   itemsGroups.clear();
           //  break;
           // }else
             if (!itemsGroups.contains(items[j])){
                 itemsGroups.add(items[j]);
           }
         }

         //   // else{
         //   //
         //   //   // for(int k=0; k<itemsGroups.length; k++){
         //   //   //   itemsGroups.remove(itemsGroups[k]);
         //   //   // }
         //   //
         //   //     if(!itemsGroups.contains(items[j])) {
         //   //     itemsGroups.add(items[j]);
         //   //   }
         //   // }
         //
         //  // i--;
         // }
         // else{
         //
         //
         //  }
         //     break;
       }
       //  break;
     }

    // for(Groups group in groups) {
    //   for(HomeItems homeItems in items){
    //     if(groups[i].name == homeItems.groups){
    //       if(!(itemsNew.contains(homeItems.name)) && i==0 ){
    //         itemsNew.add(homeItems);
    //       }else  if(i==1 ){
    //         if(!(itemsNew.contains(homeItems.name)) && i==1 ) {
    //           if(itemsNew.contains(homeItems.name)){
    //             // itemsNew.remove(value);
    //
    //           }else{
    //             itemsNew.add(homeItems);
    //           }
    //
    //         }
    //       }
    //       else if(i>0){
    //        // itemsNew.clear();
    //
    //         if(groups[i].name == homeItems.groups){
    //           if(!(itemsNew.contains(homeItems))){
    //             itemsNew.add(homeItems);
    //           }
    //
    //         }
    //
    //       }
    //
    //     }
    //
    //   }
    //
    //   break;
    //   // return getHorizontalItemSliders(itemsFinal);
    // }

    // return getHorizontalItemSliders(itemsFinal);
    return itemsGroups;

  }

 List<HomeItems> checkGroupWidget111(List<HomeItems> items, List<Groups> groups,BuildContext context, int i) {

  //  List<HomeItems> itemsFinal=[];

    for(Groups group in groups) {
      for(HomeItems homeItems in items){
        if(groups[i].name == homeItems.groups){
          if(!(itemsNew.contains(homeItems.name)) && i==0 ){
             itemsNew.add(homeItems);
          }else  if(i==1 ){
            if(!(itemsNew.contains(homeItems.name)) && i==1 ) {
              if(itemsNew.contains(homeItems.name)){
                  // itemsNew.remove(value);

              }else{
                itemsNew.add(homeItems);
              }

            }
          }
          // else if(i>0){
          //  // itemsNew.clear();
          //
          //   if(groups[i].name == homeItems.groups){
          //     if(!(itemsNew.contains(homeItems))){
          //       itemsNew.add(homeItems);
          //     }
          //
          //   }
          //
          // }

        }

      }

         break;
      // return getHorizontalItemSliders(itemsFinal);
    }

    // return getHorizontalItemSliders(itemsFinal);
    return itemsNew;

  }



  Widget buildTitele(List<String> groups) {

    // var stringList = ["a", "b", "c"];
    var stringList = groups;

    // Create a List<Text> (or List<MyWidget>) using each String from stringList
    // var textList = stringList.map<Text>((s) => Text(s.name)).toList();
    var textList = stringList.map<Text>((s) => Text("s.name")).toList();

    // use that list however you want!
    return Column(children: textList);

  }

  // buildList(List<HomeItems> items, List<Groups> groups,int y) {
  //
  //  Container widgetList = getHorizontalItemSlidersList(items, context, y);
  //
  //   // Create a List<Text> (or List<MyWidget>) using each String from stringList
  //  //  var textList = widgetList.map<Widget>((s) => Widget(s.name)).toList();
  //
  //   // use that list however you want!
  //   return Container(child: widgetList);
  //
  //
  // }




  //  Future<List<HomeItems>> getListData()  async {
  //   ///  List<HomeItems> itemsData = [];
  //
  //   Future<List<HomeItems>>  itemsProvider = HomeProvider().getData();
  //
  //   items =await itemsProvider;
  //
  //   // items = HomeProvider().items;
  //
  //
  //
  //   return items;
  // }
}



//
// import 'dart:convert';
//
// import 'package:ecobioweb/roots/trunk/branches/groups/components/groups.dart';
// import 'package:ecobioweb/roots/trunk/branches/groups/provider/groups_provider.dart';
// import 'package:ecobioweb/roots/trunk/branches/menu/menu_home/provider/home_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
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
// import '../../../localisation/translation/components/appLocalizations.dart';
// import '../../../search/widgets/search_bar_widget.dart';
// import '../components/home_items.dart';
// import '../widgets/grocery_featured_Item_widget.dart';
// import '../widgets/home_banner_widget.dart';
// import '../widgets/home_item_card_widget.dart';
//
//
// TextEditingController textInputSearch =  TextEditingController();
//
// class HomeScreen extends StatelessWidget {
//
// //  class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //
// //
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
//   HomeItems? item;
//
//   List<HomeItems> items = [];
//
//   //List<Groups> groups=[];
//
//   List<MapEntry<String, HomeItems>> itemsMap=[];
//
//   List<HomeItems> agricultureBiologique = [];
//
//   List<HomeItems> beekeepingBiologique = [];
//
//   List<HomeItems> homeItemsList = [];
//
//   Map<String, HomeItems> homeItems = {};
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MultiProvider(
//       providers:  [
//
//         ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
//         //  ChangeNotifierProvider<GroupsProvider>(create: (context) => GroupsProvider()),
//         // ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
//
//
//
//         // Provider<HomeProvider>(create: (context) => HomeProvider()),
//         // // Provider<CartProvider>(create: (context) => CartProvider()),
//         // Provider<GroupsProvider>(create: (context) => GroupsProvider()),
//
//
//         // ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
//         // ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
//         //  ChangeNotifierProvider<GroupsProvider>(create: (_) => GroupsProvider()),
//
//
//
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home:  HomeScreen(),
//         // child: Navigator(onGenerateRoute: (RouteSettings setting) {
//         //   return MaterialPageRoute(builder: (context) {
//         //     return HomeScreen();
//         //   });
//         // },
//       ),
//       builder: (context, child) {
//
//         final homeProvider = Provider.of<HomeProvider>(context);
//         // final groupsProviderDeclare = Provider.of<GroupsProvider>(context);
//
//         final loadListItem=context.read<HomeProvider>().getData();
//         //  final loadGroups=context.read<GroupsProvider>().getData();
//
//         items = context.read<HomeProvider>().items;
//
//         homeItems = context.read<HomeProvider>().homeItems;
//
//         //   groups = context.read<GroupsProvider>().groups;
//
//         // groups =  GroupsProvider().groups;
//
//         ///  List<HomeItems> itemsList = List<HomeItems>.from(homeItems.map((item) => HomeItems.fromJsonFactory(item)));
//
//         ///  List<HomeItems> groupsHome=[];
//         List<HomeItems> groupsAgricultureBiologique=[];
//         List<HomeItems> groupsBeekeepingBiologique=[];
//         List<HomeItems> groupsGreenBuilding=[];
//
//         if(items.isNotEmpty) {
//           for (int i = 0; i <= items.length; i++) {
//             for (HomeItems item in items) {
//               if (item.groups == "agricultureBiologique") {
//                 groupsAgricultureBiologique.add(item);
//               }
//
//               if (item.groups == "beekeepingBiologique") {
//                 groupsBeekeepingBiologique.add(item);
//               }
//
//               if (item.groups == "greenBuilding") {
//                 groupsGreenBuilding.add(item);
//               }
//             }
//           }
//         }
//         ///  agricultureBiologiques = context.read<HomeProvider>() .agricultureBiologiques;
//         ///  beekeepingBiologique = context.read<HomeProvider>() .beekeepingBiologique;
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
//             child: SingleChildScrollView(
//               child: Center(
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     SvgPicture.asset("assets/icons/app_icon_color.svg"),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Padded.padded(locationWidget()),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Padded.padded(SearchBarWidget()),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Padded.padded(HomeBanner()),
//                     const SizedBox(
//                       height: 25,
//                     ),
//
//                     // Column(
//                     //   children:<Widget> [
//                     //     // generateWidgetSlider(items, groups),
//                     //   ///  for(var item in groups)
//                     //       // Text(item.name.toString())
//                     //      // generateWidgetSliderTitle(items, groups),
//                     //
//                     //       generateWidgetSlider(items, groups) ,
//                     //       // getHorizontalItemSliderHome(items, groups),
//                     //
//                     //     // Column(
//                     //     //   children: List<Widget>.generate(items.length, (index) => buildListItesHome(items, groups),
//                     //     //   ),
//                     //     // )
//                     //   ],
//                     //
//                     // ),
//                     // Column(
//                     //   children: <Widget> [
//                     //     //  for(var group in groups)
//                     //     Column(
//                     //       children: List<Widget>.generate(groups.length, (indexTitle) =>
//                     //           // Padded.padded(subTitle(AppLocalizations.translate(groups[indexTitle].name.toString()), items, groups, context)),
//                     //           Padded.padded(subTitleHome(AppLocalizations.translate(groups[indexTitle].name.toString()))),
//                     //       ),
//                     //
//                     //
//                     //     ),
//                     //     Column(
//                     //       /// children: List<Widget>.generate(items.length, (index) => buildListItemsHome(items, groups,context, index)),
//                     //       ///  children: List<Widget>.generate(homeItems.values.toList().length, (index) => buildListItemsHome(homeItems.entries.toList(), groups,context, index)),
//                     //
//                     //       // children: List<Widget>.generate(homeItems.values.toList().length, (index) => ListView.separated(
//                     //       children: List<Widget>.generate(items.length, (index) => ListView.separated(
//                     //         padding: const EdgeInsets.symmetric(horizontal: 20),
//                     //         // itemCount: items.length,
//                     //         itemCount: items.length,
//                     //         // itemCount: groups.length,
//                     //         scrollDirection: Axis.horizontal,
//                     //         itemBuilder: (context, index) {
//                     //           return GestureDetector(
//                     //             onTap: () {
//                     //               onItemClickedAll(context, items[index]);
//                     //             },
//                     //             child: HomeItemsWidget(
//                     //               item: items[index],
//                     //               heroSuffix: "home_screen",
//                     //             ),
//                     //           );
//                     //         },
//                     //         // separatorBuilder: (BuildContext context, int index) {
//                     //         separatorBuilder: (context, index) {
//                     //           return const SizedBox(
//                     //             width: 20,
//                     //           );
//                     //         },
//                     //       ),),
//                     //
//                     //
//                     //     ),
//                     //
//                     //   ],
//                     //
//                     //
//                     // ),
//                     // OK Column(
//                     //   children: <Widget> [
//                     //     Column(
//                     //       children: List<Widget>.generate(items.length, (index) => buildListItesHome(items, groups),
//                     //       ),
//                     //     )],
//                     // ),
//
//                     // Column(
//                     //   children:List<Widget>.generate(length, (index) => buildListHome(itemsHome, groups),
//                     // )
//
//                     // Column(
//                     //   children:<Widget> [
//                     //     // generateWidgetSlider(items, groups),
//                     //     for(var item in groups)
//                     //     // Text(item.name.toString())
//                     //       generateWidgetSlider(items, groups),
//                     //
//                     //   ],
//                     //
//                     // ),
//
//                     // Padded.padded(subTitle(AppLocalizations.translate('agricultureBiological').toString())),
//                     getHorizontalItemSliderHome(items),
//
//
//                     //   getHorizontalItemSlider(items),
//                     // // getHorizontalItemSlider(HomeProvider().homeItems.values.toList()),
//                     // const SizedBox(
//                     //   height: 25,
//                     // ),
//                     // Padded.padded(subTitle(AppLocalizations.translate('beekeepingBiologique').toString())),
//                     // getHorizontalItemSlider(beekeepingBiologique),
//                     const Column(
//                       children: [
//                         SizedBox(
//                           height: 25,
//                         ),
//                       ],
//                     ),
//                     // Padded.padded(subTitle("hotetBiologique")),
//                     // getHorizontalItemSlider(hotetBiologique),
//                     // const SizedBox(
//                     //   height: 25,
//                     // ),
//                     // Padded.padded(subTitle("greenbuilding")),
//                     // getHorizontalItemSlider(greenbuilding),
//                     // const SizedBox(
//                     //   height: 25,
//                     // ),
//                     // Padded.padded(subTitle("hotelBiologique")),
//                     //  getHorizontalItemSlider(hotelBiologique),
//                     // const SizedBox(
//                     //   height: 15,
//                     // ),
//                     // Padded.padded(subTitle("Best Selling")),
//                     // getHorizontalItemSlider(hotetBiologique),
//                     // const SizedBox(
//                     //   height: 15,
//                     // ),
//                     Padded.padded(subTitle("Groceries",items, context)),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     SizedBox(
//                       height: 105,
//                       child: ListView(
//                         padding: EdgeInsets.zero,
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           GroceryFeaturedCard(
//                             groceryFeaturedItems[0],
//                             color: const Color(0xffF8A44C),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           GroceryFeaturedCard(
//                             groceryFeaturedItems[1],
//                             color: AppColors.primaryColor,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//
//                     ///  getHorizontalItemSlider(hotelBiologique),
//                     const SizedBox(
//                       height: 15,
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget Padded.padded(Widget widget) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       child: widget,
//     );
//   }
//
//   ///***********************************************************************************************************
//
//   List<Widget> buildListHome(List<HomeItems> itemsHome, List<String> groups){
//
//     return itemsHome.map((elements) {
//       return   Container(
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         height: 250,
//         child: ListView.separated(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           // itemCount: items.length,
//           itemCount: itemsHome.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 onItemClickedAll(context, itemsHome[index]);
//               },
//               child: HomeItemsWidget(
//                 // item: itemsHome[index],
//                 item: elements,
//                 heroSuffix: "home_screen",
//               ),
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return const SizedBox(
//               width: 20,
//             );
//           },
//         ),
//       );
//     }).toList();
//
//   }
//
//   List<Widget> buildListTitle(List<HomeItems> itemsHome, List<String> groups){
//
//     return groups.map((e) {
//       return ListTile(
//         title: Padded.padded(Text(AppLocalizations.translate(e).toString())),
//       );
//     }).toList();
//
//   }
//
//   // List<Widget> buildDrawerSection(List<HomeItems> itemsHome, List<String> groups){
//   List<Widget> buildDrawerSection(List<HomeItems> itemsHome, List<String> groups,Map<String, HomeItems> section){
//
//     List<Widget> titleWidgets=[];
//     List<Widget> groupesWidgets=[];
//
//     titleWidgets.add(getHorizontalItemSlider(items));
//     return [
//
//       // buildListTitle(section['chapter'] as List<HomeItems>),
//       // ...buildListHome(section['pages'])
//       // buildListTitle(section),
//       // buildListHome(itemsHome, groups),
//     ];
//   }
//
//   Widget generateWidgetSliderTitle(itemsHome, List<String> groups){
//
//     List<Widget> listTitleGroupHome = [];
//     for(var i=0; i<groups.length; i++){
//
//
//       listTitleGroupHome.add(Padded.padded(Text(AppLocalizations.translate(groups[i]).toString())) );
//       // for(HomeItems groupItem in itemsHome){
//       //
//       //   if(groupItem.groups.toString()== groups[i].toString()){
//       //
//       //     // listWidgetGroupHome.add(Text(groups[i]));
//       //     listTitleGroupHome.add(Padded.padded(Text(AppLocalizations.translate(groups[i]).toString())) );
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
//     return Column(children:listTitleGroupHome);
//     // OK return Column(
//     //   mainAxisAlignment: MainAxisAlignment.center,
//     //   children:<Widget>[
//     //     Row(
//     //       // OK children:listTitleGroupHome,
//     //       children: groups.map((item) => Padded.padded(Text(AppLocalizations.translate(item.toString()).toString()))).toList(),
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
//   Widget buildListItemsHome(itemsHome, List<String> groups, BuildContext context,index) {
//
//     // List<HomeItems> itemsFilter =[];
//
//     List<HomeItems> itemsFilter =[];
//     /// Map<String,dynamic> newHoeItem= HomeItems.fromJsonFactory(homeItems.entries.);
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
//     //  List<HomeItems> itemsList = List<HomeItems>.from(items.map((item) => HomeItems.fromJson(item)));
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       height: 250,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         // itemCount: items.length,
//         itemCount: itemsFilter.length,
//         // itemCount: groups.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               onItemClickedAll(context, itemsFilter[index]);
//             },
//             child: HomeItemsWidget(
//               item: itemsFilter[index],
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
//       // listTitleGroupHome.add(Padded.padded(Text(AppLocalizations.translate(groups[i]).toString())) );
//       // listWidgetGroupHome.add(getHorizontalItemSliderHome(itemsHome, groups));
//
//       for(HomeItems groupItem in itemsHome){
//
//         if(groupItem.groups.toString()== groups[i].toString()){
//
//           listWidgetGroupHome.add(getHorizontalItemSliderHome(itemsHome));
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
//           // OK children:listTitleGroupHome,
//           children: groups.map((item) => Padded.padded(Text(AppLocalizations.translate(item.toString()).toString()))).toList(),
//         ),
//         Row(
//           children: listWidgetGroupHome,
//         ),
//       ],);
//
//   }
//
//   // Widget getHorizontalItemSliderHome(itemsHome, List<Groups> groups ){
//   Widget getHorizontalItemSliderHome(itemsHome ){
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
//                 // Padded.padded(subTitle(AppLocalizations.translate('agricultureBiological').toString())),
//                 Row(
//                   children: [
//                     Padded.padded(subTitle(AppLocalizations.translate(items[index].name), items,context)),
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
//   // Widget getHorizontalItemSlider(List<homeItems> items) {
//   Widget getHorizontalItemSlider(List<HomeItems> items) {
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
//           // builder: (context) => pageScreen,
//           builder: (context) =>AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
//         ));
//   }
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
//   Widget subTitleHome(String text) {
//     // return Row(
//     return Column(
//       children: [
//         Text(
//           text,
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         // getHorizontalItemSlider(items),
//
//         const Spacer(),
//         const Text(
//           "See All",
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryColor),
//         ),
//       ],
//     );
//   }
//
//   Widget subTitle(String text, List<HomeItems> items,  BuildContext context) {
//
//     List<HomeItems> itemsGroup=[];
//
//     if(items.isNotEmpty){
//       itemsGroup=items;
//     }
//
//     // for(HomeItems item in items){
//     //   for(Groups group in groups){
//     //     if(item.name.toString()== group.name.toString()){
//     //
//     //       if(!(itemsGroup.contains(item.name)) || (!(itemsGroup.length == groups.length))){
//     //          itemsGroup.add(item);
//     //       }
//     //     }
//     //   }
//     // }
//
//
//     // return Row(
//     return Column(
//       children: [
//         Text(
//           text,
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//
//         // Column(
//         //   children: [
//         //           SizedBox(
//         //                      // margin: const EdgeInsets.symmetric(vertical: 10),
//         //                       height: 250,
//         //                       child: ListView.separated(
//         //                       padding: const EdgeInsets.symmetric(horizontal: 20),
//         //                       itemCount: itemsGroup.length,
//         //                       scrollDirection: Axis.horizontal,
//         //                   itemBuilder: (context, index) {
//         //                   return GestureDetector(
//         //                       onTap: () {
//         //                       onItemClickedAll(context, itemsGroup[index]);
//         //                       },
//         //                       child: HomeItemsWidget(
//         //                       item: itemsGroup[index],
//         //                       heroSuffix: "home_screen",
//         //                       ),
//         //                     );
//         //                   },
//         //                   separatorBuilder: (BuildContext context, int index) {
//         //                   return const SizedBox(
//         //                     width: 20,
//         //                      );
//         //                   },
//         //                   ),
//         //           ),
//         //
//         //      ],
//         //
//         // ),
//         // getHorizontalItemSlider(items),
//
//         const Spacer(),
//         const Text(
//           "See All",
//           style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryColor),
//         ),
//
//
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
// }



