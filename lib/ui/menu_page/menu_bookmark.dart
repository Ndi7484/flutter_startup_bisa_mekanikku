import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/menu_provider.dart';
import 'package:flutter_mekanikku/ui/menu_page/widget/menu_card.dart';
import 'package:provider/provider.dart';

class MenuBookmark extends StatelessWidget {
  const MenuBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    final provMenu = Provider.of<MenuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Saved'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            provMenu.savedMenu.length,
            (index) => MenuCard(foodMenu: provMenu.savedMenu[index]),
          ),
        ),
      ),
    );
  }
}
