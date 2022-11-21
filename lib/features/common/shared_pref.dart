import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  String theme = "theme";

  readObject(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key!)!);
  }

  saveObject(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<String> readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  readInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getInt(key);
  }

  saveInt(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<bool> containKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
