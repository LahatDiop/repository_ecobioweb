
import 'dart:convert';

//import 'package:moor/moor.dart';

class Product {
  int id;
  String codeProd;
  String type;
  String name;
  String description;
  String? volume;
  String? unit;
  String? height;
  String? weight;
  String? dimensions;
  String? ingredients;
  String? indication;
  String? allergenInformation;
  String? warnings;
  String? producer;
  double price;
  int quantityStock;
  int quantity;
  String category;
  String? brand;
  String? brandModel;
  String? codeEan;
  String? codeQr;
  String? country;
  String? city;
  String? currency;
  String? kilometer;
  String imageURL;
  String image;
  List<String>? images;
  // File? image;
  //Image? image = Image.asset('avocado_1.png');
  //  String code_token;
  String? datePublication;
  String? dateUpdate;
  bool? isFavorite;
  bool? isEnabled;
  Map<int, Product>? amountProducts;


  //  this.location,


  // Constructor
  Product({
    required this.id,
    required this.codeProd,
    required this.type,
    required this.name,
    required this.description,
    this.volume,
    this.unit,
    this.height,
    this.weight,
    this.dimensions,
    this.ingredients,
    this.indication,
    this.allergenInformation,
    this.warnings,
    this.producer,
    required this.price,
    required this.quantityStock,
    required this.quantity,
    required this.category,
    this.brand,
    this.brandModel,
    this.codeEan,
    this.codeQr,
    this.country,
    this.city,
    this.currency,
    this.kilometer,
    required this.imageURL,
    required this.image,
    this.images,
    this.datePublication,
    this.dateUpdate,
    this.isFavorite,
    this.isEnabled,

    ///this.amountProducts
  }); //PlaceLocation ?location,
  //File image;


  static Product fromJsonMap(Map<String, dynamic> json) =>
      Product(
        id: json["id"],
        codeProd: json["codeProd"],
        type: json["type"],
        name: json["name"],
        description: json["description"],
        volume: json["volume"],
        unit: json["unit"],
        height: json["height"],
        weight: json["weight"],
        dimensions: json["dimensions"],
        ingredients: json["ingredients"],
        indication: json["indication"],
        allergenInformation: json["allergenInformation"],
        warnings: json["warnings"],
        producer: json["producer"],
        price: json["price"],
        quantityStock: json["quantityStock"],
        quantity: json["quantity"],
        category: json["category"],
        brand: json["brand"],
        brandModel: json["brandModel"],
        codeEan: json["country"],
        codeQr: json["codeEan"],
        country: json["codeQr"],
        city: json["city"],
        currency: json["currency"],
        kilometer: json["kilometer"],
        imageURL: json["imageURL"],
        image: json["image"],
        images: List<String>.from(json["images"].map((e) => e)),
        datePublication: json["datePublication"],
        dateUpdate: json["dateUpdate"],
        isFavorite: json["isFavorite"],
        isEnabled: json["isEnabled"],

        /// json["amountProducts"]
      );


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      codeProd: json["codeProd"],
      type: json["type"],
      name: json["name"],
      description: json["description"],
      volume: json["volume"],
      unit: json["unit"],
      height: json["height"],
      weight: json["weight"],
      dimensions: json["dimensions"],
      ingredients: json["ingredients"],
      indication: json["indication"],
      allergenInformation: json["allergenInformation"],
      warnings: json["warnings"],
      producer: json["producer"],
      price: double.parse(json["price"].toString()),
      quantityStock: json["quantityStock"],
      quantity: json["quantity"],
      category: json["category"],
      brand: json["brand"],
      brandModel: json["brandModel"],
      codeEan: json["country"],
      codeQr: json["codeEan"],
      country: json["codeQr"],
      city: json["city"],
      currency: json["currency"],
      kilometer: json["kilometer"],
      imageURL: json["imageURL"],
      image: json["image"],
      images: List<String>.from(json["images"]!.map((e) => e)),
      //images: List<String>.from(json["images"]!.map((e) => e.fromJson())),
      datePublication: json["datePublication"],
      dateUpdate: json["dateUpdate"],
      isFavorite: json["isFavorite"],
      isEnabled: json["isEnabled"],
      //  json["amountProducts"]

    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> product = <String, dynamic>{};

    product["id"] = id;
    product["codeProd"] = codeProd;
    product["type"] = type;
    product["name"] = name;
    product["description"] = description;
    product["volume"] = volume;
    product["unit"] = unit;
    product["height"] = height;
    product["weight"] = weight;
    product["dimensions"] = dimensions;
    product["ingredients"] = ingredients;
    product["indication"] = indication;
    product["allergenInformation"] = allergenInformation;
    product["warnings"] = warnings;
    product["producer"] = producer;
    product["price"] = price.toDouble();
    product["quantityStock"] = quantityStock;
    product["quantity"] = quantity;
    product["category"] = category;
    product["brand"] = brand;
    product["brandModel"] = brandModel;
    product["country"] = country;
    product["codeEan"] = codeEan;
    product["codeQr"] = codeQr;
    product["city"] = city;
    product["currency"] = currency;
    product["kilometer"] = kilometer;
    product["imageURL"] = imageURL;
    product["image"] = image;
    product["images"] =images;
    product["datePublication"] = datePublication;
    product["dateUpdate"] = dateUpdate;
    product["isFavorite"] = isFavorite;
    product["isEnabled"] = isEnabled;
    // product["amountProducts"]=amountProducts;

