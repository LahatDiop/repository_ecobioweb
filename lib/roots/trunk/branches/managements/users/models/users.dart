class Users {
  String name;
  String email;
  String password;
  String phone;
  String aboutMeDescription;
  String image;

  // Constructor
  Users({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.aboutMeDescription,
    required this.image,
  });

  Users copy({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? about,
    String? imagePath,
  }) =>
      Users(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        aboutMeDescription: about ?? aboutMeDescription,
        image: imagePath ?? image,
      );

  static Users fromJson(Map<String, dynamic> json) => Users(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        aboutMeDescription: json['about'],
        image: json['imagePath'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'about': aboutMeDescription,
        'phone': phone,
        'imagePath': image,
      };
}
