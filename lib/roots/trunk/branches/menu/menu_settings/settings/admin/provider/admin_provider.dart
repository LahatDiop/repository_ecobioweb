



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'dart:convert';

import '../../../../../groups/components/groups.dart';
import '../../../../../localisation/translation/components/appLocalizations.dart';
import '../components/admin_items.dart';


class AdminProvider  with ChangeNotifier {

  ///-----------------------------------------------------------------------------
  /// MAP AdminItems
  Map<String, AdminItems> _adminItems = {};


  Map<String, AdminItems> get adminItems {
    return {..._adminItems};
  }
  /// LIST AdminItems
  List<AdminItems> items = [];

  List<AdminItems> itemsFinal = [];


  /// MAP Groups
  final Map<String, Groups> _groupsItems = {};

  Map<String, Groups> get groupsItems {
    return {..._groupsItems};
  }

  Map<String,List<AdminItems>> get mapGroupListItems {
    return {..._mapGroupListItems};
  }

  final Map<String,List<AdminItems>> _mapGroupListItems={};


  List<AdminItems> listItemAdmin=[];
  /// LIST Groups
  List<String> groupsAdmin=[];

  List<dynamic> dataList = [];

  List<dynamic> dataLoader = [];
  List<dynamic> dataLoaderAdmin = [];

  late String category;
  late String categoryToLoad = "agricultureBiological";

  bool isFlagLoaderEnabled = true;

  Map<String, Object> preferences = <String, Object>{};
  Map<String, AdminItems> mapItems = <String, AdminItems>{};

  Future<List<AdminItems>> getData() async{
    items = await getAdminItemsList();
    notifyListeners();
    return items;
  }

  Future<List<AdminItems>> getAdminItemsList() async {

    final String response = await rootBundle.loadString('assets/json/admin.json');
    final data = await json.decode(response);

    if(data is Map){
      mapItems=data.cast<String, AdminItems>();
    }

    Map <String,dynamic> dataMap=data;

    //  items.clear();
    items;
    groupsAdmin.clear();
    /// ///ok  Add List<AdminItems> from dataMap
    Map<String, List<dynamic>> getListItemsFromDataMap = dataMap.map( (key, value) => MapEntry(key, List.castFrom(value)));

    getListItemsFromDataMap.forEach((key, value) {
      items.addAll(AdminItems.fromJsonList(value));
      itemsFinal.addAll(AdminItems.fromJsonList(value));

    });

    Map<String, String> stringQueryParameters =dataMap.map((key, value) => MapEntry(key, value!.toString()));

    stringQueryParameters.forEach((key, value) {

      Map<String,dynamic> json= AdminItems.jsonStringToMap(value);

      /// Implement group from array json
      String group = key;
      setGroupAdmin(group);

      items; /// List all Items[]
      groupsAdmin; /// List groups fromJson String

      for(AdminItems  adminItems in items ){
        if(adminItems.groups== group.toString()){
          if (!listItemAdmin.contains(adminItems)) {
            listItemAdmin.add(adminItems);
          }
        }

      }
      /// ADD THE LIST GROUP TO THE MAP
      updateMap(key,listItemAdmin, items);

    });

    notifyListeners();
    return items;
  }

  void updateMap(String key, List<AdminItems> listItemAdmin, List<AdminItems> items) {

    if (!_mapGroupListItems.containsKey(key)) {

      listItemAdmin.clear();
      for (AdminItems element in items) {
        if (element.groups==key ) {
          listItemAdmin.add(element);
          /// addMapGroupListItems(key,listItemAdmin);
        }
      }
      _mapGroupListItems.putIfAbsent(key, () => listItemAdmin.toList());
      /// addMapGroupListItems(key,listItemAdmin);
    }
  }

  List<AdminItems> getListAdminFromDynamic(data) {

    List<AdminItems> value = <AdminItems>[];
    data.forEach((element) {
      value.add(AdminItems.fromJsonMap(element));
      // items.add(AdminItems.fromJsonMap(element));
    });
    return value ?? List<AdminItems>.empty();

  }





