import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/models/menu_model.dart';
import 'package:flutter_mekanikku/providers/menu_provider.dart';
import 'package:flutter_mekanikku/ui/menu_page/menu_detail.dart';
import 'package:provider/provider.dart';

class MenuCard extends StatelessWidget {
  FoodMenu foodMenu;
  MenuCard({Key? key, required this.foodMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provMenu = Provider.of<MenuProvider>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Card(
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Image.network(
                  foodMenu.strMealThumb,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.32,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  left: 98,
                  child: Transform.rotate(
                    angle: 0.1,
                    child: Container(
                      width: 30,
                      height: 130,
                      decoration: const BoxDecoration(color: Colors.white),
                    ),
                  ),
                ),
              ]),
              // title
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              foodMenu.strMeal,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "(${foodMenu.strCategory})",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text('Ingridients :'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7 - 59,
                      height: 75,
                      child: Wrap(
                        runSpacing: 2,
                        spacing: 2,
                        clipBehavior: Clip.hardEdge,
                        children: [
                          ...List.generate(
                              foodMenu.listStrIngredient.length,
                              (index) => (foodMenu.listStrIngredient[index] !=
                                          '' &&
                                      foodMenu.listStrIngredient[index] != ' ')
                                  ? CustomChip(
                                      text: foodMenu.listStrIngredient[index]
                                          .toLowerCase())
                                  : Container()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 115,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    right: 3,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (provMenu.savedMenu.contains(foodMenu)) {
                              provMenu.removeBookmark(foodMenu);
                            } else {
                              provMenu.savedBookmark(foodMenu);
                            }
                          },
                          child: (!provMenu.savedMenu.contains(foodMenu))
                              ? const Icon(Icons.bookmark_add)
                              : const Icon(
                                  Icons.bookmark,
                                  color: Colors.amber,
                                )),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MenuDetail(foodMenu: foodMenu),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.list_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class CustomChip extends StatelessWidget {
  CustomChip({Key? key, required this.text}) : super(key: key);
  String text;

  void showOverlay(BuildContext context) async {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100.0,
        left: 16.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "https://www.themealdb.com/images/ingredients/${text}.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showOverlay(context);
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
          child: Text(
            text,
            style: const TextStyle(fontSize: 11),
          ),
        ),
      ),
    );
  }
}
