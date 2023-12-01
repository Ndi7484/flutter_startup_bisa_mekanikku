import 'dart:io';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String _urlLokasi =
      'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json';
  final String _urlPerson = 'https://randomuser.me/api/?results=10';
  final String _urlBase =
      'https://sublimeads.com/api/random?token=HdizxtNtwjGnQdE3SY0Sxeez0bqWZx3Mo3kG7NYzs-w&id=UtNW280YrPL0bg';
  final String _urlFoodMenu =
      'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<String> getAds() async {
    var url = Uri.parse(_urlBase);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    }
    return result.statusCode.toString();
  }

  Future<String> getLocation() async {
    var url = Uri.parse(_urlLokasi);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    }
    return result.statusCode.toString();
  }

  Future<String> getMenuAll(String? query) async {
    var url = Uri.parse(_urlFoodMenu + (query ?? ''));
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      return result.body;
    }
    return result.statusCode.toString();
  }

  Future<String> getPerson() async {
    var url = Uri.parse(_urlPerson);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    }
    return result.statusCode.toString();
  }
}