  static List<AdminItems> agricultureBiologiqueItems = [
    AdminItems(
      id: "1",
      name: AppLocalizations.translate('agricultureBiological').toString(),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('agricultureBiological').toString() ,
      category: AppLocalizations.translate('fruitsVegetable').toString(),
      groups: "homeSceen",
      imagePath: "assets/images/agriculture/agriculture_6.png",
    ),
    // imagePath: "assets/images/grocery_images/banana.png"),
    AdminItems(
      id:"2" ,
      name: AppLocalizations.translate('agricultureBiodynamic').toString(),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('agricultureBiodynamic').toString() ,
      category: AppLocalizations.translate('fruitsVegetable').toString(),
      groups: "homeSceen",
      imagePath: "assets/images/agriculture/agriculture_1.png",
      // imagePath: "assets/images/grocery_images/apple.png"
    ),
    AdminItems(
      id: "3",
      name: AppLocalizations.translate('agricultureIntegration').toString(),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('agricultureIntegration').toString() ,
      category: AppLocalizations.translate('fruitsVegetable').toString(),
      groups: "homeSceen" ,
      imagePath: "assets/images/agriculture/agriculture_2.png",
      //  imagePath: "assets/images/grocery_images/pepper.png"
    ),
    AdminItems(
      id: "4",
      name: AppLocalizations.translate('agricultureKmZero').toString(),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('agricultureKmZero').toString() ,
      category: AppLocalizations.translate('fruitsVegetable').toString(),
      groups: "homeSceen",
      imagePath: "assets/images/agriculture/agriculture_3.png",
      //  imagePath: "assets/images/grocery_images/ginger.png"
    ),
    AdminItems(
      id: "5",
      name: AppLocalizations.translate('productsBiologiques').toString(),
      description: "Bio per tutti",
      subTitle:AppLocalizations.translate('productsBiologiques').toString() ,
      category: AppLocalizations.translate('productsBiologiques').toString(),
      groups: "homeSceen",
      imagePath: "assets/images/agriculture/agriculture_4.png",
      //  imagePath: "assets/images/grocery_images/beef.png"
    ),

  ];




  List<AdminItems> get favoriteItemsProduct {
    return items.where((element) => element.isFavorite!).toList();
  }

  AdminItems findById(String id) {
    return items.firstWhere((element) => element.id.toString() == id);
  }

  void addMapGroupListItems(String  group ,List<AdminItems> items) {
    if (_mapGroupListItems.containsKey(group)) {
      updateItemHome(group,items);
    } else {
      _mapGroupListItems.putIfAbsent(
          group, () =>
          items.toList()
        // AdminItems(
        //   id: adminItems.id,
        //   name :adminItems.name,
        //   description :adminItems.description,
        //   category :adminItems.category,
        //   groups :adminItems.groups,
        //   imagePath :adminItems.imagePath,
        //   isShowMarket :adminItems.isShowMarket == null ? false : adminItems.isShowMarket ?? false,
        //   isShowCategory :adminItems.isShowCategory== null ? false : adminItems.isShowCategory ?? false,
        //   isVisibility :adminItems.isVisibility == null? false :adminItems.isVisibility?? false,
        //   isEnabled :adminItems.isEnabled ==null ? false : adminItems.isEnabled ?? false,
        //   isIva :adminItems.isIva ==null ?false :adminItems.isIva ?? false,
        //   isFavorite :adminItems.isFavorite == null? false :adminItems.isFavorite?? false,
        //   isRecently :adminItems.isRecently == null ? false :adminItems.isRecently??false,
        //   datePublication: DateTime.now().toString(),
        //   dateUpdate: DateTime.now().toString(),
        // )
      );
    }
    notifyListeners();
  }


  void updateItemHome(String  group ,List<AdminItems> items) {
    if (_mapGroupListItems.containsKey(group)) {
      _mapGroupListItems.update(
          group,
              (existingHomeItem) =>
              items.toList()
        // AdminItems(
        //   id: existingHomeItem.id,
        //   name :existingHomeItem.name,
        //   description :existingHomeItem.description,
        //   category :existingHomeItem.category,
        //   groups :existingHomeItem.groups,
        //   imagePath :existingHomeItem.imagePath,
        //   isShowMarket :existingHomeItem.isShowMarket == null ? false : existingHomeItem.isShowMarket ?? false,
        //   isShowCategory :existingHomeItem.isShowCategory== null ? false : existingHomeItem.isShowCategory ?? false,
        //   isVisibility :existingHomeItem.isVisibility == null? false :existingHomeItem.isVisibility?? false,
        //   isEnabled :existingHomeItem.isEnabled ==null ? false : existingHomeItem.isEnabled ?? false,
        //   isIva :existingHomeItem.isIva ==null ?false :existingHomeItem.isIva ?? false,
        //   isFavorite :existingHomeItem.isFavorite == null? false :existingHomeItem.isFavorite?? false,
        //   isRecently :existingHomeItem.isRecently == null ? false :existingHomeItem.isRecently??false,
        //   datePublication: existingHomeItem.datePublication,
        //   dateUpdate:existingHomeItem.dateUpdate,
        // )
      );
    }
    notifyListeners();
  }

