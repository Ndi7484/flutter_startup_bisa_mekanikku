import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/models/random_user_state.dart';

class MechanicCard extends StatelessWidget {
  Result result;
  MechanicCard({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_border_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
