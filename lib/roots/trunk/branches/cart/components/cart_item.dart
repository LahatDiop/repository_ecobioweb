// import 'dart:html';

/// PARAMS DATA CART

class CartItem {
  int id;
  String codeProd;
  String type;
  String name;
  String description;
  double price;
  int quantityStock;
  int quantity;
  String? category;
  String? brand;
  String? brandModel;
  String? codeEan;
  String? codeQr;
  String? country;
  String? city;
  String? currency;
  String? kilometer;
  String? imageURL;
  String? image;
  List<String>? images;
  bool? isFavorite;
  bool? isEnabled;
  bool? isPay;
  String? dateAddCart;
  String? dateUpdateCart;
  String? dateRemovedCart;
  String? datePublication;
  String? token;
  // final VoidCallback? increaseCartItem;
  // final VoidCallback? decreaseCartItem;

  CartItem({
    required this.id,
    required this.codeProd,
    required this.type,
    required this.name,
    required this.description,
    required this.price,
    required this.quantityStock,
    required this.quantity,
    this.category,
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
    this.isFavorite,
    this.isEnabled,
    this.isPay,
    this.dateAddCart,
    this.dateUpdateCart,
    this.dateRemovedCart,
    this.datePublication,
    this.token,
    // this.increaseCartItem,
    // this.decreaseCartItem,
     });


  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(

      id: json["id"],
      codeProd : json["codeProd"],
      type: json["type"],
      name : json["name"],
      description : json["description"],
      price : json["price"],
      quantityStock : json["quantityStock"],
      quantity : json["quantity"],
      category : json["category"],
      brand : json["brand"],
      brandModel : json["brandModel"],
      codeEan : json["codeEan"],
      codeQr : json["codeQr"],
      country : json["country"],
      city : json["city"],
      currency : json["currency"],
      kilometer : json["kilometer"],
      imageURL : json["imageURL"],
      image : json["image"],
      images: List<String>.from(json["images"].map((e) => e)),
      isFavorite : json["isFavorite"],
      isEnabled : json[""],
      isPay : json["isEnabled"],
      dateAddCart : json["dateAddCart"],
      dateUpdateCart : json["dateUpdateCart"],
      dateRemovedCart : json["dateRemovedCart"],
      datePublication : json["datePublication"],
      token : json["token"],
      // increaseCartItem : json["increaseCartItem"],
      // decreaseCartItem : json["decreaseCartItem"],
    );
  }
}
  // var demoItems = [
List<dynamic> demoItems =[
    CartItem(
      id: 1,
      type: "fruit",
      name: "Organic Bananas",
      description: "7pcs, Priceg",
      price: 4.99,
      imageURL: "assets/images/grocery_images/banana.png",
      image: "assets/images/grocery_images/banana.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 2,
      type: "fruit",
      name: "Red Apple",
      description: "1kg, Priceg",
      price: 5,
      imageURL: "assets/images/grocery_images/apple.png",
      image:  "assets/images/grocery_images/apple.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 3,
      type: "fruit",
      name: "Bell Pepper Red",
      description: "1kg, Priceg",
      price: 10,
      imageURL: "assets/images/grocery_images/pepper.png",
      image: "assets/images/grocery_images/pepper.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 4,
      type: "vegetables",
      name: "Ginger",
      description: "250gm, Priceg",
      price: 4.99,
      imageURL: "assets/images/grocery_images/ginger.png",
      image: "assets/images/grocery_images/ginger.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 5,
      type: "mests",
      name: "Meat",
      description: "250gm, Priceg",
      price: 4.99,
      imageURL: "assets/images/grocery_images/beef.png",
      image: "assets/images/grocery_images/beef.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
    CartItem(
      id: 6,
      type: "chikken",
      name: "Chikken",
      description: "250gm, Priceg",
      price: 4.99,
      imageURL: "assets/images/grocery_images/chicken.png",
      image: "assets/images/grocery_images/chicken.png",
      codeProd: "",
      codeEan: "",
      codeQr: '' ,
      quantityStock: 5,
      quantity: 3,
    ),
  ];