  void addItemAdmin(AdminItems adminItems) {
    if (_adminItems.containsKey(adminItems.id)) {
      // incrementItemHome(adminItems);
    } else {
      _adminItems.putIfAbsent(
          adminItems.id, () =>
          AdminItems(
            id: adminItems.id,
            name :adminItems.name,
            description :adminItems.description,
            category :adminItems.category,
            groups :adminItems.groups,
            imagePath :adminItems.imagePath,
            isShowMarket :adminItems.isShowMarket == null ? false : adminItems.isShowMarket ?? false,
            isShowCategory :adminItems.isShowCategory== null ? false : adminItems.isShowCategory ?? false,
            isVisibility :adminItems.isVisibility == null? false :adminItems.isVisibility?? false,
            isEnabled :adminItems.isEnabled ==null ? false : adminItems.isEnabled ?? false,
            isIva :adminItems.isIva ==null ?false :adminItems.isIva ?? false,
            isFavorite :adminItems.isFavorite == null? false :adminItems.isFavorite?? false,
            isRecently :adminItems.isRecently == null ? false :adminItems.isRecently??false,
            datePublication: DateTime.now().toString(),
            dateUpdate: DateTime.now().toString(),
          ));
    }
    notifyListeners();
  }


  void removeProductItem(String c) {
    try {
      _adminItems.removeWhere((key, adminItems) =>
      adminItems.id.toString() == adminItems.id);
      notifyListeners();
    } catch (error) {
      throw "Could not delete AdminItems";
    }

    ///notifyListeners();
  }


