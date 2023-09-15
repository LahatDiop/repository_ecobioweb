import 'package:flutter/cupertino.dart';

/// *
///
/// PARAMS DATA CART

class CartItem {
  int id;
  String name;
  String description;
  String codeProd;
  String? codeEan;
  String? codeQr;
  double price;
  int quantityStock;
  int quantity;
  String imageURL;
  bool? isEnabled;
  bool? isPay;
  String? dateAddCart;
  String? dateUpdateCart;
  String? dateRemovedCart;

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.codeProd,
    required this.codeEan,
    required this.codeQr,
    required this.price,
    required this.quantityStock,
    required this.quantity,
    required this.imageURL,
    this.isEnabled,
    this.isPay,
    this.dateAddCart,
    this.dateUpdateCart,
    this.dateRemovedCart,
  });


  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      codeProd: json["codeProd"],
      codeEan: json["codeEan"],
      codeQr: json["codeQr"],
      price: json["price"],
      quantityStock: json["quantityStock"],
      quantity: json["quantity"],
      imageURL: json["imageURL"],
      isEnabled: json["isEnabled"],
      isPay: json["isPay"],
      dateAddCart: json["dateAddCart"],
      dateUpdateCart: json["dateUpdateCart"],
      dateRemovedCart: json["dateRemovedCart"],
    );
  }
}
  // var demoItems = [
List<dynamic> demoItems =[
    CartItem(
      id: 1,
      name: "Organic Bananas",
      description: "7pcs, Priceg",
      price: 4.99,
      imageURL: "assets/images/grocery_images/banana.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 2,
      name: "Red Apple",
      description: "1kg, Priceg",
      price: 5,
      imageURL: "assets/images/grocery_images/apple.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 3,
      name: "Bell Pepper Red",
      description: "1kg, Priceg",
      price: 10,
      imageURL: "assets/images/grocery_images/pepper.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 4,
      name: "Ginger",
      description: "250gm, Priceg",
      price: 4.99,
      imageURL: "assets/images/grocery_images/ginger.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 5,
      name: "Meat",
      description: "250gm, Priceg",
      price: 4.99,
      imageURL: "assets/images/grocery_images/beef.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 6,
      name: "Chikken",
      description: "250gm, Priceg",
      price: 4.99,
      imageURL: "assets/images/grocery_images/chicken.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
  ];

