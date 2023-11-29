


class Groups {
  final String? id;
  final String name;
  final String code;
  final String? description;
  final String? seachArea;
  final String? imagePath;
  final String? pageScreenPath;
  final bool? isShowGroups;
  final bool? isShowMarket;
  final bool? isShowCategory;
  final bool? isVisibility;
  final bool? isEnabled;
  final bool? isIva;
  final bool? isFavorite;
  final bool? isRecently;
  String? datePublication;
  String? dateUpdate;


  Groups(
      {
        required this.id,
        required this.name,
        required this.code,
        this.description,
        this.seachArea,
        this.imagePath,
        this.pageScreenPath,
        this.isShowGroups,
        this.isShowMarket,
        this.isShowCategory,
        this.isVisibility,
        this.isEnabled,
        this.isIva,
        this.isFavorite,
        this.isRecently,
        this.datePublication,
        this.dateUpdate,
});


  factory Groups.fromJson(Map<String, dynamic> json) {
    return Groups(
      id: json['id'] as String,
      name: json["name"] as String,
      code: json["code"] as String,
      description: json["description"] as String,
      seachArea: json["seachArea"] as String,
      imagePath: json["imagePath"] as String,
      pageScreenPath: json["pageScreenPath"] as String,
      isShowGroups: json["isShowGroups"] as bool,
      isShowMarket: json["isShowMarket"] as bool,
      isShowCategory: json["isShowCategory"] as bool,
      isVisibility: json["isVisibility"] as bool,
      isEnabled: json["isEnabled"] as bool,
      isIva: json["isIva"] as bool,
      isFavorite: json["isFavorite"] as bool,
      isRecently: json["isRecently"] as bool,
      datePublication: json["datePublication"] as String,
      dateUpdate: json["dateUpdate"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'seachArea': seachArea,
      'imagePath': imagePath,
      'pageScreenPath': pageScreenPath,
      'isShowGroups': isShowGroups,
      'isShowMarket': isShowMarket,
      'isShowCategory': isShowCategory,
      'isVisibility': isVisibility,
      'isEnabled': isEnabled,
      'isIva': isIva,
      'isFavorite': isFavorite,
      'isRecently': isRecently,
      'datePublication': datePublication,
      'dateUpdate': dateUpdate,
    };
  }
}

/*factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      companyName: json['companyName'] as String,
      designation: json['designation'] as String,
      isAdmin: json['isAdmin'] as String,
    );
  }
*/
//static fromJson(data) {}
/* factory Groups.fromJson1(Map<String, dynamic> json) {
    return Groups(
      json["id"],
      json["name"],
      json["descrption"],
      json["code"],
      json["dialCode"],
      json["flagUri"],
      json["isShowGroups"],
      json["isShowCategory"],
      json["isVisibility"],
      json["isEnabled"],
      json["isIva"],
      json["isFavorite"],
    );
  }
*/
/*

  Future<void> Groups() async {
    final String response =
        await rootBundle.loadString('../../assets/json/products.json');
    final data = await json.decode(response);

    setState(() {
      productList =
          data['products'].map((data) => Product.fromJson(data)).toList();
    });
  }



*/