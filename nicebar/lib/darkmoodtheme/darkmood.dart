import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;
  ThemeData _defaultTheme =
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.lightGreen);

  ThemeData get theme => _defaultTheme;
  bool get isDarkTheme => _isDarkTheme;

  void setDarkTheme() {
    _isDarkTheme = true;
    _defaultTheme =
        ThemeData(brightness: Brightness.dark, primarySwatch: Colors.amber);
    notifyListeners();
  }

  void setLightTheme() {
    _isDarkTheme = false;
    _defaultTheme = ThemeData(
        brightness: Brightness.light, primarySwatch: Colors.lightGreen);
    notifyListeners();
  }
}
