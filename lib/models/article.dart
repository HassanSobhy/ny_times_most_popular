import 'package:flutter/foundation.dart';

class Article {
  final int id;
  final String title;
  final String byLine;
  final String publishedDate;
  final String source;
  final String abstract;
  final String articleUrl;
  final String imageUrl;


  Article({
    @required this.id,
    @required this.title,
    @required this.byLine,
    @required this.publishedDate,
    @required this.source,
    @required this.abstract,
    @required this.articleUrl,
    @required this.imageUrl,
  });

  factory Article.fromJson(Map<String, dynamic> article)
  {
    return Article(
      id: article["id"],
      source: article["source"],
      publishedDate: article["published_date"],
      byLine: article["byline"],
      title: article["title"],
      abstract: article["abstract"],
      articleUrl: article["url"],
      imageUrl: article["media"][0]["media-metadata"][2]["url"],
    );
  }


}
