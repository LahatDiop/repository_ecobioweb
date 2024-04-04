import '../../../../../../market/components/market.dart';
import '../../../menu/menu_settings/settings/auth/models/term_of_service.dart';
import '../../users/components/users.dart';

class Role {
  String? id;
  String? name;
  String? description;
  String ? notes;
  String ? image;
  bool isVisible =false;
  bool isSelected =false;
  List<Users> users;
  List<Market> markets;
  List<TermOfServiceResult>  termsOfService;

  /// MAP ROLES
  final Map<String, Role> _rolesItems={};

  Map<String, Role> get rolesItems{
    return{..._rolesItems};
  }

  /// LIST ROLES
   final List<Role> _roles=[];

  List<Role> get getRoles{
    return _roles;
  }

  Set<Role> get setRoles{
    return{..._roles};
  }


  // Constructor
  Role({
     this.id,
    required this.name,
    required this.description,
    required this.isVisible,
    required this.notes,
    required this.image,
    this.isSelected=false,
    this.users= const [],
    this.markets= const [],
    this.termsOfService = const [],

  });

  Role copy({
    String? id,
    String? name,
    String? description,

    String? notes,
    String? image,
    bool isSelected=false,
    bool isVisible=false,
    List<Users> users= const [],
    List<Market> markets=const[],
    List<TermOfServiceResult>? termsOfService=const [],

  }) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        notes:notes?? this.notes,
        image:image ?? this.image,
        isVisible:isVisible,
        isSelected: isSelected,
        users: users,
        markets: markets,
        termsOfService: termsOfService ?? this.termsOfService,
      );

  /// OBJECT TO => JS
  static Role fromJson(Map<String, dynamic> json) => Role(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    notes: json['notes'],
    image: json['image'],
    isVisible: json['isVisible'],
    isSelected: json['isSelected'],
    users: json['users'],
    markets: json['markets'],
    termsOfService: json['termsOfService'],
  );

  Map<String, dynamic> toJsonUsers(){
    return {'users':users};
  }

  Map<String, dynamic> toJsonMarket(){
    return {'market':markets};
  }

  Map<String, dynamic> toJsonTermsOfService() {
    return {
      'termsOfService': termsOfService,

    };
  }



  factory Role.fromJsonMap(Map<String, dynamic> json) {
    return Role(
      id: json['id']! as String,
      name: json["name"]! as String,
      description: json["description"] as String,
      notes: json["notes"] as String,
      image: json["image"] as String,
      isVisible: json['isVisible'],
      isSelected: json['isSelected'],
      users: json['users'] as List<Users>,
      markets: json['markets'] as List<Market>,
      termsOfService: json["termsOfService"] as  List<TermOfServiceResult>,
    );
  }
  /// Map TO => JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'notes': notes,
    'image': image,
    'isVisible': isVisible,
    'isSelected':isSelected,
    'users': users,
    'market':markets,
    'termsOfService': termsOfService,

  };
  /// Map TO => JSON
  Map<String, dynamic> toJsonMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'notes': notes,
      'image': image,
      'isVisible': isVisible,
      'isSelected':isSelected,
      'users': users,
      'market':markets,
      'termsOfService': termsOfService,
    };
  }

  Map<String, dynamic> toJsonUserData() {
    final Map<String, dynamic> Role = <String, dynamic>{};

    Role["id"] = id;
    Role["name"] = name;
    Role["description"]=description;
    Role["notes"] = notes;
    Role["image"] = image;
    Role["isSelected"]=isSelected;
    Role["isVisible"] = isVisible;
    Role["users"] = users;
    Role["markets"] = markets;
    Role["termsOfService"] = termsOfService;

    return Role;
  }





  // Role.fromSignupForm({
  //   required this.name,
  //   required this.isVisible,
  //   this.additionalSignupData,
  //   this.termsOfService = const [],
  // });
  //
  // Role.fromProvider({
  //   required this.additionalSignupData,
  //   this.termsOfService = const [],
  // })  : name = null,
  //       isVisible = null;

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
