import 'package:ecobioweb/producers/components/producers.dart';

import '../../roots/trunk/branches/managements/customers/models/customers.dart';
import '../../roots/trunk/branches/managements/users/components/users.dart';
import '../../roots/trunk/branches/products/components/product.dart';

class Market {
  final String? id;
  final String name;
  final String code;
  final String? salesOrg;
  final String? currency;
  final String? currencySymbol;
  final String? description;
  final String? dialCode;
  final String? flagUri;
  final int? quantity;
  final String? percentage;
  final String? percentageDiscount;
  final String? quantityProducers;
  final String? quantityCustomers;
  final String? quantityUser;
  final String? companyCode;
  final String? companyName;
  final String? companyEmail;
  final String? companyTelephone;
  final bool?   isEnabledCompany;
  final String? companyAddress;
  final String? dateCreation;
  final String? dateModified;
  final bool? isSelectedMarket;
  final bool? isShowMarket;
  final bool? isShowCategory;
  final bool? isVisibility;
  final bool? isEnabled;
  final bool? isIva;
  final bool? isExchange;
  final bool? isFavorite;

  List<Product> products=[];
  List<Producers> producers=[];
  List<Customers> customers=[];
  List<Users> users=[];        /// Operators

  // Map<String, String>? marketsMap;
  // Map<String, Producers>? producersMap;
  // Map<String, Customers>? customersMap;
  // Map<String, Users>? usersMap;


  Market( {
    this.id,
    required this.name,
    required this.code,
    this.salesOrg,
    this.currency,
    this.currencySymbol,
    this.description,
    this.dialCode,
    this.flagUri,
    this.quantity,
    this.percentage,
    this.percentageDiscount,
    this.quantityProducers,
    this.quantityCustomers,
    this.quantityUser,
    this.companyCode,
    this.companyName,
    this.companyEmail,
    this.companyTelephone,
    this.isEnabledCompany,
    this.companyAddress,
    this.dateCreation,
    this.dateModified,
    this.isSelectedMarket,
    this.isShowMarket,
    this.isShowCategory,
    this.isVisibility,
    this.isEnabled,
    this.isIva,
    this.isExchange,
    this.isFavorite
  });

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(
      id: json['id'] as String,
      name: json["name"] as String,
      code: json["code"] as String,
      salesOrg: json["salesOrg"] as String,
      currency: json["currency"] as String,
      currencySymbol: json["currencySymbol"] as String,
      description: json["description"] as String,
      dialCode: json["dialCode"] as String,
      flagUri: json["flagUri"] as String,
      quantity: json["flagUri"] as int,
      percentage:json["percentage"] as String,
      percentageDiscount:json["percentageDiscount"] as String,
      quantityProducers:json["quantityProducers"] as String,
      quantityCustomers:json["quantityCustomers"] as String,
      quantityUser:json["quantityUser"] as String,
      companyCode: json["companyCode"] as String,
      companyName : json["companyName"] as String,
      companyEmail: json["companyEmail"] as String,
      companyTelephone: json["companyTelephone"] as String,
      isEnabledCompany: json["isEnabledCompany"] as bool,
      companyAddress: json["companyAddress"] as String,
      dateCreation: json["dateCreation"] as String,
      dateModified: json["dateModified"] as String,
      isSelectedMarket: json["isSelectedMarket"] as bool,
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
      'percentage': percentage,
      'percentageDiscount':percentageDiscount ,
      'quantityProducers':quantityProducers ,
      'quantityCustomers':quantityCustomers ,
      'quantityUser':quantityUser ,
      'companyCode': companyCode,
      'companyName': companyName,
      'companyEmail': companyEmail,
      'companyTelephone': companyTelephone,
      'isEnabledCompany': isEnabledCompany,
      'companyAddress': companyAddress,
      'dateCreation': dateCreation,
      'dateModified': dateModified,
      'isSelectedMarket': isSelectedMarket,
      'isShowMarket': isShowMarket,
      'isShowCategory': isShowCategory,
      'isVisibility': isVisibility,
      'isEnabled': isEnabled,
      'isIva': isIva,
      'isExchange': isExchange,
      'isFavorite': isFavorite
    };
  }

  @override
  String toString() {
    return 'Market{id: $id, name: $name, code: $code, salesOrg: $salesOrg, currency: $currency, currencySymbol: $currencySymbol, description: $description, dialCode: $dialCode, flagUri: $flagUri, quantity: $quantity, percentage: $percentage, percentageDiscount: $percentageDiscount, quantityProducers: $quantityProducers, quantityCustomers: $quantityCustomers, quantityUser: $quantityUser, companyCode: $companyCode, companyName: $companyName, companyEmail: $companyEmail, companyTelephone: $companyTelephone, isEnabledCompany: $isEnabledCompany, companyAddress: $companyAddress, dateCreation: $dateCreation, dateModified: $dateModified, isSelectedMarket: $isSelectedMarket, isShowMarket: $isShowMarket, isShowCategory: $isShowCategory, isVisibility: $isVisibility, isEnabled: $isEnabled, isIva: $isIva, isExchange: $isExchange, isFavorite: $isFavorite, products: $products, producers: $producers, customers: $customers, users: $users}';
  }
}

/*

  Future<void> market() async {
    final String response =
        await rootBundle.loadString('../../assets/json/products.json');
    final data = await json.decode(response);

    setState(() {
      productList =
          data['products'].map((data) => Product.fromJson(data)).toList();
    });
  }



*/