import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/ui/blog_news_page/blog_page.dart';
import 'package:flutter_mekanikku/ui/main_page/main_page_appbar.dart';
import 'package:flutter_mekanikku/ui/main_page/main_page_body.dart';
import 'package:flutter_mekanikku/ui/menu_page/all_menu_appbar.dart';
import 'package:flutter_mekanikku/ui/menu_page/all_menu_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  ScrollController scrollControllerMainPage = ScrollController();
  double offsetMainPage = 0.0;
  int _selectedIndex = 0;
  // bool dark_mode = true;

  @override
  void initState() {
    super.initState();
    scrollControllerMainPage.addListener(_scrollListener);
  }

  // Define a method to handle scroll events
  void _scrollListener() {
    setState(() {
      offsetMainPage = scrollControllerMainPage.offset;
    });
  }

  PreferredSizeWidget? _appBarFunc() {
    if (_selectedIndex == 0) {
      return MainPageAppbar(
        offset: offsetMainPage,
      );
    } else if (_selectedIndex == 1) {
      return AllMenuAppbar();
    } else if (_selectedIndex == 2) {
      return AppBar(
        title: const Text('DRS Update'),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBarFunc(),
      body: switch (_selectedIndex) {
        0 => MainPageBody(
            offset: offsetMainPage,
            scrollController: scrollControllerMainPage,
          ),
        1 => const AllMenuPage(),
        2 => const BlogPage(),
        // TODO: Handle this case.
        int() => null,
      },
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
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
