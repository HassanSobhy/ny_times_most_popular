import 'package:flutter/foundation.dart';

class Article {
  final int id;
  final String title;
  final String byLine;
  final String publishedDate;
  final String source;


  Article({
    @required this.id,
    @required this.title,
    @required this.byLine,
    @required this.publishedDate,
    @required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> article)
  {
    return Article(
      id: article["id"],
      source: article["source"],
      publishedDate: article["published_date"],
      byLine: article["byline"],
      title: article["title"],
    );
  }

}
