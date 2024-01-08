import 'package:ecobioweb/roots/trunk/branches/commun_data_utils/utils/columns/column_with_seprator.dart';
import 'package:ecobioweb/roots/trunk/branches/menu/menu_settings/settings/admin/provider/admin_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../category/components/gestion_agriculture_bio.dart';
import '../../../../../../../../category/detailCategory/agriculture_integration.dart';
import '../../../../../../../../category/detailCategory/agriculture_km_zero.dart';
import '../../../../../../../../category/detailCategory/info_producers.dart';
import '../../../../../../../../category/detailCategory/products_biologique.dart';
import '../../../../../business/agricultures/agriculture_biodynamica/screens/agriculture_biodynamica_screen.dart';
import '../../../../../business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
import '../../../../../cart/provider/cart_provider.dart';
import '../../../../../commun_data_utils/utils/theme/app_theme.dart';
import '../../../../../localisation/translation/components/appLocalizations.dart';
import '../../../../../search/widgets/search_bar_widget.dart';
import '../../../../menu_home/widgets/grocery_featured_Item_widget.dart';
import '../../../../menu_home/widgets/home_banner_widget.dart';
import '../components/admin_items.dart';
import '../widgets/admin_item_card_widget.dart';
import 'setting_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _ProfileAdminState createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<AdminScreen>  with TickerProviderStateMixin {

  // Map<String,List<AdminItems>> mapGroupListItems={};
  Map<String,List<AdminItems>> mapGroupListItems={};

  // Map<String, Groups>  groupsItems={};

  Map<String, AdminItems> adminItems = {};

  /// LIST AdminItems
  // List<AdminItems> itemsAdmin = [];
  List<AdminItems> items =[];
  // List<AdminItems> itemsNew =[];

  /// List Group items home
  List<String> groups=[];

  final List<bool> _values = [true, false, true, false, false];

  TextEditingController textInputSearch =  TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

 //   fetchItems().whenComplete(() => setState(() {}));
  }

 // fetchItems() async {}

  @override
  Widget build(BuildContext context) {


    return MultiProvider(providers:  [
      ChangeNotifierProvider<AdminProvider>(create: (_)=>AdminProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ],
      child: Navigator(onGenerateRoute: (RouteSettings settings){

        return MaterialPageRoute(builder: (context){
          return AgricultureBiodynamicaScreen();
        });
      },),

      builder: (context,child) {
        int tabIndex = 0;
        final adminProvider = Provider.of<AdminProvider>(context);
        var listItemsAdmin = context.read<AdminProvider>().getData();


        mapGroupListItems = context.read<AdminProvider>().mapGroupListItems;
        adminItems = context.read<AdminProvider>().adminItems;
        items = context.read<AdminProvider>().items;
        groups = context.read<AdminProvider>().groupsAdmin;


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
                      padded(locationWidget()),
                      const SizedBox(
                        height: 15,
                      ),
                     /// padded(SearchBarWidget()),
                      const SizedBox(
                        height: 25,
                      ),
                      padded(HomeBanner()),
                      const SizedBox(
                        height: 25,
                      ),
                      padded(subTitle("Exclusive Order")),
                      //  getHorizontalItemSlider(exclusiveOffers),
                      const SizedBox(
                        height: 15,
                      ),
                      padded(subTitle("Best Selling")),
                      //     getHorizontalItemSlider(greenbuilding),
                      const SizedBox(
                        height: 15,
                      ),
                      padded(subTitle("Groceries")),
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

                      Column(
                        children: getChildrenWithSeperator(
                          addToLastChild: false,
                          ///  widgets: cartItems.map((e) {
                          //  widgets: cartList.map((e) {
                          //  widgets: _cartItemsMap.values.toString().map((e) {
                          // widgets: adminItems.entries.map((e){
                          widgets: mapGroupListItems.entries.map((e){
                        //   var index =e.value.indexWhere((element) => e.key).
                        //     List<AdminItems> values=e.value;

                            String group =e.key;
                            List<AdminItems> list=e.value;

                              List<AdminItems> listItems=[];
                                  listItems.addAll(e.value);

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 250,
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
                                    child: AdminItemsWidget(
                                      /// horizontalItemSliderHome[1],
                                      groups: groups,
                                      item: listItems[index],
                                      heroSuffix: "admin_screen",
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

                      // OKColumn(
                      //   children: [
                      //     buildTitele(groups),
                      //
                      //   ],
                      // ),
                      //  Column(
                      //   children: [
                      //     for(int y=0 ; y<groups.length ; y++)
                      //       //buildTitele(groups, items,mapGroupListItems, context),
                      //       // padded(subTitle(mapGroupListItems.keys.toString())),
                      //        getHorizontalItemSlidersList(groups, items,mapGroupListItems, context),
                      //
                      //   ],
                      // ),





                      // Column(
                      //   children: [
                      //     for(int y=0 ; y<mapGroupListItems.length ; y++)
                      //     //buildTitele(groups, items,mapGroupListItems, context),
                      //     // padded(subTitle(mapGroupListItems.keys.toString())),
                      //       getHorizontalItemSlidersList(groups, items,mapGroupListItems, context),
                      //
                      //   ],
                      // ),

                      //okk Column(
                      //    children:<Widget> [
                      //      getHorizontalItemSlidersList(groups, items,mapGroupListItems, context),
                      //    ],
                      // ),

                      //OK Column(
                      //   children: [
                      //     for(int y=0 ; y<groups.length ; y++)
                      //       buildList(items,groups,y),
                      //   ],
                      // ),
                      // AdminItemsWidget(
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
      },
    );

  }



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



  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text(
          "See All HomeScreen",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }
  Widget padded(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  Widget buildTitele(List<String> groups, List<AdminItems> items,  Map<String,List<AdminItems>> mapGroupListItems,BuildContext context) {
   // getHorizontalItemSlidersList(groups, items,mapGroupListItems, context),
    // var stringList = ["a", "b", "c"];
    var stringList = groups;

    // Create a List<Text> (or List<MyWidget>) using each String from stringList
    // var textList = stringList.map<Text>((s) => Text(s.name)).toList();
    var textList = stringList.map<Text>((s) => Text(s)).toList();

    // use that list however you want!
    return Column(children: textList);

  }
  buildList(List<AdminItems> items, List<String> groups,int y,Map<String,List<AdminItems>> mapGroupListItems) {

    Container widgetList = getHorizontalItemSlidersList(groups,items, mapGroupListItems,context,);

    // Create a List<Text> (or List<MyWidget>) using each String from stringList
    //  var textList = widgetList.map<Widget>((s) => Widget(s.name)).toList();

    // use that list however you want!
    return Container(child: widgetList);


  }

  Container getHorizontalItemSlidersList(List<String> groups, List<AdminItems> items,  Map<String,List<AdminItems>> mapGroupListItems,BuildContext context) {



    List<AdminItems> itemsAdmin=[];
    // Map<String, List<AdminItems>> getListItemsFromDataMap = mapGroupListItems.map( (key, value) => MapEntry(key, List.castFrom(value)));
    Map<String, List<AdminItems>> getListItemsFromDataMap = mapGroupListItems.map( (key, value) => MapEntry(key, value));

    getListItemsFromDataMap.forEach((key, value) {
     // itemsAdmin.clear();
      for (var group in groups) {
        if (group==key) {
          itemsAdmin.addAll(value);
        }
        break;
      }
      // itemsAdmin.addAll(value);
      // if (kDebugMode) {
      //   print(key);
      //   print(value);
      // }
    });

    var textList = groups.map<Text>((s) => Text(s)).toList();
   //   itemsAdmin=mapGroupListItems.entries.map<AdminItems>((e) => AdminItems.fromJsonFactory(mapGroupListItems)).toList();

    // mapGroupListItems.forEach((key, value) {
    //   itemsAdmin.add(value);
    // });
   // itemsNew=  checkGroupWidget(items,groups,context, y);


    return Container(

      child: Column(
           children: [
             Column(
              children: [
                padded(subTitle(textList[0].data.toString())),
              ],
             ),
             Container(

             margin: const EdgeInsets.symmetric(vertical: 10),
              height: 250,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: itemsAdmin.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onItemClicked(context, itemsAdmin[index]);
                    },
                    child: AdminItemsWidget(
                      /// horizontalItemSliderHome[1],
                      groups: groups,
                      item: itemsAdmin[index],
                      heroSuffix: "admin_screen",
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
              ),

             )

           ],
      ),

    );


   //  return Container(
   //    margin: const EdgeInsets.symmetric(vertical: 10),
   //    height: 250,
   //    child: ListView.separated(
   //      padding: const EdgeInsets.symmetric(horizontal: 20),
   //      itemCount: itemsAdmin.length,
   //      scrollDirection: Axis.horizontal,
   //      itemBuilder: (context, index) {
   //        return GestureDetector(
   //          onTap: () {
   //            onItemClicked(context, itemsAdmin[index]);
   //          },
   //          child: AdminItemsWidget(
   //            /// horizontalItemSliderHome[1],
   //            groups: groups,
   //            item: itemsAdmin[index],
   //            heroSuffix: "admin_screen",
   //          ),
   //        );
   //      },
   //      separatorBuilder: (BuildContext context, int index) {
   //        return const SizedBox(
   //          width: 20,
   //        );
   //      },
   //    ),
   //  );
  }

  List<AdminItems> checkGroupWidget(List<AdminItems> items, List<String> groups,BuildContext context,int y) {

    List<AdminItems> itemsGroups=[];


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

      }
      //  break;
    }


    // return getHorizontalItemSliders(itemsFinal);
    return itemsGroups;

  }
  void onItemClicked(BuildContext context, AdminItems adminItems) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) =>pageScreenPath(adminItems.pageScreenPath),
    //    // builder: (context) =>AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
    // ));


    if (AppLocalizations.translate(adminItems.name) == AppLocalizations.translate('addProduct').toString()) {
      Navigator.of(context).push(MaterialPageRoute(
        /// builder: (context) => AgricultureBiologique(item: GestionAgricultureBio().product, itemCart: GestionAgricultureBio().itemCart)
        builder: (context) => AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
      ));
    }
    if (AppLocalizations.translate(adminItems.name) ==
        AppLocalizations.translate('agricultureBiodynamic')
            .toString()) {
      Navigator.of(context).push(MaterialPageRoute(
        // builder: (context) => const AgricultureBiodymamique(),
        builder: (context) => AgricultureBiodynamicaScreen(),
      ));
    }
    if (AppLocalizations.translate(adminItems.name) ==
        AppLocalizations.translate('agricultureIntegration')
            .toString()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AgricultureIntegration(),
      ));
    }
    if (AppLocalizations.translate(adminItems.name) ==
        AppLocalizations.translate('agricultureKmZero').toString()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AgricultureKmZero(),
      ));
    }
    if (AppLocalizations.translate(adminItems.name) ==
        AppLocalizations.translate('productsBiologiques').toString()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProductsBiologique(),
      ));
    } //list des producteurs agriculture biologique
    if (AppLocalizations.translate(adminItems.name) ==
        AppLocalizations.translate('infoProducts').toString()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const InfoProducers(),
      ));
    }
  }



      Widget build111(BuildContext context) {
        const int count = 4;

        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.translate("back").toString()),
            backgroundColor: const Color.fromARGB(255, 50, 172, 34),

            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                //Navigator.push(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                //  Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
            ),
          ),
          body: Column(
            children: <Widget>[
              for (int i = 0; i <= count; i++)
                ListTile(
                  title: Text(
                    'Switch ${i + 1}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                        color: i == count ? Colors.black38 : Colors.black),
                  ),
                  leading: Switch(
                    value: _values[i],
                    onChanged: i == count
                        ? null
                        : (bool value) {
                      setState(() {
                        _values[i] = value;
                      });
                    },
                  ),
                ),
            ],
          ),
        );
      }


}
