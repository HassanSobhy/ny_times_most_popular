import 'package:flutter/material.dart';
import 'package:ny_times_app/models/article.dart';
import 'package:url_launcher/url_launcher.dart';



class ArticleDetailScreen extends StatelessWidget {

  final Article article ;

  const ArticleDetailScreen(this.article);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  article.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  thickness: 1,
                  color: Colors.black45,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_outlined),
                  SizedBox(
                    width: 8,
                  ),
                  Text(article.publishedDate),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Image.network(
                  article.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  article.abstract,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await launch(article.articleUrl);
                  },
                  child: Text("Read More")),
            ],
          ),
        ),
      ),
    );
  }
}
