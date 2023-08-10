

import 'dart:convert';

import 'package:ecobioweb/users/models/users_data.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
//import 'package:logger/logger.dart';
import 'package:logging_manager/logging_manager.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SessionUser extends SessionManager{
//  protected static Logger logger = LoggerFactory.getLogger(SessionUser.class);
  final loggingManager = LoggingManager(logger: Logger('SessionUser'));
  //final logger = Logger('SessionUser');

  late UserData userData;

  Map<String, dynamic> toJson= {};

  final Map _session = {};


Map<String, dynamic> getJsonMapUserData(){
  return userData.toJsonMap();
}


  Future _accessSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future get(key) async {
    await _accessSharedPreferences();
    try {
      return json.decode(prefs!.get(key) as String);
    } catch (e) {

      return prefs!.get(key);
    }
  }


  @override
  Future destroy() async {
    await _accessSharedPreferences();
    try {
      await prefs!.clear();
    } catch (e) {
      throw Exception(
          "It wasn't possible to destroy the session. This can be triggered if the session no longer exists or if the session is inaccessible. ");
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    await _accessSharedPreferences();
    try {
      return prefs!.containsKey(key);
    } catch (e) {
      throw Exception(
          "It wasn't possible to look for this key in the session. This can be triggered if the session no longer exists or if the key is not correct. ");
    }
  }

  @override
  Future update() async {
    await _accessSharedPreferences();
    try {
      await prefs!.reload();
    } catch (e) {
      throw Exception("It wasn't possible to reload and update the session.");
    }
  }

  @override
  Future set(key, value) async {
    await _accessSharedPreferences();
    try {
      // Detect item type
      switch (value.runtimeType) {
      // String
        case String:
          {
            prefs!.setString(key, value);
          }
          break;

      // Int
        case int:
          {
            prefs!.setInt(key, value);
          }
          break;

      // Bool
        case bool:
          {
            prefs!.setBool(key, value);
          }
          break;

      // Double
        case double:
          {
            prefs!.setDouble(key, value);
          }
          break;

      // List<String>
        case List:
          {
            prefs!.setStringList(key, value);
          }
          break;

      // Object ()
        default:
          {
            prefs!.setString(key, jsonEncode(value.toJson()));
          }
      }
    } catch (e) {
      throw Exception("Key or value are not the correct type.");
    }

    // Add data to session wrapper
    _session.putIfAbsent(key, () => value);
  }

}