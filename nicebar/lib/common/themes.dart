import 'package:flutter/material.dart';
import 'package:nicebar/common/colors.dart';
import 'package:nicebar/main.dart';

class NiceBarThemes {
  // Nice Bar Light Theme
  static ThemeData light = ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: mainColor),
      primaryColor: mainColor,
      textTheme: ThemeData.light().textTheme.apply(displayColor: textColor, bodyColor: textColor),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(elevation: 1, backgroundColor: appBarColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: bottomBarColor,
      ));
  // Nice Bar Dark Theme
  static ThemeData dark = ThemeData.dark().copyWith();

//

}
