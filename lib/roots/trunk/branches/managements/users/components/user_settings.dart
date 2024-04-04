import 'dart:convert';
import 'users.dart';
import 'users_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataSettings {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static UserData myUser = UserData(
    ///image:"https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
    id:'1',
    name: 'Lahat Diop',
    email: 'bio@gmail.com',
    password: '123',
    phone: '(+39)348527169',
    aboutMeDescription: 'Description User ...',
    image: 'assets/images/ic_add_cart.png',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(UserData userData) async {
    final json = jsonEncode(userData.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static UserData getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : UserData.fromJson(jsonDecode(json));
  }

    Map<String, String> mockUsers = {
    'lahat@gmail.com': '123',
    'mo@gmail.com': '123',
    'sam@gmail.com': '333',
    'near.huscarl@gmail.com': 'subscribe to pewdiepie',
    '@.com': '.',
  };

  static Users myUsers = Users(
    ///image:"https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
    id: '',
    name: 'Lahat Diop',
    email: 'bio@gmail.com',
    password: '123',
    phone: '(+39)348527169',
    aboutMeDescription: 'Description User ...',
    image: 'assets/images/ic_add_cart.png',
  );

  // const users =  {
  //   'lahat@gmail.com': '123',
  //   'mo@gmail.com': '111',
  // };


}
