



import '../../settings/auth/models/term_of_service.dart';

class UserData {
  String? id;
  String? name;
  String? email;
  String ?password;
  String ? phone;
  String ? aboutMeDescription;
  String ? image;
  List<TermOfServiceResult>  termsOfService;
   Map<String, String>? additionalSignupData;

  // Constructor
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.aboutMeDescription,
    required this.image,
    this.additionalSignupData,
    this.termsOfService = const [],
  });

  UserData copy({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? password,
    String? about,
    String? imagePath,
    List<TermOfServiceResult>? termsOfService,
    Map<String, String>? additionalSignupData,
  }) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        aboutMeDescription: about ?? aboutMeDescription,
        phone: phone ?? this.phone,
        image: imagePath ?? image,
        termsOfService: termsOfService ?? this.termsOfService,
        additionalSignupData: additionalSignupData ?? this.additionalSignupData,
      );

  /// OBJECT TO => JS
  static UserData fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        aboutMeDescription: json['about'],
        image: json['imagePath'],
        termsOfService: json['termsOfService'],
        additionalSignupData: json['additionalSignupData'],
      );

  Map<String, dynamic> toJsonTermsOfService() {
    return {
      'termsOfService': termsOfService,

    };
  }
  factory UserData.fromJsonMap(Map<String, dynamic> json) {
    return UserData(
      id: json['id']! as String,
      name: json["name"]! as String,
      email: json["email"] as String,
      password: json["password"] as String,
      phone: json["phone"] as String,
      aboutMeDescription: json["aboutMeDescription"] as String,
      image: json["image"] as String,
      additionalSignupData: json["additionalSignupData"] as Map<String, String> ,
      termsOfService: json["termsOfService"] as  List<TermOfServiceResult>,
    );
  }
  /// Map TO => JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'about': aboutMeDescription,
        'phone': phone,
        'imagePath': image,
        'termsOfService': termsOfService,
        'additionalSignupData': additionalSignupData,
      };


  Map<String, dynamic> toJsonUserData() {
    final Map<String, dynamic> userData = <String, dynamic>{};

    userData["id"] = id;
    userData["name"] = name;
    userData["password"] = password;
    userData["about"] = aboutMeDescription;
    userData["phone"] = phone;
    userData["imagePath"] = image;
    userData["termsOfService"] = termsOfService;
    userData["additionalSignupData"] = additionalSignupData;
    return userData;
  }



  /// Map TO => JSON
  Map<String, dynamic> toJsonMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'about': aboutMeDescription,
      'phone': phone,
      'imagePath': image,
      'termsOfService': termsOfService,
      'additionalSignupData': additionalSignupData,
    };
  }

  UserData.fromSignupForm({
    required this.name,
    required this.password,
    this.additionalSignupData,
    this.termsOfService = const [],
  });

  UserData.fromProvider({
    required this.additionalSignupData,
    this.termsOfService = const [],
  })  : name = null,
        password = null;

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
