import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'category_page.dart';
import 'history_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screena = [const CategoryPage(), const CartPage(), const HistoryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screena[currentIndex],
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.3)))),
          child: BottomNavigationBar(
            elevation: 1,
            currentIndex: currentIndex,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.table_view), label: "HOME"),
              BottomNavigationBarItem(icon: Icon(Icons.print_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_system_daydream),
                label: 'History',
              )
            ],
          ),
        ));
  }
}
