import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/article_results.dart';

class ApiService with ChangeNotifier {
  var apiUri = Uri.parse(
      "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=MFkvKgWRzhnjqPQSQAvWojFcTzjHoGAD");

  String _jsonResponse = "";
  bool _isFetching = false;

  ApiService();

  bool get isFetching => _isFetching;

  Future<void> fetchData() async
  {

    http.Response res = await http.get(apiUri);
    if (res.statusCode == 200) {
      _jsonResponse =res.body;
    }
    _isFetching = false;
    notifyListeners();
  }

  void markAsLoading() {
    _isFetching = true;
    notifyListeners();
  }



  ArticleResults getArticles(){
    if(_jsonResponse.isNotEmpty)
      {
        return ArticleResults.fromJson(jsonDecode(_jsonResponse));
      }

    return null;
  }

  /*
  Future<ArticleResults> getArticles() async {
    http.Response res = await http.get(apiUri);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      return ArticleResults.fromJson(jsonData) ;
    } else {
      print("Status Code: ${res.statusCode}");
    }
  }

   */

}
