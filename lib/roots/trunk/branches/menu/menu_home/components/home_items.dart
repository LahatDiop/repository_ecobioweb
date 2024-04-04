import '../../../localisation/translation/components/appLocalizations.dart';

class HomeItems {

  List<HomeItems>? homeItems;
  final String id;
  final String? subTitle;
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

  HomeItems({
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


  static HomeItems fromJson(Map<String,dynamic> json) =>
     HomeItems(
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


  factory HomeItems.fromJsonMap(Map<String,dynamic> json){
    return HomeItems(
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
  static List<HomeItems> fromJsonList(List<dynamic> parsedJson){
    return parsedJson.map((e) => HomeItems.fromJson(e)).toList();
  }

  ///List AdminItem from List<AdminItems>
  static List<Map<String ,dynamic>> toJsonList(List<HomeItems> listAdminItem){
    return listAdminItem.map((e) => e.toJson()).toList();
  }


  Map<String, dynamic> toJsonMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    if (homeItems != null) {
      data['records'] = homeItems!.map((v) => v.toJson()).toList();
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

  factory HomeItems.fromJsonFactory(Map<String,dynamic> json){
    return HomeItems(
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
  String subTitleToString() {
    return 'HomeItems{subTitle: $subTitle}';
  }

  @override
  String toString() {
    return 'HomeItems{id: $id, subTitle: $subTitle, name: $name, description: $description, category: $category, groups: $groups, imagePath: $imagePath,pageScreenPath: $pageScreenPath, isShowMarket: $isShowMarket, isShowCategory: $isShowCategory, isVisibility: $isVisibility, isEnabled: $isEnabled, isIva: $isIva, isFavorite: $isFavorite, isRecently: $isRecently}';
  }
}



// extractedData.forEach((homeId, homeData) {
// items.add(
// HomeItems(
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
//   HomeItems(
//     id: "1",
//     name: AppLocalizations.translate('agricultureBiological'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('agricultureBiological') ,
//     category: AppLocalizations.translate('fruitsVegetable'),
//     groups: "homeSceen",
//     imagePath: "assets/images/agriculture/agriculture_6.png",
//   ),
//   // imagePath: "assets/images/grocery_images/banana.png"),
//   HomeItems(
//     id:"2" ,
//     name: AppLocalizations.translate('agricultureBiodynamic'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('agricultureBiodynamic') ,
//     category: AppLocalizations.translate('fruitsVegetable'),
//     groups: "homeSceen",
//     imagePath: "assets/images/agriculture/agriculture_1.png",
//     // imagePath: "assets/images/grocery_images/apple.png"
//   ),
//   HomeItems(
//     id: "3",
//     name: AppLocalizations.translate('agricultureIntegration'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('agricultureIntegration') ,
//     category: AppLocalizations.translate('fruitsVegetable'),
//     groups: "homeSceen" ,
//     imagePath: "assets/images/agriculture/agriculture_2.png",
//     //  imagePath: "assets/images/grocery_images/pepper.png"
//   ),
//   HomeItems(
//     id: "4",
//     name: AppLocalizations.translate('agricultureKmZero'),
//     description: "Bio per tutti",
//     subTitle:AppLocalizations.translate('agricultureKmZero') ,
//     category: AppLocalizations.translate('fruitsVegetable'),
//     groups: "homeSceen",
//     imagePath: "assets/images/agriculture/agriculture_3.png",
//     //  imagePath: "assets/images/grocery_images/ginger.png"
//   ),
//   HomeItems(
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


var homeItemsList = [
  HomeItems(
      id: "1",
      name: AppLocalizations.translate('agricultureBiological'),
      description: "7pcs, Priceg",
      subTitle:AppLocalizations.translate('agricultureBiological') ,
      //price: 4.99,
      imagePath: "assets/images/grocery_images/banana.png"),
  HomeItems(
      id: "2",
      name: "Red Apple",
      description: "1kg, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/apple.png"),
  HomeItems(
      id: "3",
      name: "Bell Pepper Red",
      description: "1kg, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/pepper.png"),
  HomeItems(
      id: "4",
      name: "Ginger",
      description: "250gm, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/ginger.png"),
  HomeItems(
      id: "5",
      name: "Meat",
      description: "250gm, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/beef.png"),
  HomeItems(
      id: "6",
      name: "Chikken",
      description: "250gm, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/chicken.png"),

  HomeItems(
      id: "7",
      name: "POoo",
      description: "250gm, Priceg",
      //price: 4.99,
      imagePath: "assets/images/grocery_images/beef.png"),
];


List<HomeItems> hotetBiologique = [homeItemsList[2], homeItemsList[3]];


List<HomeItems> greenbuilding = [homeItemsList[4], homeItemsList[5]];

List<HomeItems> hotelBiologique = [homeItemsList[5], homeItemsList[6]];

// var exclusiveOffers = [homeItemsList[0], homeItemsList[1]];
//
// var bestSelling = [homeItemsList[2], homeItemsList[3]];
//
// var groceries = [homeItemsList[4], homeItemsList[5]];

var beverages = [
  HomeItems(
      id: "7",
      name: "Dite Coke",
      description: "355ml, Price",
     // price: 1.99,
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  HomeItems(
      id: "8",
      name: "Sprite Can",
      description: "325ml, Price",
      //price: 1.50,
      imagePath: "assets/images/beverages_images/sprite.png"),
  HomeItems(
      id: "8",
      name: "Apple Juice",
      description: "2L, Price",
     // price: 15.99,
      imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
  HomeItems(
      id: "9",
      name: "Orange Juice",
      description: "2L, Price",
     // price: 1.50,
      imagePath: "assets/images/beverages_images/orange_juice.png"),
  HomeItems(
      id: "10",
      name: "Coca Cola Can",
      description: "325ml, Price",
      ////price: 4.99,
      imagePath: "assets/images/beverages_images/coca_cola.png"),
  HomeItems(
      id: "11",
      name: "Pepsi Can",
      description: "330ml, Price",
      ////price: 4.99,
      imagePath: "assets/images/beverages_images/pepsi.png"),
];
