import 'package:flutter/material.dart';
import 'package:onlineshop/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final SharedPreferences _sharedPref = locator.get();
  static final ValueNotifier<String?> tokenNotifications = ValueNotifier(null);

  //save user token
  static void putToken(String token) {
    _sharedPref.setString(
      'access_token',
      token,
    );
    tokenNotifications.value = token;
  }

  //read user token
  static void getToken() {
    _sharedPref.getString('access_token');
  }

  //remove user token
  static void deleteToken() {
    _sharedPref.clear();
    tokenNotifications.value = null;
  }
}
