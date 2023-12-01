import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/menu_provider.dart';
import 'package:flutter_mekanikku/ui/menu_page/widget/menu_card.dart';
import 'package:provider/provider.dart';

class AllMenuPage extends StatefulWidget {
  const AllMenuPage({super.key});

  @override
  State<AllMenuPage> createState() => _AllMenuPageState();
}

class _AllMenuPageState extends State<AllMenuPage> {
  @override
  Widget build(BuildContext context) {
    final provMenu = Provider.of<MenuProvider>(context);
    // ignore: unused_local_variable
    var _saved = provMenu.savedMenu;

    return SingleChildScrollView(
      child: Column(children: [
        if (provMenu.error != '')
          const SizedBox(
            height: 8,
          ),
        if (provMenu.error != '')
          Text(
            provMenu.error,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (provMenu.error != '')
          const SizedBox(
            height: 16,
          ),
        ...List.generate((provMenu.jsonResultFood ?? []).length, (index) {
          return MenuCard(foodMenu: provMenu.jsonResultFood![index]);
        }),
      ]),
    );
  }
}
