import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/core/http_helper.dart';
import 'package:flutter_mekanikku/models/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  late HttpHelper helper = HttpHelper();

  // ignore: avoid_init_to_null
  late List<FoodMenu>? _jsonResultFood = null;
  List<FoodMenu>? get jsonResultFood => _jsonResultFood;
  set jsonResultFood(value) {
    _jsonResultFood = value;
    notifyListeners();
  }

  String _error = '';
  String get error => _error;
  set error(value) {
    _error = value;
    notifyListeners();
  }

  Future<void> loadApiMenu(String? query) async {
    final data = await helper.getMenuAll(query);
    if (jsonDecode(data)['meals'] == null) {
      error = "There is no results : '$query'";
    } else {
      List<FoodMenu> tmp = List.generate(
        jsonDecode(data)['meals'].length,
        (index) => FoodMenu.fromJson(jsonDecode(data)['meals'][index]),
      );
      jsonResultFood = tmp;
    }
  }

  // Future<List<FoodMenu>> loadApiMenu() async {
  //   final data = await helper.getMenuAll();
  //   List<FoodMenu> tmp = List.generate(
  //     jsonDecode(data)['meals'].length,
  //     (index) => FoodMenu.fromJson(
  //       jsonDecode(data)['meals'][index]
  //     ),
  //   );
  //   return tmp;
  // }
  List<FoodMenu> _savedMenu = [];
  List<FoodMenu> get savedMenu => _savedMenu;
  
  void savedBookmark(FoodMenu value) {
    _savedMenu.add(value);
    notifyListeners();
  }

  void removeBookmark(FoodMenu value) {
    _savedMenu.remove(value);
    notifyListeners();
  }
}
