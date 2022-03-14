import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static set saveemail(String email) {
    _prefs.setString("email", email);
  }

  static String? getEmail() {
    return _prefs.getString("email");
  }

  static void removeEmail() {
    _prefs.remove("email");
  }
}
