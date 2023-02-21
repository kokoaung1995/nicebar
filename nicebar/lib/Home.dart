import 'package:flutter/material.dart';

import 'Cartview.dart';
import 'Category_list.dart';
import 'History.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int currentIndex = 0;
  final screen = [const CategoryList(), const Cartview(), const History()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 133, 245, 6),
            backgroundColor: Colors.pink,
            unselectedItemColor: Colors.black,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.table_view), label: "HOME"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.print_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_system_daydream),
                label: 'History',
              )
            ]));
  }
}
