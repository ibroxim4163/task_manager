import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPreferencesStorage {
  static late final SharedPreferences preferences;

  final String selectedLanguageKey = "language";
  final String password = "password";

  static Future<void> dbInit() async {
    preferences = await SharedPreferences.getInstance();
  }

  void setLanguageIndex(int languageIndex) async {
    await preferences.setInt(selectedLanguageKey, languageIndex);
  }

  int getLanguageIndex() {
    return preferences.getInt(selectedLanguageKey) ?? 0;
  }

  Future<void> setPassword(String newPassword) async {
     await preferences.setString(password, newPassword);
    
  }

  String? getPassword() {
    return preferences.getString(password);
  }

  Future<bool> deletePassword() {
    return preferences.remove(password);
  }
}
