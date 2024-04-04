
import 'dart:convert';
import 'dart:core';
import 'dart:core';

import '../../../../../localisation/translation/components/appLocalizations.dart';

class AdminItems {
  List<AdminItems>? adminItems;

  final String id;
  late final String? subTitle;
  final String name;
  final String description;
  final String? category;
  final String? groups;
  final String? imagePath;
  final String? pageScreenPath;
  final bool? isShowMarket;
  final bool? isShowCategory;
  final bool? isVisibility;
  final bool? isEnabled;
  final bool? isIva;
  final bool? isFavorite;
  final bool? isRecently;
  String? datePublication;
  String? dateUpdate;

  AdminItems({
    required this.id,
    this.subTitle,
    required this.name,
    required this.description,
    this.category,
    this.groups,
    this.imagePath,
    this.pageScreenPath,
    this.isShowMarket,
    this.isShowCategory,
    this.isVisibility,
    this.isEnabled,
    this.isIva,
    this.isFavorite,
    this.isRecently,
    this.datePublication,
    this.dateUpdate,
  });


  static AdminItems fromJson(Map<String,dynamic> json) =>
     AdminItems(
      id :json["id"].toString(),
      subTitle :json["subTitle"],
      name :json["name"].toString(),
      description :json["description"].toString(),
      category :json["category"],
      groups :json["groups"],
      imagePath :json["imagePath"],
      pageScreenPath :json["pageScreenPath"],
      isShowMarket :json["isShowMarket"],
      isShowCategory :json["isShowCategory"],
      isVisibility :json["isVisibility"],
      isEnabled :json["isEnabled"],
      isIva :json["isIva"],
      isFavorite :json["isFavorite"],
      isRecently :json["isRecently"],
      datePublication:  json["datePublication"],
      dateUpdate:  json["dateUpdate"],
    );


  factory AdminItems.fromJsonMap(Map<String,dynamic> json){
    return AdminItems(
      id :json["id"].toString(),
      subTitle :json["subTitle"],
      name :json["name"].toString(),
      description :json["description"].toString(),
      category :json["category"],
      groups :json["groups"],
      imagePath :json["imagePath"],
      pageScreenPath :json["pageScreenPath"],
      isShowMarket :json["isShowMarket"],
      isShowCategory :json["isShowCategory"],
      isVisibility :json["isVisibility"],
      isEnabled :json["isEnabled"],
      isIva :json["isIva"],
      isFavorite :json["isFavorite"],
      isRecently :json["isRecently"],
      datePublication:  json["datePublication"],
      dateUpdate:  json["dateUpdate"],
    );

  }

  /// List AdminItem from list List<dynamic>
   static List<AdminItems> fromJsonList(List<dynamic> parsedJson){
     return parsedJson.map((e) => AdminItems.fromJson(e)).toList();
  }

  ///List AdminItem from List<AdminItems>
  static List<Map<String ,dynamic>> toJsonList(List<AdminItems> listAdminItem){
    return listAdminItem.map((e) => e.toJson()).toList();
  }


  Map<String, dynamic> toJsonMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    if (adminItems != null) {
      data['records'] = adminItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> homeItem =<String, dynamic>{};

    homeItem["id"]= id;
    homeItem["subTitle"]=subTitle ;
    homeItem["name"]= name;
    homeItem["description"]=description ;
    homeItem["category"]= category;
    homeItem["groups"]= groups;
    homeItem["imagePath"]= imagePath;
    homeItem["pageScreenPath"]= pageScreenPath;
    homeItem["isShowMarket"]= isShowMarket;
    homeItem["isShowCategory"]=isShowCategory ;
    homeItem["isVisibility"]= isVisibility;
    homeItem["isEnabled"]=isEnabled ;
    homeItem["isIva"]=isIva ;
    homeItem["isFavorite"]= isFavorite;
    homeItem["isRecently"]=isRecently ;
    homeItem["datePublication"]=datePublication ;
    homeItem["dateUpdate"]= dateUpdate;

    return homeItem;
  }

