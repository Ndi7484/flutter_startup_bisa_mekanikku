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
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6 - 12,
                  child: Text(
                    "${result.name.title}. ${result.name.first} ${result.name.last}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Text(
                  result.email,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6 - 12,
                  child: Text(
                    "${result.location.street.name}, ${result.location.street.number}, ${result.location.city}",
                    style: TextStyle(color: Colors.grey[700], fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "phone : ${result.phone}",
                  style: TextStyle(color: Colors.grey[700], fontSize: 11),
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
