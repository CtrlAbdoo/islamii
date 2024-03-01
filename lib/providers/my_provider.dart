import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class My_Provider extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  String currentLocale = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeLocale(String newLocale) {
    if (newLocale == currentLocale) return;
    currentLocale = newLocale;
    notifyListeners();
    saveLocale(newLocale);
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
    saveTheme(newTheme);
  }

  String getBackground() {
    if (currentTheme == ThemeMode.light) {
      return 'assets/images/bg3.jpg';
    } else {
      return 'assets/images/bg.jpg';
    }
  }

  bool isDarkEnabled() {
    return currentTheme == ThemeMode.dark;
  }

  bool isEnglishEnabled() {
    return currentLocale == 'en';
  }

  Future<void>saveTheme(ThemeMode newTheme)async{
    String newThemeData = newTheme==ThemeMode.dark?
    'dark':'light';
    await sharedPreferences!.setString('theme', newThemeData);
  }
  String? getTheme(){
    return sharedPreferences?.getString('theme');
  }

  Future<void> loadThemeMode()async{
    sharedPreferences = await SharedPreferences.getInstance();
    String? oldTheme = getTheme();
    if(oldTheme!=null){
      currentTheme = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> saveLocale(String newLocale) async {
    String newLocaleData = newLocale == 'en' ? 'en' : 'ar';
    await sharedPreferences!.setString('Locale', newLocaleData);
  }

  String? getLocale(){
    return sharedPreferences?.getString('Locale');
  }
  Future<void> loadLocale() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? oldLocale = await getLocale();
    if (oldLocale != null) {
      currentLocale = oldLocale == 'en' ? 'en' : 'ar';
    }
  }
}
