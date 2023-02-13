import 'package:flutter/cupertino.dart';
import 'package:onlineshop/locator/globallocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final SharedPreferences _sharedPref = locator.get();
  static final ValueNotifier<String?> _authNotif = ValueNotifier(null);
  static void saveToken(String token) {
    if (token.isNotEmpty) {
      _sharedPref.setString('token', token);
      _authNotif.value=token;
      
    }

  }

  static String readToken() {
    return _sharedPref.getString('token') ?? '';
  }

  static void clearToken() {
    _sharedPref.clear();
    _authNotif.value=null;
  }
}
