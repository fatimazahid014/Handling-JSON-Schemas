import 'package:shared_preferences/shared_preferences.dart';

import '';

class ProfileRepository {
  static Future<void> removeFlag() async {
    final pref = await SharedPreferences.getInstance();

    pref.setBool("isLoggedIn", false);
  }
}
