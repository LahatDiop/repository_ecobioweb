
import '../../../../../../market/components/market.dart';
import '../../../languages/components/language.dart';
import '../../../menu/menu_settings/settings/auth/models/term_of_service.dart';
import '../../Roles/models/role.dart';

class Users {

  String? id;
  String? code;
  String? codeDefaultMarket;
  String? codeClient;
  String? codeDealer;
  String? codeTeamWorkers;
  String? codeSuppliers; //  fournisseur
  String? name;
  String? email;
  String ?password;
  String ? phone;
  String? office;
  String? officeAddress;
  String? officeCity;
  String? officePhoneMobile;
  String? officePhoneFix;
  String? officeEmail;
  String? officeFax;
  String? notes;
  String ? aboutMeDescription;
  String ? image;
  String? flagUri;
  DateTime? dateCreation;
  DateTime? dateModified;
  DateTime? dateLastAccess;
  bool? isEnabled= false;
  bool? isEnabledMarket= false;
  bool? isFavorite= false;
  bool? isShowMarket= false;
  bool? isMarketDefault= false;
  bool? isNotification= false;
  String? userDataJson;

  // List<Users>? usersItems;

  List<Users>? users;
///Market
  Market? market;
  List<Market>? markets;
///Language
 Language? language;
 List<Language>? languages;

  /// Roles: admin market gestion market user admin TODO
  List<Role>? roles;

 ///TermOfServiceResult
  List<TermOfServiceResult>?  termsOfService;
 /// final Map<String, String>? additionalSignupData;


///
   final Map <String, bool> _rollingSwitch={
      "isEnabled": false,
      "isEnabledMarket":false,
      "isFavorite": false,
      "isShowMarket": false,
      "isMarketDefault": false,
      "isNotification": false,
   };

  Map<String,bool> get rollingSwitch{
    return{..._rollingSwitch};
}

  ///Configuration TODO
  ///List<Configuration>

  // Constructor
  Users({
      this.id,
      this.code,
      this.codeDefaultMarket,
      this.codeClient,
      this.codeDealer,
      this.codeTeamWorkers,
      this.codeSuppliers,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.office,
      this.officeAddress,
      this.officeCity,
      this.officePhoneMobile,
      this.officePhoneFix,
      this.officeEmail,
      this.officeFax,
      this.notes,
      this.aboutMeDescription,
      this.image,
      this.flagUri,
      this.dateCreation,
      this.dateModified,
      this.dateLastAccess,
      this.isEnabled,
      this.isEnabledMarket,
      this.isFavorite,
      this.isShowMarket,
      this.isMarketDefault,
      this.isNotification,
      this.market,
      this.markets ,
      this.language,
      this.languages ,
      this.termsOfService,
      this.userDataJson,
      this.users,
      this.roles,
      ///this._rollingSwitch,


     // this.additionalSignupData

    /// private String currentXml;
  });



  /// List AdminItem from list List<dynamic>
  static List<Users> fromJsonList(List<dynamic> parsedJson){
    return parsedJson.map((e) => Users.fromJson(e)).toList();
  }

  ///List AdminItem from List<AdminItems>
  static List<Map<String ,dynamic>> toJsonList(List<Users> listAdminItem){
    return listAdminItem.map((e) => e.toJson()).toList();
  }



  //  Users.fromJsonList(Map<String,dynamic> json){
  // if(json['users'] !=null){
  //    ///users=<Users>[];
  //      json['user'].forEach((v){
  //        users!.add(Users.fromJsonList(v));
  //      });
  // }
  //
  //
  // }


