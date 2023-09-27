import 'package:flutter/material.dart';

class My_Provider extends ChangeNotifier {
  String currentLocale = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeLocale(String newLocale) {
    if (newLocale == currentLocale) return;
    currentLocale = newLocale;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
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
}
