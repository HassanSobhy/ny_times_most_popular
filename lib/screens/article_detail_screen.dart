import 'package:flutter/material.dart';
import 'package:ny_times_app/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailScreen extends StatefulWidget {
  final Article article ;

  const ArticleDetailScreen(this.article);
  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://static01.nyt.com/images/2021/03/30/multimedia/28xp-cicadas2/merlin_69501121_ba3d6fe2-571c-41cd-a3c9-471157d6fb0a-jumbo.jpg?quality=90&auto=webp";

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.article.title,
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
                  Text(widget.article.publishedDate),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Image.network(
                  widget.article.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.article.abstract,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await launch(widget.article.articleUrl);
                  },
                  child: Text("Read More")),
            ],
          ),
        ),
      ),
    );
  }
}
