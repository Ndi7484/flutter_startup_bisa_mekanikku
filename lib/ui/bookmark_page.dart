import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/bookmark_provider.dart';
import 'package:flutter_mekanikku/ui/widgets/mechanic_card.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provBook = Provider.of<BookmarkProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark Saved'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            if (provBook.savedPerson.isEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            if (provBook.savedPerson.isEmpty)
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.star_border,size: 30,),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Try Adding more bookmarks..')
                  ],
                ),
              ),
            ...List.generate(
              provBook.savedPerson.length,
              (index) => MechanicCard(
                result: provBook.savedPerson[index],
                bookmark_page: true,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
