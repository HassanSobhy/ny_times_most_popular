import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailScreen extends StatefulWidget {
  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    String title =
        "Billions (Yes, Billions) of Cicadas Soon to Emerge From Underground";
    String date = "30 Mar, 2018, 22:55";
    String imageUrl =
        "https://static01.nyt.com/images/2021/03/30/multimedia/28xp-cicadas2/merlin_69501121_ba3d6fe2-571c-41cd-a3c9-471157d6fb0a-jumbo.jpg?quality=90&auto=webp";
    String body =
        "Swarms of cicadas, part of a group called Brood X, are expected to appear in 18 states in the next few weeks, just in time to help orchestrate the soundtrack of summer.";
    String articleUrl =
        "https://www.nytimes.com/2021/03/28/us/cicada-brood-x.html";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
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
                  Text(date),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  body,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await launch(articleUrl);
                  },
                  child: Text("Read More")),
            ],
          ),
        ),
      ),
    );
  }
}
