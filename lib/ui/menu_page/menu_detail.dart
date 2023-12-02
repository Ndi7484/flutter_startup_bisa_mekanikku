import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/models/menu_model.dart';

class MenuDetail extends StatelessWidget {
  FoodMenu foodMenu;
  MenuDetail({Key? key, required this.foodMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodMenu.strMeal),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              foodMenu.strMealThumb,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              foodMenu.strMeal,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              softWrap: true,
              maxLines: 3,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Ingridients : '),
            ...List.generate(
                foodMenu.listStrIngredient.length,
                (index) => (foodMenu.listStrIngredient[index] != '')
                    ? CustomChipWithImage(
                        text: foodMenu.listStrIngredient[index],
                        measure: foodMenu.listStrMeasure[index])
                    : Container()),
            const SizedBox(
              height: 8,
            ),
            const Text('Instruction : '),
            ...List.generate(
              foodMenu.strInstructions.split('\r\n').length,
              (index) => CustomInstruction(
                  text: foodMenu.strInstructions.split('\r\n')[index]),
            ),
            // Text(foodMenu.strInstructions),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInstruction extends StatefulWidget {
  CustomInstruction({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  State<CustomInstruction> createState() => _CustomInstructionState();
}

class _CustomInstructionState extends State<CustomInstruction> {
  bool _setOk = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _setOk = !_setOk;
        });
      },
      child: Card(
        color: (_setOk) ? Colors.green : null,
        elevation: 6,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.flag_circle_outlined,
                  )),
              Expanded(
                flex: 9,
                child: Text(
                  widget.text,
                  softWrap: true,
                  maxLines: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomChipWithImage extends StatefulWidget {
  CustomChipWithImage({Key? key, required this.text, required this.measure})
      : super(key: key);
  String text;
  String measure;

  @override
  State<CustomChipWithImage> createState() => _CustomChipWithImageState();
}

class _CustomChipWithImageState extends State<CustomChipWithImage> {
  bool _setOk = false;

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
                  "https://www.themealdb.com/images/ingredients/${widget.text}.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(widget.text),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: GestureDetector(
        onLongPress: () {
          showOverlay(context);
        },
        onTap: () {
          setState(() {
            _setOk = !_setOk;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: (_setOk) ? Colors.green : Colors.amber,
              borderRadius: const BorderRadius.all(const Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                    "https://www.themealdb.com/images/ingredients/${widget.text}.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  widget.text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  widget.measure,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