  factory AdminItems.fromJsonFactory(Map<String,dynamic> json){
    return AdminItems(
      id :json["id"].toString(),
      subTitle :json["subTitle"].toString(),
      name :json["name"].toString(),
      description :json["description"].toString(),
      category :json["category"].toString(),
      groups :json["groups"].toString(),
      imagePath :json["imagePath"].toString(),
      pageScreenPath :json["pageScreenPath"].toString(),
      isShowMarket :false,
      isShowCategory :false,
      isVisibility :false,
      isEnabled :false,
      isIva :false,
      isFavorite :false,
      isRecently :false,
      datePublication:  json["datePublication"].toString(),
      dateUpdate:  json["dateUpdate"].toString(),
    );

  }

  /// convert String to map string dynamic
  static jsonStringToMap(String data){
    List<String> str = data.replaceAll("{","").replaceAll("}","").replaceAll("\"","").replaceAll("'","").split(",");
    Map<String,dynamic> result = {};
    for(int i=0;i<str.length;i++){
      List<String> s = str[i].split(":");
      result.putIfAbsent(s[0].trim(), () => s[1].trim());
    }
    return result;
  }
  ///-------------------------------------------------------------------------
  Map<String, dynamic> getJsonFromString(String rawText) {
    // Will find, for exemple, the text: "{isUserActive:"
    final regexMapKeyWithOpenBracket = RegExp('(?<={)(.*?):+');
    // Will find, for exemple, the text: ", userCourses:"
    final regexMapKeyWithCommaAndSpace = RegExp(r'(?<=, )([^\]]*?):');

    final regexOnlyKeyInLine = RegExp(r'^.+:$');



    final splitedSentences = rawText
        .replaceAllMapped(regexMapKeyWithCommaAndSpace,
            // (Match match) => '\n${match.text.trim()}\n').replaceAllMapped(regexMapKeyWithOpenBracket,
            // (Match match) => '\n${match.text.trim()}\n')
            (Match match) => '\n${rawText.trim()}\n').replaceAllMapped(regexMapKeyWithOpenBracket,(Match match) => '\n${rawText.trim()}\n')

        .replaceAll(RegExp(r'}(?=,|]|}|$|\s+)'), '\n}\n')
        .replaceAll(RegExp(r'(?<=(,|:|^|\[)\s?){'), '\n{\n')
        .replaceAll(RegExp('\\[\\s?\\]'), '\n[\n]\n')
        .replaceAll(RegExp('\\{\\s?\\}'), '\n{\n}\n')
        .replaceAll('[', '\n[\n')
        .replaceAll(']', '\n]\n')
        .replaceAll(',', '\n,\n')
        .split('\n')
      ..removeWhere((element) => element.replaceAll(' ', '').isEmpty);



    ///***************************************

    final List<String> correctLines = [];

    for (String line in splitedSentences) {
      final isMapKey = regexOnlyKeyInLine.hasMatch(line);

      if (isMapKey) {
        final lineWithoutFinalTwoDots = line.substring(0, line.length - 1);
        final lineWithQuaot = _putQuotationMarks(lineWithoutFinalTwoDots);

        correctLines.add('$lineWithQuaot:');
      } else {
        String l = line.trim();

        final hasCommaInFinal = l.endsWith(',') && l.length > 1;
        if (hasCommaInFinal) l = l.substring(0, l.length - 1);

        // If it falls in this else, it is a value of a key or a map structure
        final isNumber = double.tryParse(l) != null || int.tryParse(l) != null;
        final isBolean = l == 'false' || l == 'true';
        final isStructureCaracter =
        ['{', '}', '[', ']', ','].any((e) => e == l);
        final isNull = l == 'null';
        if (isStructureCaracter || isNumber || isBolean || isNull) {
          if (hasCommaInFinal) {
            correctLines.add('$l,');
          } else {
            correctLines.add(l);
          }
          continue;
        }

        // If you got to this point, i'm sure it's a value string, so lets add a double quote
        final lineWithQuaot = _putQuotationMarks(l);
        if (hasCommaInFinal) {
          correctLines.add('$lineWithQuaot,');
        } else {
          correctLines.add(lineWithQuaot);
        }
      }
    }

    final Map<String, dynamic> decoded = {};
    (jsonDecode(correctLines.join('')) as Map).cast<String, dynamic>().forEach((key, value) {
      decoded[key] = value;
    });

    return decoded;
  }

//    MatchExtension on Match {
//   String get text => input.substring(start, end);
// }

String _putQuotationMarks(String findedText) {
  if (!findedText.startsWith('\'') && !findedText.startsWith('"')) {
    findedText = findedText[0] + findedText.substring(1);
  }
  if (!findedText.endsWith('\'')) {
    final lastIndex = findedText.length - 1;
    findedText = findedText.substring(0, lastIndex) + findedText[lastIndex];
  }
  return '"$findedText"';
}


