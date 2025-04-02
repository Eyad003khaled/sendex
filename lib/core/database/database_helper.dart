import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // Save user login details
  static Future<void> saveUserLoginInfo(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password); // You may choose to store just email or token instead
  }

  // Get saved email
  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  // Get saved password
  static Future<String?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  // Clear saved login details
  static Future<void> clearLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
  }
}
