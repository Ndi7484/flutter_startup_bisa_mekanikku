import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/models/random_user_state.dart';
import 'package:flutter_mekanikku/providers/bookmark_provider.dart';
import 'package:provider/provider.dart';

class MechanicCard extends StatelessWidget {
  Result result;
  bool bookmark_page;
  MechanicCard({
    Key? key,
    required this.result,
    required this.bookmark_page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provBook = Provider.of<BookmarkProvider>(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(result.picture.medium),
            const SizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${result.name.title}. ${result.name.first} ${result.name.last}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  result.email,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                if (bookmark_page) {
                  provBook.removeBookmark(result);
                } else {
                  if (provBook.savedPerson.contains(result)) {
                    provBook.removeBookmark(result);
                  } else {
                    provBook.savedBookmark(result);
                  }
                }
              },
              icon: (provBook.savedPerson.contains(result))
                  ? const Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.star_border_outlined,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