  void incrementItemHome(AdminItems adminItems) {
    if (_adminItems.containsKey(adminItems.name)) {
      _adminItems.update(
          adminItems.name,
              (existingHomeItem) =>
              AdminItems(
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
    notifyListeners();
  }


  void decrementItemHome(AdminItems adminItems, int index) {
    if (_adminItems.containsKey(adminItems.id)) {
      _adminItems.update(
          adminItems.name,
              (existingHomeItem) =>
              AdminItems(
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

    notifyListeners();
  }

  void cleanProducts() {
    notifyListeners();
    _adminItems = {};
  }


  Future<void> editItemProduct(String id, AdminItems editProduct) async {
    final itemHomeIndex = items.indexWhere((element) =>
    element.id.toString() == id);

    try {
      AdminItems adminItems = AdminItems(
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

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  /// convert list<dynamic> to list Object
  List<AdminItems> getListHomeItem(List<dynamic> data) {
    for (var element in data) {
      items.add(AdminItems.fromJson(element));
    }

    return items ?? List<AdminItems>.empty();
  }

  void addItemGroupe(Groups group) {
    if (_groupsItems.containsKey(group.name)) {
      incrementItemgGroup(group);
    } else {
      _groupsItems.putIfAbsent(
          group.name, () =>
          Groups(
            id: group.id,
            name: group.name,
            code: group.code,
            description: group.description,
            imagePath: group.imagePath,
            pageScreenPath: group.pageScreenPath,
            isShowGroups: group.isShowGroups == null ? false : group
                .isShowGroups ?? false,
            isShowMarket: group.isShowMarket == null ? false : group
                .isShowMarket ?? false,
            isShowCategory: group.isShowCategory == null ? false : group
                .isShowCategory ?? false,
            isVisibility: group.isVisibility == null ? false : group
                .isVisibility ?? false,
            isEnabled: group.isEnabled == null ? false : group
                .isEnabled ?? false,
            isIva: group.isIva == null ? false : group.isIva ?? false,
            isFavorite: group.isFavorite == null ? false : group
                .isFavorite ?? false,
            isRecently: group.isRecently == null ? false : group
                .isRecently ?? false,
            datePublication: DateTime.now().toString(),
            dateUpdate: DateTime.now().toString(),
          ));
    }
  }



  void incrementItemgGroup(Groups group) {
    if (_groupsItems.containsKey(group.id)) {
      _groupsItems.update(
          group.name,
              (existingGroupItem) =>
              Groups(
                id: existingGroupItem.id,
                name: existingGroupItem.name,
                code: existingGroupItem.code,
                description: existingGroupItem.description,
                seachArea: existingGroupItem.seachArea,
                imagePath: existingGroupItem.imagePath,
                pageScreenPath: existingGroupItem.pageScreenPath,
                isShowGroups: existingGroupItem.isShowGroups == null
                    ? false
                    : existingGroupItem.isShowGroups ?? false,
                isShowMarket: existingGroupItem.isShowMarket == null
                    ? false
                    : existingGroupItem.isShowMarket ?? false,
                isShowCategory: existingGroupItem.isShowCategory == null
                    ? false
                    : existingGroupItem.isShowCategory ?? false,
                isVisibility: existingGroupItem.isVisibility == null
                    ? false
                    : existingGroupItem.isVisibility ?? false,
                isEnabled: existingGroupItem.isEnabled == null
                    ? false
                    : existingGroupItem.isEnabled ?? false,
                isIva: existingGroupItem.isIva == null ? false : existingGroupItem
                    .isIva ?? false,
                isFavorite: existingGroupItem.isFavorite == null
                    ? false
                    : existingGroupItem.isFavorite ?? false,
                isRecently: existingGroupItem.isRecently == null
                    ? false
                    : existingGroupItem.isRecently ?? false,
                datePublication: existingGroupItem.datePublication,
                dateUpdate: existingGroupItem.dateUpdate,
              ));
    }
  }


  void decrementItemGroup(Groups group, int index) {
    if (_groupsItems.containsKey(group.id)) {
      _groupsItems.update(
          group.name,
              (existingGroupItem) =>
              Groups(
                id: existingGroupItem.id,
                name: existingGroupItem.name,
                code: existingGroupItem.code,
                description: existingGroupItem.description,
                seachArea: existingGroupItem.seachArea,
                imagePath: existingGroupItem.imagePath,
                pageScreenPath: existingGroupItem.pageScreenPath,
                isShowMarket: existingGroupItem.isShowMarket == null
                    ? false
                    : existingGroupItem.isShowMarket ?? false,
                isShowCategory: existingGroupItem.isShowCategory == null
                    ? false
                    : existingGroupItem.isShowCategory ?? false,
                isVisibility: existingGroupItem.isVisibility == null
                    ? false
                    : existingGroupItem.isVisibility ?? false,
                isEnabled: existingGroupItem.isEnabled == null
                    ? false
                    : existingGroupItem.isEnabled ?? false,
                isIva: existingGroupItem.isIva == null ? false : existingGroupItem
                    .isIva ?? false,
                isFavorite: existingGroupItem.isFavorite == null
                    ? false
                    : existingGroupItem.isFavorite ?? false,
                isRecently: existingGroupItem.isRecently == null
                    ? false
                    : existingGroupItem.isRecently ?? false,
                datePublication: existingGroupItem.datePublication,
                dateUpdate: existingGroupItem.dateUpdate,
              ));
    }
  }

  void setGroupAdmin(String group) {
    groupsAdmin.add(group);
  }

  List<String> getDataGroup(){
    return groupsAdmin;
  }



//   jsonStringToMap(String data){
//   List<String> str = data.replaceAll("{","").replaceAll("}","").replaceAll("\"","").replaceAll("'","").split(",");
//   Map<String,dynamic> result = {};
//   for(int i=0;i<str.length;i++){
//     List<String> s = str[i].split(":");
//     result.putIfAbsent(s[0].trim(), () => s[1].trim());
//   }
//   return result;
// }




// List<AdminItems> getListHomeItem(List<dynamic> dataLoader) {
//   dataLoader.forEach((element) {
//        items.add(AdminItems.fromJson(element));
//   });
//
//   return items ?? List<AdminItems>.empty();
// }






}

