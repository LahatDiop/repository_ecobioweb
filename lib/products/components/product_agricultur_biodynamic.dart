//
// class Product {
//   int id;
//   String codeProd;
//   String name;
//   String description;
//   //double price;
//   int price;
//   int quantityStock;
//   int quantity;
//   String category;
//   String brand;
//   String? brandModel;
//   String? codeEan;
//   String? codeQr;
//   String? country;
//   String? city;
//   String? currency;
//   String? kilometer;
//   String imageURL;
//   String image;
//   // File? image;
//   //Image? image = Image.asset('avocado_1.png');
//   //  String code_token;
//   String? datePublication;
//   String? dateUpdate;
//   bool isFavorite;
//   bool isEnabled;
//   //PlaceLocation ?location,
//   //File image;
//
//   Product(
//     this.id,
//     this.codeProd,
//     this.name,
//     this.description,
//     this.price,
//     this.quantityStock,
//     this.quantity,
//     this.category,
//     this.brand,
//     this.brandModel,
//     this.codeEan,
//     this.codeQr,
//     this.country,
//     this.city,
//     this.currency,
//     this.kilometer,
//     this.imageURL,
//     this.image,
//     this.datePublication,
//     this.dateUpdate,
//     this.isFavorite,
//     this.isEnabled,
//     //{required String description},
//     //  this.location,
//   );
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       json["id"],
//       json["codeProd"],
//       json["name"],
//       json["description"],
//       json["price"],
//       json["quantityStock"],
//       json["quantity"],
//       json["category"],
//       json["brand"],
//       json["brandModel"],
//       json["country"],
//       json["codeEan"],
//       json["codeQr"],
//       json["city"],
//       json["currency"],
//       json["kilometer"],
//       json["imageURL"],
//       json["image"],
//       json["datePublication"],
//       json["dateUpdate"],
//       json["isFavorite"],
//       json["isEnabled"],
//     );
//   }
// }
//
//
// /// Product user = Product(id, codeProd, name, description, price, quantityStock, category, brand, brandModel, codeEan, codeQr, country, city, currency, kilometer, imageURL, image, datePublication, dateUpdate, isFavorite, isEnabled)
// //await SessionManager().set('product', product);
// //Product u = Product.fromJson(await SessionManager().get("user"));
// /*
// "id": 1,
// "name": "Carotte",
// "description": "String",
// "Price": 3.0,
// "Date": "2019-10-31T10:03:35",
// "category": "VERDURE",
// "brand": "Bioshop",
// "brandModel": "M300",
// "kilometer": 300.0,
// "image": {
// "path": "assets/images/verdure/avocado_1.png",
// "name": "avocado_1.png"
// */
