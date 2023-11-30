import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/core/http_helper.dart';
import 'package:flutter_mekanikku/models/location_state.dart' as loc;
import 'package:flutter_mekanikku/models/random_user_state.dart' as rand;

class UiSettingsProvider extends ChangeNotifier {
  late HttpHelper helper = HttpHelper();

  final List<String> _carouselImage = [
    'assets/banner_1.png',
    'assets/banner_2.jpg',
    'assets/banner_3.jpg',
    'assets/banner_4.jpg'
  ];
  List<String> get carouselImage => _carouselImage;

  // ignore: prefer_final_fields
  List<String> _items = [];
  List<String> get items => _items;
  String? _selectedValue;
  String? get selectedValue => _selectedValue;
  set selectedValue(value) {
    _selectedValue = value;
  }

  bool _dark_mode = true;
  bool get dark_mode => _dark_mode;
  set dark_mode(value) {
    _dark_mode = value;
  }

  Future<List<loc.Location>> getLocation() async {
    final data = await helper.getLocation();
    List<loc.Location> data_item = loc.locationFromJson(data);
    _items = List.generate(data_item.length, (index) => data_item[index].name);
    selectedValue ??= _items[1];
    return data_item;
  }

  // List<rand.Result> _listUser = [];
  String _person = '';
  String get person => _person;
  set person(value) {
    _person;
    notifyListeners();
  }

  Future<List<rand.Result>> getPerson() async {
    final data = await helper.getPerson();
    rand.RandomUser data_item = rand.randomUserFromJson(data);
    return data_item.results;
  }
}
