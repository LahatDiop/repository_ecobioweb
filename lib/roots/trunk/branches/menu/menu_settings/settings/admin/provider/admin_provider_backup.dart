

import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'dart:convert';

import '../../../../../groups/components/groups.dart';
import '../../../../../localisation/translation/components/appLocalizations.dart';
import '../components/admin_items.dart';


class AdminProviderBB  with ChangeNotifier {

  ///-----------------------------------------------------------------------------
  /// MAP AdminItems
  Map<String, AdminItems> _adminItems = {};


  Map<String, AdminItems> get adminItems {
    return {..._adminItems};
  }
  /// LIST AdminItems
  List<AdminItems> items = [];

  /// MAP Groups
  Map<String, Groups> _groupsItems = {};


  Map<String, Groups> get groupsItems {
    return {..._groupsItems};
  }

  /// LIST Groups
  List<Groups> groups = [];
  /// List Group items home
 // List<String> groups=[];

  List<String> groupsAdmin=[];

  List<dynamic> dataList = [];
  List<dynamic> dataAdmin = [];
  List<AdminItems> dataAdminFinal = [];

  List<dynamic> dataLoader = [];
  List<dynamic> dataLoaderAdmin = [];

  late String category;
  late String categoryToLoad = "agricultureBiological";

  bool isFlagLoaderEnabled = true;

  Map<String, Object> preferences = <String, Object>{};
  Map<String, AdminItems> mapItems = <String, AdminItems>{};

 // // Future<List<AdminItems>> getData() async{
 // getData() async{
 //   items= await getAdminItemsList();
 //   notifyListeners();
 //  // return items;
 // }


  // Future<List<AdminItems>> getData() async{
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

    /// -----------------------------------------------------------------------------------

   /// dataLoader = data['data'] .map((data) => AdminItems.fromJson(data)).toList();

    // AdminItems welcomeFromMap(String str) => AdminItems.fromJson(json.decode(str));
  ///  String welcomeToMap(AdminItems data) => json.encode(data.toMap());

    // var list = (data['data'] as List) .map((data) => AdminItems.fromJson(data)) .toList();

   ///Iterable list=data;
   //  List<AdminItems> adIs= (data['data'] as List).map((e) => AdminItems.fromJson(e)).toList();
  //  List<AdminItems> adI= List<AdminItems>.from(list.map((model) => AdminItems.fromJsonFactory(model)));

    /// -----------------------------------------------------------------------------------

    List<AdminItems> myList=[];
    Map<String, List<String>> typedMap = dataMap.map( (key, value) => MapEntry(key, List.castFrom(value)));

    Map<String, List<dynamic>> typeMapList = dataMap.map( (key, value) => MapEntry(key, List.castFrom(value)));

                   typeMapList.forEach((key, value) { 

                     ///ok  ist<AdminItems>
                  myList.addAll(AdminItems.fromJsonList(value));
                  // myList.add(AdminItems.fromJsonList(value) as AdminItems);
                });

    Map<String, String> stringQueryParameters =dataMap.map((key, value) => MapEntry(key, value!.toString()));

    stringQueryParameters.forEach((key, value) {

     // AdminItems adminItems = AdminItems(value);
      if (kDebugMode) {
      //  mapItems.putIfAbsent(key, () => adminItems);
        print(key);

     ///   *****************************************
        Map<String,dynamic> json= AdminItems.jsonStringToMap(value);
        dataAdminFinal.add(AdminItems.fromJsonFactory(json));
     /// **************************************************
        dataList.add(value);
        print(value);



      }
    });

    for(var element in dataList){

      if (kDebugMode) {
        //  mapItems.putIfAbsent(key, () => adminItems);
      //  final dataList = await json.decode(element);

            print("{1------------------------------------------}");
            print(element);

            print("{1------------------------------------------}");

            print("{2-----------------jsonEncode(element)-------------------------}");
             jsonEncode(element);

            print(element);
            print("{2------------------------------------------}");

            print("{3---------------jsonDecode(element)---------------------------}");

            dataAdmin.add(element);

            // try{
            //   var jsonobj = jsonDecode(element.toString());
            // }catch(e){
            //   print(e);
            // }

            //decode json data as list
          ///  final list = json.decode(element) as List<dynamic>;
           // final list =   List<String>.from(json[element].map((e) => e));
            //map json and initialize using DataModel
               ///  var kkk= list.map((e) => AdminItems.fromJson(e)).toList();

           /// String responseapi = element.toString().replaceAll("\n","");
           /// element.toString().replaceAll("\n","");
          //  jsonDecode(responseapi);

          //    var fff =AdminItems.fromJsonFactory(element);

            print(element);
            print("{3------------------------------------------}");
            print("{4------------------------------------------}");
           /// AdminItems hh = AdminItems.fromJsonFactory(element as Map<String, dynamic> );
            print(element);
            print("{4------------------------------------------}");

      }
    }

    for(var adminFinal in dataAdmin ){
      if (kDebugMode) {
        print(adminFinal);
        //ok Map<String,dynamic> json= AdminItems.jsonStringToMap(adminFinal.toString());
        // dataAdminFinal.add(AdminItems.fromJsonFactory(json));
      }
    }

    for(AdminItems adminI in dataAdmin ){
      if (kDebugMode) {
        print(adminI);
      }
    }

    // jsonStringToMap(String data){
    //   List<String> str = data.replaceAll("{","").replaceAll("}","").replaceAll("\"","").replaceAll("'","").split(",");
    //   Map<String,dynamic> result = {};
    //   for(int i=0;i<str.length;i++){
    //     List<String> s = str[i].split(":");
    //     result.putIfAbsent(s[0].trim(), () => s[1].trim());
    //   }
    //   return result;
    // }
   ///--------------------------------------------------------------------------------------

