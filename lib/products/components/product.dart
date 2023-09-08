
class Product {
  int id;
  String codeProd;
  String name;
  String description;
  //double price;
  // int price;
  double price;
  int quantityStock;
  int quantity;
  String category;
  String brand;
  String? brandModel;
  String? codeEan;
  String? codeQr;
  String? country;
  String? city;
  String? currency;
  String? kilometer;
  String imageURL;
  String image;
  // File? image;
  //Image? image = Image.asset('avocado_1.png');
  //  String code_token;
  String? datePublication;
  String? dateUpdate;
  bool isFavorite;
  bool isEnabled;
  Map<int, Product>? amountProducts;

  //  this.location,

  // Constructor
  Product(
      this.id,
      this.codeProd,
      this.name,
      this.description,
      this.price,
      this.quantityStock,
      this.quantity,
      this.category,
      this.brand,
      this.brandModel,
      this.codeEan,
      this.codeQr,
      this.country,
      this.city,
      this.currency,
      this.kilometer,
      this.imageURL,
      this.image,
      this.datePublication,
      this.dateUpdate,
      this.isFavorite,
      this.isEnabled,
      ///this.amountProducts
      ); //PlaceLocation ?location,
  //File image;



  static Product fromJsonMap(Map<String,dynamic> json)=>Product(
     json["id"],
     json["codeProd"],
      json["name"],
      json["description"],
      json["price"],
      json["quantityStock"],
      json["quantity"],
      json["category"],
      json["brand"],
      json["brandModel"],
      json["country"],
      json["codeEan"],
      json["codeQr"],
      json["city"],
      json["currency"],
      json["kilometer"],
      json["imageURL"],
      json["image"],
      json["datePublication"],
      json["dateUpdate"],
      json["isFavorite"],
      json["isEnabled"],
     /// json["amountProducts"]
  );


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json["id"],
      json["codeProd"],
      json["name"],
      json["description"],
      json["price"].toDouble(),
      json["quantityStock"],
      json["quantity"],
      json["category"],
      json["brand"],
      json["brandModel"],
      json["country"],
      json["codeEan"],
      json["codeQr"],
      json["city"],
      json["currency"],
      json["kilometer"],
      json["imageURL"],
      json["image"],
      json["datePublication"],
      json["dateUpdate"],
      json["isFavorite"],
      json["isEnabled"],
    //  json["amountProducts"]

    );
  }


  Map<String,dynamic> toJson(){

    final Map<String,dynamic> product =<String, dynamic>{};

    product["id"] =id ;
    product["codeProd"] =codeProd ;
    product["name"] = name;
    product["description"] = description;
    product["price"] =price ;
    product["quantityStock"] =quantityStock ;
    product["quantity"] =quantity ;
    product["category"] = category;
    product["brand"] =brand ;
    product["brandModel"] =brandModel ;
    product["country"] =country ;
    product["codeEan"] = codeEan;
    product["codeQr"] = codeQr;
    product["city"] = city;
    product["currency"] = currency;
    product["kilometer"] = kilometer;
    product["imageURL"] = imageURL;
    product["image"] =image ;
    product["datePublication"] =datePublication ;
    product["dateUpdate"] =dateUpdate ;
    product["isFavorite"] =isFavorite ;
    product["isEnabled"] = isEnabled;
   // product["amountProducts"]=amountProducts;

    return product;
  }

  @override
  String toString() {
    return 'Product{'
        ' id: $id,'
        ' codeProd: $codeProd,'
        ' name: $name, '
        ' description: $description,'
        ' price: $price, '
        ' quantityStock: $quantityStock,'
        ' quantity: $quantity,'
        ' category: $category,'
        ' brand: $brand,'
        ' brandModel: $brandModel,'
        ' codeEan: $codeEan,'
        ' codeQr: $codeQr,'
        ' country: $country,'
        ' city: $city,'
        ' currency: $currency,'
        ' kilometer: $kilometer, '
        ' imageURL: $imageURL,'
        ' image: $image, '
        ' datePublication: $datePublication,'
        ' dateUpdate: $dateUpdate,'
        ' isFavorite: $isFavorite,'
        ' isEnabled: $isEnabled'
      //  'amountProducts:$amountProducts'
        '}';
  }
}


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
