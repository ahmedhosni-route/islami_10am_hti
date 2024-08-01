import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  changeTheme(ThemeMode themeMode){
    this.themeMode = themeMode;
    notifyListeners();
  }
}