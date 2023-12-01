import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class HttpHelper {
  final String _urlLokasi =
      'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json';
  final String _urlPerson = 'https://randomuser.me/api/?results=10';
  final String _urlBase =
      'https://sublimeads.com/api/random?token=HdizxtNtwjGnQdE3SY0Sxeez0bqWZx3Mo3kG7NYzs-w&id=UtNW280YrPL0bg';
  final String _urlHtmlNews =
      'https://p.eagate.573.jp/game/dan/1st/news/news.html';
  final String _urlFoodSerach =
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

  Future<String> getPerson() async {
    var url = Uri.parse(_urlPerson);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    }
    return result.statusCode.toString();
  }

  Future<String> getDrsBlog() async {
    var url = Uri.parse(_urlHtmlNews);
    http.Response result = await http.get(url);
    if (result.statusCode == 200) {
      final document = parse(result.body);
      // final body = document.querySelector('body');
      final divs = document.querySelectorAll('div');

      return divs[0].innerHtml;
      // if (divs.length >= 2) {
      // return divs[1].outerHtml;
      // }
    }

    return 'Failed to fetch and parse HTML';
  }

  Future<String> getFoodListAll() async {
    var url = Uri.parse(_urlFoodSerach);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    }
    return result.statusCode.toString();
  }
}
