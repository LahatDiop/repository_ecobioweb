class Producers {
  final String? id;
  final String name;
  final String code;
  final String? salesOrg;
  final String? currency;
  final String? currencySymbol;
  final String? description;
  final String? dialCode;
  final String? flagUri;
  final String? user;
  final String? companyCode;
  final String? companyName;
  final String? companyEmail;
  final String? companyTelephone;
  final bool?   companyEnabled;
  final String? companyAddress;
  final String? dateCreation;
  final String? dateModified;
  final bool? isShowMarket;
  final bool? isShowCategory;
  final bool? isVisibility;
  final bool isEnabled;
  final bool? isIva;
  final bool? isExchange;
  final bool? isFavorite;


  Producers( {
    this.id,
    required this.name,
    required this.code,
    this.salesOrg,
    this.currency,
    this.currencySymbol,
    this.description,
    this.dialCode,
    this.flagUri,
    this.user,
    this.companyCode,
    this.companyName,
    this.companyEmail,
    this.companyTelephone,
    this.companyEnabled,
    this.companyAddress,
    this.dateCreation,
    this.dateModified,
    this.isShowMarket,
    this.isShowCategory,
    this.isVisibility,
    required this.isEnabled,
    this.isIva,
    this.isExchange,
    this.isFavorite});

  factory Producers.fromJson(Map<String, dynamic> json) {
    return Producers(
      id: json['id'] as String,
      name: json["name"] as String,
      code: json["code"] as String,
      salesOrg: json["salesOrg"] as String,
      currency: json["currency"] as String,
      currencySymbol: json["currencySymbol"] as String,
      description: json["description"] as String,
      dialCode: json["dialCode"] as String,
      flagUri: json["flagUri"] as String,
      user: json["user"] as String,
      companyCode: json["companyCode"] as String,
      companyName : json["companyName"] as String,
      companyEmail: json["companyEmail"] as String,
      companyTelephone: json["companyTelephone"] as String,
      companyEnabled: json["companyEnabled"] as bool,
      companyAddress: json["companyAddress"] as String,
      dateCreation: json["dateCreation"] as String,
      dateModified: json["dateModified"] as String,
      isShowMarket: json["isShowMarket"] as bool,
      isShowCategory: json["isShowCategory"] as bool,
      isVisibility: json["isVisibility"] as bool,
      isEnabled: json["isEnabled"] as bool,
      isIva: json["isIva"] as bool,
      isExchange: json["isExchange"] as bool,
      isFavorite: json["isFavorite"] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'salesOrg': salesOrg,
      'currency': currency,
      'currencySymbol': currencySymbol,
      'description': description,
      'dialCode': dialCode,
      'flagUri': flagUri,
      'user': user,
      'companyCode': companyCode,
      'companyName': companyName,
      'companyEmail': companyEmail,
      'companyTelephone': companyTelephone,
      'companyEnabled': companyEnabled,
      'companyAddress': companyAddress,
      'dateCreation': dateCreation,
      'dateModified': dateModified,
      'isShowMarket': isShowMarket,
      'isShowCategory': isShowCategory,
      'isVisibility': isVisibility,
      'isEnabled': isEnabled,
      'isIva': isIva,
      'isExchange': isExchange,
      'isFavorite': isFavorite
    };
  }
}

/*

  Future<void> Producers() async {
    final String response =
        await rootBundle.loadString('../../assets/json/products.json');
    final data = await json.decode(response);

    setState(() {
      productList =
          data['products'].map((data) => Product.fromJson(data)).toList();
    });
  }



*/