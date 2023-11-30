import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/ui/main_page/main_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _selectedIndex = widget
  //       .selectNext; // Assign the value from widget.selectNext to _selectedIndex
  // }

  final List<String> _appBarContent = [
    'Main',
    'Menu',
    'DRS News',
  ];
  final List<dynamic> _bodyFill = [
    const MainPage(),
    // const MenuPage(),
    // const PointsPage(),
    // const PromoPage(),
    // const OrdersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyFill[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_dining_rounded), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), label: 'Playing News'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: (index) {
          _selectedIndex = index;
        },
      ),
    );
  }
}
