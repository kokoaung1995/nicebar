import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nicebar/Category_list.dart';
import 'package:nicebar/cart/cartproduct.dart';
import 'package:nicebar/darkmoodtheme/darkmood.dart';
import 'package:provider/provider.dart';

import 'Home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => Cart())
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().theme,
      routes: {"/": (context) => HomeNav()},
    );
  }
}
