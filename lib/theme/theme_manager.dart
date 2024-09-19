import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode){
    _themeMode = mode;
    notifyListeners();
  }

  void setLightMode() {
    themeMode = ThemeMode.light;
  }

  void setDarkMode() {
    themeMode = ThemeMode.dark;
  }
}