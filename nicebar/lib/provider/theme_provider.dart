import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkTheme = false;

  void switchTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
