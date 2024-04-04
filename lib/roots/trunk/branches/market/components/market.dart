// class Market {
//   final String? id;
//   final String? name;
//   final String? description;
//   final String code;
//   final String dialCode;
//   final String? flagUri;
//   final bool? isShowMarket;
//   final bool? isShowCategory;
//   final bool? isVisibility;
//   final bool? isEnabled;
//   final bool? isIva;
//   final bool? isFavorite;
//
//   Market(
//       {this.id,
//       this.name,
//       this.description,
//       required this.code,
//       required this.dialCode,
//       this.flagUri,
//       this.isShowMarket,
//       this.isShowCategory,
//       this.isVisibility,
//       this.isEnabled,
//       this.isIva,
//       this.isFavorite});
//
//   //static fromJson(data) {}
//   /* factory Market.fromJson1(Map<String, dynamic> json) {
//     return Market(
//       json["id"],
//       json["name"],
//       json["descrption"],
//       json["code"],
//       json["dialCode"],
//       json["flagUri"],
//       json["isShowMarket"],
//       json["isShowCategory"],
//       json["isVisibility"],
//       json["isEnabled"],
//       json["isIva"],
//       json["isFavorite"],
//     );
//   }
// */
//   factory Market.fromJson(Map<String, dynamic> json) {
//     return Market(
//       id: json['id'] as String,
//       name: json["name"] as String,
//       description: json["descrption"] as String,
//       code: json["code"] as String,
//       dialCode: json["dialCode"] as String,
//       flagUri: json["flagUri"] as String,
//       isShowMarket: json["isShowMarket"] as bool,
//       isShowCategory: json["isShowCategory"] as bool,
//       isVisibility: json["isVisibility"] as bool,
//       isEnabled: json["isEnabled"] as bool,
//       isIva: json["isIva"] as bool,
//       isFavorite: json["isFavorite"] as bool,
//     );
//   }
//   /*factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'] as String,
//       companyName: json['companyName'] as String,
//       designation: json['designation'] as String,
//       isAdmin: json['isAdmin'] as String,
//     );
//   }
// */
//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'description': description,
//       'code': code,
//       'dialCode': dialCode,
//       'flagUri': flagUri,
//       'isShowMarket': isShowMarket,
//       'isShowCategory': isShowCategory,
//       'isVisibility': isVisibility,
//       'isEnabled': isEnabled,
//       'isIva': isIva,
//       'isFavorite': isFavorite
//     };
//   }
// }
//
// /*
//
//   Future<void> market() async {
//     final String response =
//         await rootBundle.loadString('../../assets/json/products.json');
//     final data = await json.decode(response);
//
//     setState(() {
//       productList =
//           data['products'].map((data) => Product.fromJson(data)).toList();
//     });
//   }
//
//
//
// */