import 'package:flutter/material.dart';
import 'package:nicebar/common/functions.dart';
import 'package:nicebar/common/themes.dart';
import 'package:nicebar/main.dart';
import 'package:nicebar/provider/cart_provider.dart';
import 'package:nicebar/provider/product_provider.dart';
import 'package:nicebar/provider/record_provider.dart';
import 'package:nicebar/provider/theme_provider.dart';
import 'package:nicebar/screen/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    cartProvider = Provider.of<CartProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    recordProvider = Provider.of<RecordProvider>(context);

    setSystemUIOverlay();

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, oldWidget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.isDarkTheme ? NiceBarThemes.dark : NiceBarThemes.light,
        routes: {
          "/": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
