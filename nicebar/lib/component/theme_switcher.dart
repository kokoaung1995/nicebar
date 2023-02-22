import 'package:flutter/material.dart';
import 'package:nicebar/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProviderListener, oldWidget) => Switch(
        value: themeProviderListener.isDarkTheme,
        onChanged: (value) {
          themeProviderListener.switchTheme();
        },
      ),
    );
  }
}
