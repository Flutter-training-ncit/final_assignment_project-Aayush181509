import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const Has_Logged_In_Key = 'has user logged in';

  //To set the value if the user has logged in the app
  static setUserHasLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Has_Logged_In_Key, value);
  }

  //To get the value if user has logged in
  static Future<bool> getUserHasLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(Has_Logged_In_Key);

    if (value != null && value == true) {
      return true;
    } else {
      return false;
    }
  }
}
