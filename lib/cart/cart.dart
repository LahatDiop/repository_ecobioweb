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

  CartItem( {
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
      name:  json["name"],
      description: json["description"],
      codeProd: json["codeProd"],
      codeEan: json["codeEan"],
      codeQr:json["codeQr"],
      price: json["price"],
      quantityStock: json["quantityStock"],
      quantity: json["quantity"],
      imageURL:json["imageURL"],
      isEnabled: json["isEnabled"],
      isPay:json["isPay"],
      dateAddCart:json["dateAddCart"],
      dateUpdateCart:json["dateUpdateCart"],
      dateRemovedCart:json["dateRemovedCart"],
    );
  }


}