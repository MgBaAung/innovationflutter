import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static SharedPreferences? _sharedPreferences;

  AppStorage() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    debugPrint('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setToken(String key,String value) {
    return _sharedPreferences!.setString(key, value);
  }

  String getToken(String key) {
    try {
      return _sharedPreferences!.getString(key)!;
    } catch (e) {
      return '';
    }
  }
}