     // dataMap.forEach((key, value) {
     //   adminItems.putIfAbsent(key, () => value);
     // });

    List<MapEntry<String, dynamic>> listDynamic=dataMap.entries.toList();
    List<dynamic> listAdmin = dataMap.values.toList();

    // cast to List<Map<String, dynamic>
    var listMaps = List<Map<String, dynamic>>.from(dataMap.entries);

    // listAdmin.cast<AdminItems>();
    List<AdminItems> itemsTest = [];
    for(var item in listMaps){
      AdminItems adminItems= AdminItems.fromJsonFactory(item);
               itemsTest.add(adminItems);
        }

    List<dynamic> listAdmin2 =mapItems.values.toList();

    // items=List<AdminItems>.from(mapItems.entries.toList());
    //
    //   mapItems.values.forEach((element) {
    //            items.add(AdminItems.fromJsonMap(mapItems));
    // });
    //

    List<dynamic> listGroup = dataMap.keys.toList();

    // creamo una lista di group >> gestionProducts gestionUser
            for(var group in listGroup){
              groupsAdmin.add(group);
            }
          // creamo una list items admin

    //List<AdminItems> newList = getListAdminFromDynamic(data);
        // items=listAdmin.cast<AdminItems>();
        //       for(var item in listAdmin.cast<AdminItems>()){
        //         items.add(item);
        //       }
        //    mapItems.forEach((key, value) {
        //      items.add(AdminItems.fromJson(mapItems));
        //
        //    });

              /// Ciclare nella lista dei gruppi
            for(var group in groupsAdmin){

                for(var item in items){
                  if(item.groups == group.toString()){
                    _adminItems.putIfAbsent(item.groups!, () => item);
                    break;
                  }
              }
            }


     for(int i=0; i<dataMap.entries.toList().length;i++){
             // var value = dataMap.values[i].value;

              for( int j=0; j<dataMap.entries.length;j++){
                     // print(dataMap.entries[j]);
                j;
              }

       _adminItems.putIfAbsent(dataMap.entries.toString(), () => AdminItems.fromJsonFactory(data));
      // String group=dataMap[i].groups;
      //  if(dataMap.values.toString() == "gestionProducts" ){
      //    items.add(dataMap.values.toString() as AdminItems);
       // }

     }

  ///dataLoader =data['gestionProducts'].map((data)=> AdminItems.fromJsonFactory(data)).toList();

    final extractedData=jsonDecode(response) as Map<String,dynamic>;

    /// ADD ITEM HOME MAP

    // for(AdminItems adminItems in dataLoader){
    //
    //   // if(!(_adminItems.length == dataLoader.length)){
    //   if(!(_adminItems.containsKey(adminItems.name))){
    //       addItemHome(adminItems);
    //   }
    //
    //
    //   if(!(items.length ==dataLoader.length)){
    //        items.add(adminItems);
    //   }
    // }



    // return agricultureBiologique;
     return items;
    // return queryResult.map((result) => AdminItems.fromJsonMap(result)).toList();
  //
   }

  List<AdminItems> getListAdminFromDynamic(data) {

    List<AdminItems> value = <AdminItems>[];
    data.forEach((element) {
      value.add(AdminItems.fromJsonMap(element));
     // items.add(AdminItems.fromJsonMap(element));
    });
    return value ?? List<AdminItems>.empty();

  }


  Future<List<Groups>>  getDataGroup() async {
    groups=  await getGroupsItemsList();
    notifyListeners();
    return groups;
  }
  Future<List<Groups>>  getGroupsItemsList() async {
    final String response =
    await rootBundle.loadString('assets/json/groups_admin.json');
    final data = await json.decode(response);


    dataLoader = data['groups'] .map((data) => Groups.fromJson(data)).toList();

    final extractedData = jsonDecode(response) as Map<String, dynamic>;

    for(Groups group in dataLoader){
      if(!(groups.contains(group))) {
        addItemGroupe(group);
        // if(!(_groupsItems.length == dataLoader.length)){
        if(!(_groupsItems.containsKey(group))){
          addItemGroupe(group);
        }

        if(!(groups.length == dataLoader.length) ){
          groups.add(group);
        }
      }
    }

    /// ADD ITEM GROUP MAP
    //      for(int i = 0; i<dataLoader.length; i++){
    //          if(!groups.contains(dataLoader[i])) {
    //            addItemGroupe(dataLoader[i]);
    //            groups.add(dataLoader[i]);
    //          }
    //
    //     }

    // for (Groups group in dataLoader) {
    //   addItemGroupe(group);
    //   for(int i = 0; i<dataLoader.length; i++){
    //     groups.add(group);
    //   }
    //   if(!groups.contains(group)){
    //       groups.add(group);
    //       break;
    //   }
    //
    // }
    // return agricultureBiologique;
    return groups;
    // return queryResult.map((result) => Groups.fromJsonMap(result)).toList();

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


  void addItemHome(AdminItems adminItems) {
    if (_adminItems.containsKey(adminItems.name)) {
            incrementItemHome(adminItems);
    } else {
      _adminItems.putIfAbsent(
          adminItems.name, () =>
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

  }


  void removeProductItem(String c) {
    try {
      _adminItems.removeWhere((key, adminItems) =>
      adminItems.id.toString() == adminItems.id);
    } catch (error) {
      throw "Could not delete AdminItems";
    }

    ///notifyListeners();
  }


  void incrementItemHome(AdminItems adminItems) {
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

  }

  void cleanProducts() {
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