  ///----------------------------------------------------------------------------------------

  // factory AdminItems.fromJsonObject(List<String> json){
  //   return AdminItems(
  //     id :json,
  //     subTitle :json["subTitle"].toString(),
  //     name :json["name"].toString(),
  //     description :json["description"].toString(),
  //     category :json["category"].toString(),
  //     groups :json["groups"].toString(),
  //     imagePath :json["imagePath"].toString(),
  //     pageScreenPath :json["pageScreenPath"].toString(),
  //     isShowMarket :false,
  //     isShowCategory :false,
  //     isVisibility :false,
  //     isEnabled :false,
  //     isIva :false,
  //     isFavorite :false,
  //     isRecently :false,
  //     datePublication:  json["datePublication"].toString(),
  //     dateUpdate:  json["dateUpdate"].toString(),
  //   );
  //
  // }
  String subTitleToString() {
    return 'AdminItems{subTitle: $subTitle}';
  }

  @override
  String toString() {
    return 'AdminItems{id: $id, subTitle: $subTitle, name: $name, description: $description, category: $category, groups: $groups, imagePath: $imagePath,pageScreenPath: $pageScreenPath, isShowMarket: $isShowMarket, isShowCategory: $isShowCategory, isVisibility: $isVisibility, isEnabled: $isEnabled, isIva: $isIva, isFavorite: $isFavorite, isRecently: $isRecently}';
  }
}

mixin text {
}



// extractedData.forEach((homeId, homeData) {
// items.add(
// AdminItems(
// id:homeData["id"].toString(),
// subTitle: homeData["subTitle"],
// name: homeData["name"],
// description:homeData["description"] ,
// category:  homeData["category"],
// groups:homeData["groups"] ,
// imagePath:homeData["imagePath"] ,
// pageScreenPath:homeData["pageScreenPath"] ,
// isShowMarket:homeData ==null ? false : homeData[homeId] ?? false ,
// isShowCategory: homeData ==null ? false : homeData[homeId] ?? false ,
// isVisibility:homeData ==null ? false : homeData[homeId] ?? false ,
// isEnabled:homeData ==null ? false : homeData[homeId] ?? false ,
// isIva:homeData ==null ? false : homeData[homeId] ?? false ,
// isFavorite: homeData ==null ? false : homeData[homeId] ?? false ,
// isRecently:homeData ==null ? false : homeData[homeId] ?? false ,
// datePublication:homeData["datePublication"] ,
// dateUpdate:homeData["dateUpdate"] ,
// )
// );
//
// });
// CATEGORY HOME "Agricultura Biologica", "Agricultura Biodinamica", "Agricultura Integrato", "KM Zero", "Prodotti Biologici"
List<String> itemsaBioAgriculture = [
  AppLocalizations.translate('agricultureBiological'),
  AppLocalizations.translate('agricultureBiodynamic'),
  AppLocalizations.translate('agricultureIntegration'),
  AppLocalizations.translate('agricultureKmZero'),
  AppLocalizations.translate('productsBiologiques'),
];
//
//
// var agricultureBiologique = [
//   agricultureBiologiqueItems[0],
//   agricultureBiologiqueItems[1],
//   agricultureBiologiqueItems[2],
//   agricultureBiologiqueItems[3],
//   agricultureBiologiqueItems[4],
// ];
//
// var agricultureBiologiqueItems = [
//   AdminItems(
//     id: "1",
//     name: AppLocalizations.translate('agricultureBiological'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('agricultureBiological') ,
//     category: AppLocalizations.translate('fruitsVegetable'),
//     groups: "homeSceen",
//     imagePath: "assets/images/agriculture/agriculture_6.png",
//   ),
//   // imagePath: "assets/images/grocery_images/banana.png"),
//   AdminItems(
//     id:"2" ,
//     name: AppLocalizations.translate('agricultureBiodynamic'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('agricultureBiodynamic') ,
//     category: AppLocalizations.translate('fruitsVegetable'),
//     groups: "homeSceen",
//     imagePath: "assets/images/agriculture/agriculture_1.png",
//     // imagePath: "assets/images/grocery_images/apple.png"
//   ),
//   AdminItems(
//     id: "3",
//     name: AppLocalizations.translate('agricultureIntegration'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('agricultureIntegration') ,
//     category: AppLocalizations.translate('fruitsVegetable'),
//     groups: "homeSceen" ,
//     imagePath: "assets/images/agriculture/agriculture_2.png",
//     //  imagePath: "assets/images/grocery_images/pepper.png"
//   ),
//   AdminItems(
//     id: "4",
//     name: AppLocalizations.translate('agricultureKmZero'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('agricultureKmZero') ,
//     category: AppLocalizations.translate('fruitsVegetable'),
//     groups: "homeSceen",
//     imagePath: "assets/images/agriculture/agriculture_3.png",
//     //  imagePath: "assets/images/grocery_images/ginger.png"
//   ),
//   AdminItems(
//     id: "5",
//     name: AppLocalizations.translate('productsBiologiques'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('productsBiologiques') ,
//     category: AppLocalizations.translate('productsBiologiques'),
//     groups: "homeSceen",
//     imagePath: "assets/images/agriculture/agriculture_4.png",
//     //  imagePath: "assets/images/grocery_images/beef.png"
//   ),
//
// ];


