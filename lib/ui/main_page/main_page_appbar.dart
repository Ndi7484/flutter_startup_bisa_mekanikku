import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/auth_provider.dart';
import 'package:flutter_mekanikku/providers/bookmark_provider.dart';
import 'package:flutter_mekanikku/providers/ui_settings_provider.dart';
import 'package:flutter_mekanikku/ui/bookmark_page.dart';
import 'package:flutter_mekanikku/ui/profile_page.dart';
import 'package:provider/provider.dart';

class MainPageAppbar extends StatefulWidget implements PreferredSizeWidget {
  double offset;
  MainPageAppbar({super.key, required this.offset});

  @override
  State<MainPageAppbar> createState() => _MainPageAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainPageAppbarState extends State<MainPageAppbar> {
  @override
  Widget build(BuildContext context) {
    final provUi = Provider.of<UiSettingsProvider>(context);
    final provBook = Provider.of<BookmarkProvider>(context);
    final authProv = Provider.of<AuthProvider>(context);

    return AppBar(
      elevation: (widget.offset > 10) ? 7 : 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Location',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
            FutureBuilder(
              future: provUi.getLocation(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return DropdownButton(
                    value: provUi.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        provUi.selectedValue = value;
                      });
                    },
                    dropdownColor:
                        (widget.offset > 10) ? Colors.white : Colors.black,
                    style: TextStyle(
                        color:
                            (widget.offset > 10) ? Colors.black : Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    items: List.generate(
                      snapshot.data.length,
                      (index) => DropdownMenuItem(
                        value: snapshot.data[index].name,
                        child: Text(
                          snapshot.data[index].name,
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: (widget.offset > 10) ? Colors.grey : Colors.white,
                    ),
                    iconSize: 30,
                    // underline: const SizedBox(),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookmarkPage()),
            );
          },
          child: Icon(
            (provBook.savedPerson.isNotEmpty) ? Icons.star : Icons.star_border,
            color: (widget.offset > 10)
                ? (provBook.savedPerson.isNotEmpty)
                    ? Colors.amber
                    : Colors.black
                : (provBook.savedPerson.isNotEmpty)
                    ? Colors.amber
                    : Colors.grey,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          child: CircleAvatar(
            child: (authProv.loggedinUser != null)
                ? Text(authProv.loggedinUser!.name.substring(0, 2))
                : const Icon(Icons.person),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
      // backgroundColor: (widget.offset > 10) ? Colors.white : Colors.transparent,
      backgroundColor: ColorTween(begin: Colors.transparent, end: Colors.white)
          .lerp(widget.offset / 100),
    );
  }
}
