import 'package:shared_preferences/shared_preferences.dart';

import '';

class LoginRepository {
  static Future<void> setFlag(bool isRemember) async {
    final pref = await SharedPreferences.getInstance();

    pref.setBool("isLoggedIn", isRemember);
  }
}
