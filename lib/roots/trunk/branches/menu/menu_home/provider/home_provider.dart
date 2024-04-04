

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../localisation/translation/components/appLocalizations.dart';
import '../components/home_items.dart';
import 'dart:convert';


class HomeProvider  with ChangeNotifier {

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }


  ///-----------------------------------------------------------------------------
  /// MAP HomeItems
  Map<String, HomeItems> _homeItem = {};


  Map<String, HomeItems> get homeItems {
    return {..._homeItem};
  }
  /// LIST HomeItems
  List<HomeItems> items = [];

  List<HomeItems> listItemHome=[];

  /// LIST Groups
  List<String> groupsHome=[];


  Map<String, List<HomeItems>> get mapGroupListHomeItems{
    return{..._mapGroupListHomeItems};
  }
  final Map<String, List<HomeItems>> _mapGroupListHomeItems ={};

  /// List Group items home
 // List<String> groups=[];

  List<dynamic> dataLoader = [];

  late String category;
  late String categoryToLoad = "agricultureBiological";

  bool isFlagLoaderEnabled = true;



 // // Future<List<HomeItems>> getData() async{
 // getData() async{
 //   items= await getHomeItemsList();
 //   notifyListeners();
 //  // return items;
 // }


  // Future<List<HomeItems>> getData() async{
  Future<List<HomeItems>> getData() async{
    items = await getHomeItemsList();
   notifyListeners();
     return items;

  }

  Future<List<HomeItems>> getHomeItemsList() async {

    final String response =
    await rootBundle.loadString('assets/json/home.json');
    final data = await json.decode(response);

    // if(data is Map){
    //   _mapGroupListHomeItems=data.cast<String, HomeItems>();
    // }


    /// dataLoader =data['homeItemsGroups'].map((data)=> HomeItems.fromJsonFactory(data)).toList();
    Map <String,dynamic> dataMap=data;

   /// items;
    groupsHome.clear();

    Map<String, List<dynamic>> getListItemsFromDataMap=dataMap.map((key, value) => MapEntry(key, List.castFrom(value)));

    getListItemsFromDataMap.forEach((key, value) {
       items.addAll(HomeItems.fromJsonList(value));
    });

    Map<String, String> stringQueryParameters=dataMap.map((key, value) => MapEntry(key, value!.toString()));

    stringQueryParameters.forEach((key, value) {

      String group =key;
      setGroupAdmin(group);

      for(HomeItems homeItems in items){
        if(homeItems.groups == group.toString()){
          if(!listItemHome.contains(homeItems)){
            listItemHome.add(homeItems);
          }
        }
      }
      updateMap(key,listItemHome,items);

    });
  ///  notifyListeners();
    return items;

  }


  void setGroupAdmin(String group) {
    groupsHome.add(group);
  }

  void updateMap(String key, List<HomeItems> listItemHome, List<HomeItems> items) {

    if (!_mapGroupListHomeItems.containsKey(key)) {

      listItemHome.clear();
      for (HomeItems element in items) {
        if (element.groups==key ) {
          listItemHome.add(element);
        }
      }
      _mapGroupListHomeItems.putIfAbsent(key, () => listItemHome.toList());
    }
  }

  static List<HomeItems> agricultureBiologiqueItems = [
    HomeItems(
      id: "1",
      name: AppLocalizations.translate('agricultureBiological'),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('agricultureBiological') ,
      category: AppLocalizations.translate('fruitsVegetable'),
      groups: "homeSceen",
      imagePath: "assets/images/agriculture/agriculture_6.png",
    ),
    // imagePath: "assets/images/grocery_images/banana.png"),
    HomeItems(
      id:"2" ,
      name: AppLocalizations.translate('agricultureBiodynamic'),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('agricultureBiodynamic') ,
      category: AppLocalizations.translate('fruitsVegetable'),
      groups: "homeSceen",
      imagePath: "assets/images/agriculture/agriculture_1.png",
      // imagePath: "assets/images/grocery_images/apple.png"
    ),
    HomeItems(
      id: "3",
      name: AppLocalizations.translate('agricultureIntegration'),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('agricultureIntegration') ,
      category: AppLocalizations.translate('fruitsVegetable'),
      groups: "homeSceen" ,
      imagePath: "assets/images/agriculture/agriculture_2.png",
      //  imagePath: "assets/images/grocery_images/pepper.png"
    ),
    HomeItems(
      id: "4",
      name: AppLocalizations.translate('agricultureKmZero'),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('agricultureKmZero') ,
      category: AppLocalizations.translate('fruitsVegetable'),
      groups: "homeSceen",
      imagePath: "assets/images/agriculture/agriculture_3.png",
      //  imagePath: "assets/images/grocery_images/ginger.png"
    ),
    HomeItems(
      id: "5",
      name: AppLocalizations.translate('productsBiologiques'),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('productsBiologiques') ,
      category: AppLocalizations.translate('productsBiologiques'),
      groups: "homeSceen",
      imagePath: "assets/images/agriculture/agriculture_4.png",
      //  imagePath: "assets/images/grocery_images/beef.png"
    ),

  ];




  List<HomeItems> get favoriteItemsProduct {
    return items.where((element) => element.isFavorite!).toList();
  }

  HomeItems findById(String id) {
    return items.firstWhere((element) => element.id.toString() == id);
  }


  void addItemHome(HomeItems homeItems) {
    if (_homeItem.containsKey(homeItems.name)) {
            incrementItemHome(homeItems);
    } else {
      _homeItem.putIfAbsent(
          homeItems.name, () =>
          HomeItems(
            id: homeItems.id,
            name :homeItems.name,
            description :homeItems.description,
            category :homeItems.category,
            groups :homeItems.groups,
            imagePath :homeItems.imagePath,
            isShowMarket :homeItems.isShowMarket == null ? false : homeItems.isShowMarket ?? false,
            isShowCategory :homeItems.isShowCategory== null ? false : homeItems.isShowCategory ?? false,
            isVisibility :homeItems.isVisibility == null? false :homeItems.isVisibility?? false,
            isEnabled :homeItems.isEnabled ==null ? false : homeItems.isEnabled ?? false,
            isIva :homeItems.isIva ==null ?false :homeItems.isIva ?? false,
            isFavorite :homeItems.isFavorite == null? false :homeItems.isFavorite?? false,
            isRecently :homeItems.isRecently == null ? false :homeItems.isRecently??false,
            datePublication: DateTime.now().toString(),
            dateUpdate: DateTime.now().toString(),
          ));
    }

  }


  void removeProductItem(String c) {
    try {
      _homeItem.removeWhere((key, homeItems) =>
      homeItems.id.toString() == homeItems.id);
    } catch (error) {
      throw "Could not delete HomeItems";
    }

    ///notifyListeners();
  }


  void incrementItemHome(HomeItems homeItems) {
    if (_homeItem.containsKey(homeItems.id)) {
      _homeItem.update(
          homeItems.name,
              (existingHomeItem) =>
              HomeItems(
                  id: existingHomeItem.id,
                  name :existingHomeItem.name,
                  description :existingHomeItem.description,
                  category :existingHomeItem.category,
                  groups :existingHomeItem.groups,
                  imagePath :existingHomeItem.imagePath,
                  isShowMarket :existingHomeItem.isShowMarket == null ? false : existingHomeItem.isShowMarket ?? false,
                  isShowCategory :existingHomeItem.isShowCategory== null ? false : existingHomeItem.isShowCategory ?? false,
                  isVisibility :existingHomeItem.isVisibility == null? false :existingHomeItem.isVisibility?? false,
                  isEnabled :existingHomeItem.isEnabled ==null ? false : existingHomeItem.isEnabled ?? false,
                  isIva :existingHomeItem.isIva ==null ?false :existingHomeItem.isIva ?? false,
                  isFavorite :existingHomeItem.isFavorite == null? false :existingHomeItem.isFavorite?? false,
                  isRecently :existingHomeItem.isRecently == null ? false :existingHomeItem.isRecently??false,
                  datePublication: existingHomeItem.datePublication,
                  dateUpdate:existingHomeItem.dateUpdate,
              ));
    }
  }


  void decrementItemHome(HomeItems homeItems, int index) {
    if (_homeItem.containsKey(homeItems.id)) {
      _homeItem.update(
          homeItems.name,
              (existingHomeItem) =>
                  HomeItems(
                    id: existingHomeItem.id,
                    name :existingHomeItem.name,
                    description :existingHomeItem.description,
                    category :existingHomeItem.category,
                    groups :existingHomeItem.groups,
                    imagePath :existingHomeItem.imagePath,
                    isShowMarket :existingHomeItem.isShowMarket == null ? false : existingHomeItem.isShowMarket ?? false,
                    isShowCategory :existingHomeItem.isShowCategory== null ? false : existingHomeItem.isShowCategory ?? false,
                    isVisibility :existingHomeItem.isVisibility == null? false :existingHomeItem.isVisibility?? false,
                    isEnabled :existingHomeItem.isEnabled ==null ? false : existingHomeItem.isEnabled ?? false,
                    isIva :existingHomeItem.isIva ==null ?false :existingHomeItem.isIva ?? false,
                    isFavorite :existingHomeItem.isFavorite == null? false :existingHomeItem.isFavorite?? false,
                    isRecently :existingHomeItem.isRecently == null ? false :existingHomeItem.isRecently??false,
                    datePublication: existingHomeItem.datePublication,
                    dateUpdate:existingHomeItem.dateUpdate,
                  ));
    }

  }

  void cleanProducts() {
    _homeItem = {};
  }


  Future<void> editItemProduct(String id, HomeItems editProduct) async {
    final itemHomeIndex = items.indexWhere((element) =>
    element.id.toString() == id);

    try {
      HomeItems homeItems = HomeItems(
        id: editProduct.id,
        name :editProduct.name,
        description :editProduct.description,
        category :editProduct.category,
        groups :editProduct.groups,
        imagePath :editProduct.imagePath,
        isShowMarket :editProduct.isShowMarket == null ? false : editProduct.isShowMarket ?? false,
        isShowCategory :editProduct.isShowCategory== null ? false : editProduct.isShowCategory ?? false,
        isVisibility :editProduct.isVisibility == null? false :editProduct.isVisibility?? false,
        isEnabled :editProduct.isEnabled ==null ? false : editProduct.isEnabled ?? false,
        isIva :editProduct.isIva ==null ?false :editProduct.isIva ?? false,
        isFavorite :editProduct.isFavorite == null? false :editProduct.isFavorite?? false,
        isRecently :editProduct.isRecently == null ? false :editProduct.isRecently??false,
        datePublication: editProduct.datePublication,
        dateUpdate: DateTime.now().toString(),

      );

      items[itemHomeIndex] = editProduct;
      // notifyListeners();


    } catch (error) {
      rethrow;
    }
  }

  /// convert list<dynamic> to list Object
  List<HomeItems> getListHomeItem(List<dynamic> data) {
    for (var element in data) {
      items.add(HomeItems.fromJson(element));
    }

    return items ?? List<HomeItems>.empty();
  }


  // List<HomeItems> getListHomeItem(List<dynamic> dataLoader) {
  //   dataLoader.forEach((element) {
  //        items.add(HomeItems.fromJson(element));
  //   });
  //
  //   return items ?? List<HomeItems>.empty();
  // }






}

