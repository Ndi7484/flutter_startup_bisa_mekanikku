import 'package:flutter/material.dart';

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
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height*0.05,
      title:  Container(
        decoration: BoxDecoration(color: Colors.white),
        child: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            labelText: 'Search Menu',
            fillColor: Colors.white,
            border: OutlineInputBorder(),
          ),
          onChanged: (value){
            setState(() {
              _searchController.text = value;
            });
          },
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: const Icon(Icons.search),
        ),
      ],
    );
  }
}