var AdminItemsList = [
  AdminItems(
      id: "1",
      name: AppLocalizations.translate('agricultureBiological'),
      description: "7pcs, Priceg",
      subTitle:AppLocalizations.translate('agricultureBiological') ,
      //price: 4.99,
      imagePath: "assets/images/grocery_images/banana.png"),
  AdminItems(
      id: "2",
      name: "Red Apple",
      description: "1kg, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/apple.png"),
  AdminItems(
      id: "3",
      name: "Bell Pepper Red",
      description: "1kg, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/pepper.png"),
  AdminItems(
      id: "4",
      name: "Ginger",
      description: "250gm, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/ginger.png"),
  AdminItems(
      id: "5",
      name: "Meat",
      description: "250gm, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/beef.png"),
  AdminItems(
      id: "6",
      name: "Chikken",
      description: "250gm, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/chicken.png"),

  AdminItems(
      id: "7",
      name: "POoo",
      description: "250gm, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/beef.png"),
];


List<AdminItems> hotetBiologique = [AdminItemsList[2], AdminItemsList[3]];


List<AdminItems> greenbuilding = [AdminItemsList[4], AdminItemsList[5]];

List<AdminItems> hotelBiologique = [AdminItemsList[5], AdminItemsList[6]];

// var exclusiveOffers = [AdminItemsList[0], AdminItemsList[1]];
//
// var bestSelling = [AdminItemsList[2], AdminItemsList[3]];
//
// var groceries = [AdminItemsList[4], AdminItemsList[5]];

var beverages = [
  AdminItems(
      id: "7",
      name: "Dite Coke",
      description: "355ml, Price",
     // price: 1.99,
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  AdminItems(
      id: "8",
      name: "Sprite Can",
      description: "325ml, Price",
      //price: 1.50,
      imagePath: "assets/images/beverages_images/sprite.png"),
  AdminItems(
      id: "8",
      name: "Apple Juice",
      description: "2L, Price",
     // price: 15.99,
      imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
  AdminItems(
      id: "9",
      name: "Orange Juice",
      description: "2L, Price",
     // price: 1.50,
      imagePath: "assets/images/beverages_images/orange_juice.png"),
  AdminItems(
      id: "10",
      name: "Coca Cola Can",
      description: "325ml, Price",
      ////price: 4.99,
      imagePath: "assets/images/beverages_images/coca_cola.png"),
  AdminItems(
      id: "11",
      name: "Pepsi Can",
      description: "330ml, Price",
      ////price: 4.99,
      imagePath: "assets/images/beverages_images/pepsi.png"),
];
