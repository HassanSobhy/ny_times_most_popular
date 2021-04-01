import 'package:flutter/material.dart';
import 'package:ny_times_app/models/article_results.dart';
import 'package:ny_times_app/service/api_service.dart';

class ArticleProvider extends ChangeNotifier {
  ArticleResults data;

  void getArticles() async {
    try {
      data = await ApiService().getArticles();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
