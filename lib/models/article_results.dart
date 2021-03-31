import 'package:flutter/foundation.dart';
import 'package:ny_times_app/models/article.dart';

class ArticleResults {
  final List<dynamic> results;

  ArticleResults({
    @required this.results,
  });

  factory ArticleResults.fromJson(Map<String,dynamic> result)
  {
    //Will return a list of Articles every Article Map<String,dynamic>
    return ArticleResults(results: result["results"]);
  }
}
