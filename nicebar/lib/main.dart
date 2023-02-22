import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nicebar/app.dart';
import 'package:nicebar/common/functions.dart';
import 'package:nicebar/provider/cart_provider.dart';
import 'package:nicebar/provider/record_provider.dart';
import 'package:nicebar/provider/theme_provider.dart';
import 'package:nicebar/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
late ProductProvider productProvider;
late ThemeProvider themeProvider;
late CartProvider cartProvider;
late RecordProvider recordProvider;
late SharedPreferences pref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => RecordProvider()),
      ],
      child: const App(),
    ),
  );
}

initialize() async {
  pref = await SharedPreferences.getInstance();
}
