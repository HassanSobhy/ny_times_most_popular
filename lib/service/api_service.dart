import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/article_results.dart';

class ApiService with ChangeNotifier {
  var apiUri = Uri.parse(
      "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=MFkvKgWRzhnjqPQSQAvWojFcTzjHoGAD");

  Future<ArticleResults> getArticles() async {
    http.Response res = await http.get(apiUri);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      print("Test ${jsonData}");
      return ArticleResults.fromJson(jsonData) ;
    } else {
      throw("Status Code: ${res.statusCode}");
    }
  }


}