    return product;
  }

  @override
  String toString() {
    return 'Product{id: $id, codeProd: $codeProd,  type: $type,name: $name, description: $description, volume: $volume, unit: $unit, height: $height, weight: $weight, dimensions: $dimensions, ingredients: $ingredients, indication: $indication, allergenInformation: $allergenInformation, warnings: $warnings, producer: $producer, price: $price, quantityStock: $quantityStock, quantity: $quantity, category: $category, brand: $brand, brandModel: $brandModel, codeEan: $codeEan, codeQr: $codeQr, country: $country, city: $city, currency: $currency, kilometer: $kilometer, imageURL: $imageURL, image: $image, images: $images, datePublication: $datePublication, dateUpdate: $dateUpdate, isFavorite: $isFavorite, isEnabled: $isEnabled, amountProducts: $amountProducts}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          codeProd == other.codeProd &&
          type == other.type &&
          name == other.name &&
          description == other.description &&
          volume == other.volume &&
          unit == other.unit &&
          height == other.height &&
          weight == other.weight &&
          dimensions == other.dimensions &&
          ingredients == other.ingredients &&
          indication == other.indication &&
          allergenInformation == other.allergenInformation &&
          warnings == other.warnings &&
          producer == other.producer &&
          price == other.price &&
          quantityStock == other.quantityStock &&
          quantity == other.quantity &&
          category == other.category &&
          brand == other.brand &&
          brandModel == other.brandModel &&
          codeEan == other.codeEan &&
          codeQr == other.codeQr &&
          country == other.country &&
          city == other.city &&
          currency == other.currency &&
          kilometer == other.kilometer &&
          imageURL == other.imageURL &&
          image == other.image &&
          images == other.images &&
          datePublication == other.datePublication &&
          dateUpdate == other.dateUpdate &&
          isFavorite == other.isFavorite &&
          isEnabled == other.isEnabled &&
          amountProducts == other.amountProducts;

  @override
  int get hashCode =>
      id.hashCode ^
      codeProd.hashCode ^
      type.hashCode ^
      name.hashCode ^
      description.hashCode ^
      volume.hashCode ^
      unit.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      dimensions.hashCode ^
      ingredients.hashCode ^
      indication.hashCode ^
      allergenInformation.hashCode ^
      warnings.hashCode ^
      producer.hashCode ^
      price.hashCode ^
      quantityStock.hashCode ^
      quantity.hashCode ^
      category.hashCode ^
      brand.hashCode ^
      brandModel.hashCode ^
      codeEan.hashCode ^
      codeQr.hashCode ^
      country.hashCode ^
      city.hashCode ^
      currency.hashCode ^
      kilometer.hashCode ^
      imageURL.hashCode ^
      image.hashCode ^
      images.hashCode ^
      datePublication.hashCode ^
      dateUpdate.hashCode ^
      isFavorite.hashCode ^
      isEnabled.hashCode ^
      amountProducts.hashCode;

// // var demoItems = [
// List<dynamic> demoItemskk =[
//   Product(
//     id: 1,
//     codeProd: " ",
//     name: " ",
//     description: " ",
//     price: " ",
//     quantityStock: " ",
//     quantity: " ",
//     category: " ",
//     brand: " ",
//     brandModel: " ",
//     codeEan: " ",
//     codeQr: " ",
//     country: " ",
//     city: " ",
//     currency: " ",
//     kilometer: " ",
//     imageURL: "assets/images/grocery_images/beef.png ",
//     image: " ",
//     datePublication: " ",
//     dateUpdate: " ",
//     isFavorite: " ",
//     isEnabled
//
//
//   ),
//   Product(
//     id: 2,
//     name: "Red Apple",
//     description: "1kg, Priceg",
//     price: 5,
//     imageURL: "assets/images/grocery_images/apple.png",
//     codeProd: "",
//     codeEan: "",
//     codeQr: '' ,
//     quantityStock: 5,
//     quantity: 3,
//   ),
//   Product(
//     id: 3,
//     name: "Bell Pepper Red",
//     description: "1kg, Priceg",
//     price: 10,
//     imageURL: "assets/images/grocery_images/pepper.png",
//     codeProd: "",
//     codeEan: "",
//     codeQr: '' ,
//     quantityStock: 5,
//     quantity: 3,
//   ),
//   Product(
//     id: 4,
//     name: "Ginger",
//     description: "250gm, Priceg",
//     price: 4.99,
//     imageURL: "assets/images/grocery_images/ginger.png",
//     codeProd: "",
//     codeEan: "",
//     codeQr: '' ,
//     quantityStock: 5,
//     quantity: 3,
//   ),
//   Product(
//     id: 5,
//     name: "Meat",
//     description: "250gm, Priceg",
//     price: 4.99,
//     imageURL: "assets/images/grocery_images/beef.png",
//     codeProd: "",
//     codeEan: "",
//     codeQr: '' ,
//     quantityStock: 5,
//     quantity: 3,
//   ),
//   Product(
//     id: 6,
//     name: "Chikken",
//     description: "250gm, Priceg",
//     price: 4.99,
//     imageURL: "assets/images/grocery_images/chicken.png",
//     codeProd: "",
//     codeEan: "",
//     codeQr: '' ,
//     quantityStock: 5,
//     quantity: 3,
//   ),
// ];


/// Product user = Product(id, codeProd, name, description, price, quantityStock, category, brand, brandModel, codeEan, codeQr, country, city, currency, kilometer, imageURL, image, datePublication, dateUpdate, isFavorite, isEnabled)
//await SessionManager().set('product', product);
//Product u = Product.fromJson(await SessionManager().get("user"));
/*
"id": 1,
"name": "Carotte",
"description": "String",           
"Price": 3.0,
"Date": "2019-10-31T10:03:35",
"category": "VERDURE",
"brand": "Bioshop",
"brandModel": "M300",
"kilometer": 300.0,
"image": {
"path": "assets/images/verdure/avocado_1.png",
"name": "avocado_1.png"
*/
}