  Map<String, dynamic> toJsonMap() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (users != null) {
      data['records'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toJsonTermsOfService() {
    return {
      'termsOfService': termsOfService,

    };
  }

  static Users fromJson(Map<String, dynamic>  json) => Users(
    id:json['id'] ?? "",
    code:json['code'] ?? "",
    codeDefaultMarket:json['codeDefaultMarket'] ?? "" ,
    codeClient:json['codeClient'] ?? "" ,
    codeDealer:json['codeDealer'] ?? "" ,
    codeTeamWorkers:json['codeTeamWorkers'] ?? "" ,
    codeSuppliers:json['codeSuppliers']  ?? "",
    name:json['name'] ?? "" ,
    email:json['email']  ?? "",
    password:json['password']  ?? "",
    phone:json['phone'] ?? "" ,
    office:json['office']  ?? "",
    officeAddress:json['officeAddress']  ?? "",
    officeCity:json['officeCity']  ?? "",
    officePhoneMobile:json['officePhoneMobile'] ?? "" ,
    officePhoneFix:json['officePhoneFix'] ?? "" ,
    officeEmail:json['officeEmail'] ?? "" ,
    officeFax:json['officeFax'] ?? "" ,
    notes:json['notes'] ?? "" ,
    aboutMeDescription: json['aboutMeDescription'] ?? "" ,
    image:json['image'] ?? "" ,
    flagUri:json['flagUri'] ?? "" ,
    //  dateCreation:json['dateCreation'] as DateTime,
    // dateModified:json['dateModified'] as DateTime,[[[]]èè++ùù
    // dateLastAccess:json['dateLastAccess'] as DateTime,
    dateCreation:json[DateTime.timestamp().toString()],
    dateModified:json[DateTime.timestamp().toString()],
    dateLastAccess: json["dateLastAccess"],
    isEnabled:json['isEnabled'] ,
    isEnabledMarket:json['isEnabledMarket'] ,
    isFavorite:json['isFavorite'],
    isShowMarket:json['isShowMarket'] ,
    isMarketDefault:json['isMarketDefault'] ,
    isNotification:json['isNotification'],
    market:json['market'] ,
    markets:json['markets'] ,
    language:json['language'],
    languages:json['languages']  ,
    //    additionalSignupData: json["additionalSignupData"] as Map<String, String> ,
    termsOfService:json["termsOfService"],
    userDataJson:json["userdataJson"] ?? "",
  );

  /// Map TO => JSON
  Map<String, dynamic> toJson() => {
    'id':id,
    'code': code,
    'codeDefaultMarket':codeDefaultMarket,
    'codeClient':codeClient,
    'codeDealer':codeDealer,
    'codeTeamWorkers':codeTeamWorkers,
    'codeSuppliers':codeSuppliers,
    'name':name,
    'email':email,
    'password':password,
    'phone':phone,
    'office':office,
    'officeAddress':officeAddress,
    'officeCity':officeCity,
    'officePhoneMobile':officePhoneMobile,
    'officePhoneFix':officePhoneFix,
    'officeEmail':officeEmail,
    'officeFax':officeFax,
    'notes':notes,
    'aboutMeDescription': aboutMeDescription,
    'image':image,
    'flagUri':flagUri,
    'dateCreation':dateCreation,
    'dateModified':dateModified,
    'dateLastAccess':dateLastAccess,
    'isEnabled':isEnabled,
    'isEnabledMarket':isEnabledMarket,
    'isFavorite':isFavorite,
    'isShowMarket':isShowMarket,
    'isMarketDefault':isMarketDefault,
    'isNotification':isNotification,
    'market': market,
    'markets ':markets,
    'language':language,
    'languages ':languages ,
   /// 'additionalSignupData':additionalSignupData ,
    'termsOfService': termsOfService,
    'userDataJson':userDataJson,
  };


  Users copy({
    String? id,
    String? code,
    String? codeDefaultMarket,
    String? codeClient,
    String? codeDealer,
    String? codeTeamWorkers,
    String? codeSuppliers, //  fournisseur
    String? name,
    String? email,
    String ?password,
    String ? phone,
    String? office,
    String? officeAddress,
    String? officeCity,
    String? officePhoneMobile,
    String? officePhoneFix,
    String? officeEmail,
    String? officeFax,
    String? notes,
    String ? aboutMeDescription,
    String ? image,
    String? flagUri,
    DateTime? dateCreation,
    DateTime? dateModified,
    DateTime? dateLastAccess,
    bool? isEnabled,
    bool? isEnabledMarket,
    bool? isFavorite,
    bool? isShowMarket,
    bool? isMarketDefault,
    bool? isNotification,
    List<TermOfServiceResult>? termsOfService,
    Map<String, String>? additionalSignupData,
  }) =>
      Users(
        id: id ?? this.id,
        code: code ?? this.code,
        codeDefaultMarket: codeDefaultMarket ?? this.codeDefaultMarket,
        codeClient:codeClient  ?? this.codeClient,
        codeDealer: codeDealer ?? this.codeDealer,
        codeTeamWorkers: codeTeamWorkers ?? this.codeTeamWorkers,
        codeSuppliers: codeSuppliers ?? this.codeSuppliers, //  fournisseur
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone:phone  ?? this.phone,
        office:office?? this.office,
        officeAddress: officeAddress ?? this.officeAddress,
        officeCity:officeCity  ?? this.officeCity,
        officePhoneMobile: officePhoneMobile ?? this.officePhoneMobile,
        officePhoneFix: officePhoneFix ?? this.officePhoneFix,
        officeEmail:officeEmail  ?? this.officeEmail,
        officeFax: officeFax ?? this.officeFax,
        notes: notes ?? this.notes,
        aboutMeDescription: aboutMeDescription  ?? this.aboutMeDescription,
        image: image ?? this.image,
        flagUri: flagUri ?? this.flagUri,
        dateCreation: dateCreation ?? this.dateCreation,
        dateModified: dateModified ?? this.dateModified,
        dateLastAccess: dateLastAccess ?? this.dateLastAccess,
        isEnabled: isEnabled ?? this.isEnabled,
        isEnabledMarket:isEnabledMarket  ?? this.isEnabledMarket,
        isFavorite: isFavorite ?? this.isFavorite,
        isShowMarket: isShowMarket ?? this.isShowMarket,
        isMarketDefault:isMarketDefault  ?? this.isMarketDefault,
        isNotification: isNotification ?? this.isNotification,
        termsOfService: termsOfService ?? this.termsOfService,
      ///  additionalSignupData: additionalSignupData ?? this.additionalSignupData,
      );

  @override
  String toString() {
    return 'Users{id: $id, code: $code, codeDefaultMarket: $codeDefaultMarket, codeClient: $codeClient, codeDealer: $codeDealer, codeTeamWorkers: $codeTeamWorkers, codeSuppliers: $codeSuppliers, name: $name, email: $email, password: $password, phone: $phone, office: $office, officeAddress: $officeAddress, officeCity: $officeCity, officePhoneMobile: $officePhoneMobile, officePhoneFix: $officePhoneFix, officeEmail: $officeEmail, officeFax: $officeFax, notes: $notes, aboutMeDescription: $aboutMeDescription, image: $image, flagUri: $flagUri, dateCreation: $dateCreation, dateModified: $dateModified, dateLastAccess: $dateLastAccess, isEnabled: $isEnabled, isEnabledMarket: $isEnabledMarket, isFavorite: $isFavorite, isShowMarket: $isShowMarket, isMarketDefault: $isMarketDefault, isNotification: $isNotification, userDataJson: $userDataJson, users: $users, market: $market, markets: $markets, language: $language, languages: $languages, roles: $roles, termsOfService: $termsOfService}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Users && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;












// factory Users.fromJson(Map<String, dynamic> json) {
  //   return Users(
  //     id:json['id']as String,
  //     code: json['code'] as String,
  //     codeDefaultMarket:json['codeDefaultMarket'] as String,
  //     codeClient:json['codeClient'] as String,
  //     codeDealer:json['codeDealer'] as String,
  //     codeTeamWorkers:json['codeTeamWorkers'] as String,
  //     codeSuppliers:json['codeSuppliers'] as String,
  //     name:json['name'] as String,
  //     email:json['email'] as String,
  //     password:json['password'] as String,
  //     phone:json['phone'] as String,
  //     office:json['office'] as String,
  //     officeAddress:json['officeAddress'] as String,
  //     officeCity:json['officeCity'] as String,
  //     officePhoneMobile:json['officePhoneMobile'] as String,
  //     officePhoneFix:json['officePhoneFix'] as String,
  //     officeEmail:json['officeEmail'] as String,
  //     officeFax:json['officeFax'] as String,
  //     notes:json['notes'] as String,
  //     aboutMeDescription: json['aboutMeDescription'] as String,
  //     image:json['image'] as String,
  //     flagUri:json['flagUri'] as String,
  //     //  dateCreation:json['dateCreation'] as DateTime,
  //     // dateModified:json['dateModified'] as DateTime,
  //     // dateLastAccess:json['dateLastAccess'] as DateTime,
  //     dateCreation: DateTime.parse(json["dateCreation"]),
  //     dateModified: DateTime.parse(json["dateModified"]),
  //     dateLastAccess: DateTime.parse(json["dateLastAccess"]),
  //     isEnabled:json['isEnabled'] as bool,
  //     isEnabledMarket:json['isEnabledMarket'] as bool,
  //     isFavorite:json['isFavorite'] as bool,
  //     isShowMarket:json['isShowMarket'] as bool,
  //     isMarketDefault:json['isMarketDefault'] as bool   ,
  //     isNotification:json['isNotification'] as bool,
  //     market: json[''] as Market,
  //     markets :json['markets'] as List<Market>,
  //     language:json['language'] as Language,
  //     languages :json['languages'] as List<Language> ,
  //     //    additionalSignupData: json["additionalSignupData"] as Map<String, String> ,
  //     termsOfService: json["termsOfService"] as  List<TermOfServiceResult>,
  //     userDataJson: json["userdataJson"] as String,
  //   );
  // }
  //
  // factory Users.fromJsonClass(Map<String, Users> json) {
  //   return Users(
  //     id:json['id']! as String,
  //     code: json['code'] as String,
  //     codeDefaultMarket:json['codeDefaultMarket'] as String,
  //     codeClient:json['codeClient'] as String,
  //     codeDealer:json['codeDealer'] as String,
  //     codeTeamWorkers:json['codeTeamWorkers'] as String,
  //     codeSuppliers:json['codeSuppliers'] as String,
  //     name:json['name'] as String,
  //     email:json['email'] as String,
  //     password:json['password'] as String,
  //     phone:json['phone'] as String,
  //     office:json['office'] as String,
  //     officeAddress:json['officeAddress'] as String,
  //     officeCity:json['officeCity'] as String,
  //     officePhoneMobile:json['officePhoneMobile'] as String,
  //     officePhoneFix:json['officePhoneFix'] as String,
  //     officeEmail:json['officeEmail'] as String,
  //     officeFax:json['officeFax'] as String,
  //     notes:json['notes'] as String,
  //     aboutMeDescription: json['aboutMeDescription'] as String,
  //     image:json['image'] as String,
  //     flagUri:json['flagUri'] as String,
  //     //  dateCreation:json['dateCreation'] as DateTime,
  //     // dateModified:json['dateModified'] as DateTime,
  //     // dateLastAccess:json['dateLastAccess'] as DateTime,
  //     dateCreation: DateTime.parse(json["dateCreation"] as String),
  //     dateModified: DateTime.parse(json["dateModified"] as String),
  //     dateLastAccess: DateTime.parse(json["dateLastAccess"] as String),
  //     isEnabled:json['isEnabled'] as bool,
  //     isEnabledMarket:json['isEnabledMarket'] as bool,
  //     isFavorite:json['isFavorite'] as bool,
  //     isShowMarket:json['isShowMarket'] as bool,
  //     isMarketDefault:json['isMarketDefault'] as bool   ,
  //     isNotification:json['isNotification'] as bool,
  //     market: json[''] as Market,
  //     markets :json['markets'] as List<Market>,
  //     language:json['language'] as Language,
  //     languages :json['languages'] as List<Language> ,
  //     //    additionalSignupData: json["additionalSignupData"] as Map<String, String> ,
  //     termsOfService: json["termsOfService"] as  List<TermOfServiceResult>,
  //     userDataJson: json["userdataJson"] as String,
  //   );
  // }

  // List listFilesUsers = [
  //   Users(
  //     image: "assets/icons/xd_file.svg",
  //     name: "Matar Faye",
  //     email: "01-03-2021",
  //     phone: "3.5mb",
  //   ),
  //   Users(
  //     image: "assets/icons/Figma_file.svg",
  //     name: "Modou Ndiaye",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient: "19.0mb",
  //   ),
  //   Users(
  //     image: "assets/icons/doc_file.svg",
  //     name: "Document",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient: "32.5mb",
  //   ),
  //   Users(
  //     image: "assets/icons/sound_file.svg",
  //     name: "Sound File",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient: "3.5mb",
  //   ),
  //   Users(
  //     image: "assets/icons/media_file.svg",
  //     name: "Media File",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient: "2.5gb",
  //   ),
  //   Users(
  //     image: "assets/icons/pdf_file.svg",
  //     name: "Sales PDF",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient:  "3.5mb",
  //   ),
  //   Users(
  //     image: "assets/icons/excel_file.svg",
  //     name: "Excel File",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient:  "34.5mb",
  //   ),
  //
  //   Users(
  //     image: "assets/icons/excel_file.svg",
  //     name: "Excel File",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient:  "35.5mb",
  //   ),
  //   Users(
  //     image: "assets/icons/excel_file.svg",
  //     name: "Modou Fall",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient:  "90.5mb",
  //   ),
  //   Users(
  //     image: "assets/icons/excel_file.svg",
  //     name: "Ablaye Seck",
  //     dateCreation: "27-02-2021" as DateTime,
  //     codeClient:  "90.5mb",
  //   ),
  //   // RecentFile(
  //   //   image: "assets/icons/excel_file.svg",
  //   //   name: "Excel File",
  //   //   date: "25-02-2021",
  //   //   size: "37.5mb",
  //   // ),
  // ];


  // Map<String, dynamic> toJsonUserData() {
  //   final Map<String, dynamic> user = <String, dynamic>{};
  //
  //   user["id"] = id;
  //   user["name"] = name;
  //   user["password"] = password;
  //   user["about"] = aboutMeDescription;
  //   user["phone"] = phone;
  //   user["imagePath"] = image;
  //   user["termsOfService"] = termsOfService;
  //   user["additionalSignupData"] = additionalSignupData;
  //   return user;
  // }
  //


  /// Map TO => JSON
  // Map<String, dynamic> toJsonMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //     'about': aboutMeDescription,
  //     'phone': phone,
  //     'imagePath': image,
  //     'termsOfService': termsOfService,
  //     'additionalSignupData': additionalSignupData,
  //   };
  // }

  // Users.fromSignupForm({
  //   required this.name,
  //   required this.password,
  //   this.additionalSignupData,
  //   this.termsOfService = const [],
  // });
  //
  // Users.fromProvider({
  //   required this.additionalSignupData,
  //   this.termsOfService = const [],
  // })  : name = null,
  //       password = null;

//https://suragch.medium.com/parsing-simple-json-in-flutter-83ee1809a6ab
//JSON → object
// String rawJson = '{"name":"Mary","age":30}';
//
// Map<String, dynamic> map = jsonDecode(rawJson);
// String name = map['name'];
// int age = map['age'];
// Person person = Person(name, age);

// Object → JSON
// We will use jsonEncode(), but it only accepts a number, boolean, string, null, list or a map with string keys. So we have to convert our object to a map first.
//
// Person person = Person('Mary', 30);
// Map<String, dynamic> map = {
//   'name': person.name,
//   'age': person.age
// };
// String rawJson = jsonEncode(map);
}

List listFilesUsers = [
  Users(
    image: "assets/icons/xd_file.svg",
    name: "Matar Faye",
    code: "09938",
    email: "matar@gmail.com",
    phone: "78748874",
    codeClient: "ABSGT",
    codeDealer:"224898" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Italy", code: "+39"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),

  Users(
    image: "assets/icons/Figma_file.svg",
    name: "Modou Ndiaye",
    code: "ABDGT",
    email: "Modou@hotmail.com",
    phone: "78455757869",
    codeClient: "01012",
    codeDealer:"23858" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Germany", code: "+49"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),

  Users(
    image: "assets/icons/xd_file.svg",
    name: "Abdou Gaye",
    code: "5557",
    email: "abdou@gmail.com",
    phone: "78748874",
    codeClient: "ABSGT",
    codeDealer:"66885" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Italy", code: "+39"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),


  Users(
    image: "assets/icons/xd_file.svg",
    name: "Laye Ndiaye",
    code: "599944",
    email: "laye@gmail.com",
    phone: "859999",
    codeClient: "ABSGT",
    codeDealer:"5899" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Italy", code: "+39"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),

  Users(
    image: "assets/icons/xd_file.svg",
    name: "Daouda Diop",
    code: "556666",
    email: "Doudou@gmail.com",
    phone: "78748874",
    codeClient: "ABSGT",
    codeDealer:"22588" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Italy", code: "+39"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),

  Users(
    image: "assets/icons/xd_file.svg",
    name: "Moussa Faye",
    code: "87556",
    email: "moussa@gmail.com",
    phone: "78748874",
    codeClient: "ABSGT",
    codeDealer:"33888" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Italy", code: "+39"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),
  Users(
    image: "assets/icons/xd_file.svg",
    name: "Laye Mbacke",
    code: "452256",
    email: "laye.mbacke@gmail.com",
    phone: "857573663",
    codeClient: "ARRSGW",
    codeDealer:"77464" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Italy", code: "+39"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),

  Users(
    image: "assets/icons/xd_file.svg",
    name: "samba Diop",
    code: "22588",
    email: "samba@gmail.com",
    phone: "78748874",
    codeClient: "ABSGT",
    codeDealer:"93847" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Italy", code: "+39"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),

  Users(
    image: "assets/icons/xd_file.svg",
    name: "Mor Faye",
    code: "3335",
    email: "mor@gmail.com",
    phone: "78748874",
    codeClient: "ABSGT",
    codeDealer:"95588" ,
    codeTeamWorkers: "",
    codeSuppliers:"" ,
    market: Market(name: "Italy", code: "+39"),
    dateCreation: DateTime.parse('2024-02-12 20:18:04'),
  ),
];
