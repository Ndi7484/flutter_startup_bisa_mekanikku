import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/menu_provider.dart';
import 'package:provider/provider.dart';

class AllMenuAppbar extends StatefulWidget implements PreferredSizeWidget {
  AllMenuAppbar({super.key});

  @override
  State<AllMenuAppbar> createState() => _AllMenuAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AllMenuAppbarState extends State<AllMenuAppbar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provMenu = Provider.of<MenuProvider>(context);

    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.05,
      title: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            labelText: 'Search Menu',
            fillColor: Colors.white,
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            setState(() {
              _searchController.text = value;
              provMenu.error = '';
            });
          },
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            provMenu.loadApiMenu(_searchController.text.toString());
          },
          child: const Icon(Icons.search),
        ),
      ],
    );
  }
}
