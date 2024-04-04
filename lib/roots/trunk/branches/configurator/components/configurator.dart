



class Configurator {
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
  Map<int, Configurator>? amountProducts;


  //  this.location,


  // Constructor
  Configurator({
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


  static Configurator fromJsonMap(Map<String, dynamic> json) =>
      Configurator(
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


  factory Configurator.fromJson(Map<String, dynamic> json) {
    return Configurator(
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
    final Map<String, dynamic> configurator = <String, dynamic>{};

    configurator["id"] = id;
    configurator["codeProd"] = codeProd;
    configurator["type"] = type;
    configurator["name"] = name;
    configurator["description"] = description;
    configurator["volume"] = volume;
    configurator["unit"] = unit;
    configurator["height"] = height;
    configurator["weight"] = weight;
    configurator["dimensions"] = dimensions;
    configurator["ingredients"] = ingredients;
    configurator["indication"] = indication;
    configurator["allergenInformation"] = allergenInformation;
    configurator["warnings"] = warnings;
    configurator["producer"] = producer;
    configurator["price"] = price.toDouble();
    configurator["quantityStock"] = quantityStock;
    configurator["quantity"] = quantity;
    configurator["category"] = category;
    configurator["brand"] = brand;
    configurator["brandModel"] = brandModel;
    configurator["country"] = country;
    configurator["codeEan"] = codeEan;
    configurator["codeQr"] = codeQr;
    configurator["city"] = city;
    configurator["currency"] = currency;
    configurator["kilometer"] = kilometer;
    configurator["imageURL"] = imageURL;
    configurator["image"] = image;
    configurator["images"] =images;
    configurator["datePublication"] = datePublication;
    configurator["dateUpdate"] = dateUpdate;
    configurator["isFavorite"] = isFavorite;
    configurator["isEnabled"] = isEnabled;
    // configurator["amountProducts"]=amountProducts;

    return configurator;
  }

  @override
  String toString() {
    return 'configurator{id: $id, codeProd: $codeProd,  type: $type,name: $name, description: $description, volume: $volume, unit: $unit, height: $height, weight: $weight, dimensions: $dimensions, ingredients: $ingredients, indication: $indication, allergenInformation: $allergenInformation, warnings: $warnings, producer: $producer, price: $price, quantityStock: $quantityStock, quantity: $quantity, category: $category, brand: $brand, brandModel: $brandModel, codeEan: $codeEan, codeQr: $codeQr, country: $country, city: $city, currency: $currency, kilometer: $kilometer, imageURL: $imageURL, image: $image, images: $images, datePublication: $datePublication, dateUpdate: $dateUpdate, isFavorite: $isFavorite, isEnabled: $isEnabled, amountProducts: $amountProducts}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Configurator &&
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


}