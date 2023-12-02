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
  final String _urlFoodMenu =
      'https://www.themealdb.com/api/json/v1/1/search.php?s=';
  final String _urlTranslate =
      'https://www.google.com/async/translate?vet=12ahUKEwiX6_37pdKCAxWyfWwGHaJzCEYQqDh6BAgFEDA..i&ei=KytbZdepOrL7seMPouehsAQ&opi=89978449&yv=3&cs=1';
  final String _urlBingTranslate = 'https://www.bing.com/ttranslatev3?&IG=EF77DA31665B401ABFA8A4EE1CD4462A&IID=SERP.5666';

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

  Future<String> getDrsBlog() async {
    var url = Uri.parse(_urlHtmlNews);
    http.Response result = await http.get(url);
    if (result.statusCode == 200) {
      final document = parse(result.body);
      final divs = document.querySelectorAll('div');

      return divs[0].innerHtml;
    }

    return 'Failed to fetch and parse HTML';
  }

  Future<String> postTranslate(String toTrans) async {
    var url = Uri.parse(_urlTranslate);
    // translate,sl:ja,tl:en,st:GYM6の2曲目のプログラムは「All All Night」！,id:1701444632928,qc:true,ac:false,_id:tw-async-translate,_pms:s,_fmt:pc
    Map<String, dynamic> body = {
      "async":
          'translate,sl:ja,tl:en,st:$toTrans,id:1701444632928,qc:true,ac:false,_id:tw-async-translate,_pms:s,_fmt:pc'
    };

    http.Response result = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: Uri(queryParameters: body).query,
    );

    if (result.statusCode == 200) {
      print("Request successful: ${result.body}");
      return result.body;
    }
    print("Request failed with status: ${result.statusCode}");
    return 'result.body';
  }

  Future<String> postBingTranslate(String toTrans) async {
    var url = Uri.parse(_urlBingTranslate);
    // translate,sl:ja,tl:en,st:GYM6の2曲目のプログラムは「All All Night」！,id:1701444632928,qc:true,ac:false,_id:tw-async-translate,_pms:s,_fmt:pc
    Map<String, dynamic> body = {
      "fromLang": 'ja',
      "text": toTrans,
      "to": 'en',
      "token": 'gHdh3kHxDeV-TRen2Rw6a_iiSDr0Hj79',
      "key" : '1701497161301',
      "tryFetchingGenderDebiasedTranslations" : 'true'
    };

    http.Response result = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: Uri(queryParameters: body).query,
    );

    if (result.statusCode == 200) {
      print("Request successful: ${result.body}");
      return result.body;
    }
    print("Request failed with status: ${result.statusCode}");
    return 'result.body';
  }
}
