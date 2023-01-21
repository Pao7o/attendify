import 'dart:convert';

import 'package:attendify/features/firebase/models/app_user_model.dart';
import 'package:attendify/utils/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  String theme = "theme";

  Future<Map<String, dynamic>> readObject(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(key!)!);
  }

  Future setCurrentUser(AppUser user) async {
    final prefs = await SharedPreferences.getInstance();

    var userMap = user.toJson();

    prefs.setString(SHARED_PREFS_APP_USER_KEY, jsonEncode(userMap));
  }

  Future<AppUser> readCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();

    String appUserPref = prefs.getString(SHARED_PREFS_APP_USER_KEY) ?? '';
    return AppUser.fromJson(jsonDecode(appUserPref));
  }

  Future saveObject(String key, value) async {
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

final sharedprefProvider = Provider(((ref) {
  return SharedPref();
}));
