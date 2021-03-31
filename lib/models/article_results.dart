import 'package:flutter/foundation.dart';
import 'package:ny_times_app/models/article.dart';

class ArticleResults {
  final List<Article> results;

  ArticleResults({
    @required this.results,
  });

  factory ArticleResults.fromJson(Map<String, dynamic> result) {
    final data = result["results"] as List;
    List<Article> articles = [];
    data.map((e) => articles.add(Article.fromJson(e))).toList();

    return ArticleResults(results: articles);
  }
}
