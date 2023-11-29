
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/groups.dart';
import 'dart:convert';

class GroupsProvider  with ChangeNotifier {

  ///-----------------------------------------------------------------------------
  /// MAP Groups
  Map<String, Groups> _groupsItems = {};


  Map<String, Groups> get groupsItems {
    return {..._groupsItems};
  }

  /// LIST Groups
  List<Groups> groups = [];

  /// List Group items 
  // List<String> groups = [];

  List<dynamic> dataLoader = [];


  bool isFlagLoaderEnabled = true;


 Future<List<Groups>>  getData() async {
   groups=  await getGroupsItemsList();
     notifyListeners();
    return groups;
  }
  Future<List<Groups>>  getGroupsItemsList() async {
    final String response =
    await rootBundle.loadString('assets/json/groups.json');
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

  List<Groups> get favoriteItemsProduct {
    return groups.where((element) => element.isFavorite!).toList();
  }

  Groups findById(String id) {
    return groups.firstWhere((element) => element.id.toString() == id);
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


  void removeGroupItem(String group) {
    try {
      _groupsItems.removeWhere((key, group) =>
      group.id.toString() == group.id);
    } catch (error) {
      throw "Could not delete Groups";
    }

    ///notifyListeners();
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

  void cleanProducts() {
    _groupsItems = {};
  }


  Future<void> editItemProduct(String id, Groups editGroup) async {
    final itemGroupIndex = groups.indexWhere((element) =>
    element.id.toString() == id);

    try {
      Groups group = Groups(
        id: editGroup.id,
        name: editGroup.name,
        code: editGroup.code,
        description: editGroup.description,
        seachArea: editGroup.seachArea,
        imagePath: editGroup.imagePath,
        pageScreenPath: editGroup.pageScreenPath,
        isShowGroups: editGroup.isShowGroups == null ? false : editGroup
            .isShowGroups ?? false,
        isShowMarket: editGroup.isShowMarket == null ? false : editGroup
            .isShowMarket ?? false,
        isShowCategory: editGroup.isShowCategory == null ? false : editGroup
            .isShowCategory ?? false,
        isVisibility: editGroup.isVisibility == null ? false : editGroup
            .isVisibility ?? false,
        isEnabled: editGroup.isEnabled == null ? false : editGroup
            .isEnabled ?? false,
        isIva: editGroup.isIva == null ? false : editGroup.isIva ?? false,
        isFavorite: editGroup.isFavorite == null ? false : editGroup
            .isFavorite ?? false,
        isRecently: editGroup.isRecently == null ? false : editGroup
            .isRecently ?? false,
        datePublication: editGroup.datePublication,
        dateUpdate: DateTime.now().toString(),

      );

      groups[itemGroupIndex] = editGroup;
      // notifyListeners();


    } catch (error) {
      rethrow;
    }
  }

  /// convert list<dynamic> to list Object
  List<Groups> getListGroupItem(List<dynamic> data) {
    for (var element in data) {
      groups.add(Groups.fromJson(element));
    }

    return groups ?? List<Groups>.empty();
  }
}