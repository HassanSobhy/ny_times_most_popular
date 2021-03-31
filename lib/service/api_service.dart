import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_results.dart';
import '../models/article.dart';

class ApiService {
  var apiUri = Uri.parse(
      "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=MFkvKgWRzhnjqPQSQAvWojFcTzjHoGAD");

  Future<ArticleResults> getArticles() async {
    http.Response res = await http.get(apiUri);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      return ArticleResults.fromJson(jsonData) ;
    } else {
      print("Status Code: ${res.statusCode}");
    }
  }
}
