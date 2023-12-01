import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/core/http_helper.dart';
import 'package:flutter_mekanikku/models/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  late HttpHelper helper = HttpHelper();

  Future<List<FoodMenu>> loadAllFoodMenu() async {
    final data = await helper.getFoodListAll();
    return List.generate(data['meals'].length, (index) => null)
  }
}
