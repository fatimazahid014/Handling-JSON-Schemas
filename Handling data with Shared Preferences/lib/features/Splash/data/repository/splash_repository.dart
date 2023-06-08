import 'package:shared_preferences/shared_preferences.dart';

import '';

class SplashRepository {
  static Future<bool> checkFlag() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getBool("isLoggedIn") ?? false;
  }
}
