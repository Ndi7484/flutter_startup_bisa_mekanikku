import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/core/http_helper.dart';
import 'package:flutter_mekanikku/models/ads_state.dart';

class AdsProvider extends ChangeNotifier {
  late HttpHelper helper = HttpHelper();

  late AdsState? _jsonResultAds = null;
  AdsState? get jsonResultAds => _jsonResultAds;
  set jsonResultAds(value) {
    _jsonResultAds = value;
    notifyListeners();
  }

  Future<AdsState> loadApiAds() async {
    final data = await helper.getAds();
    return adsStateFromJson(data);
  }
}
