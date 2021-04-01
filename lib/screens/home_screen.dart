import 'package:flutter/material.dart';
import 'package:ny_times_app/providers/article_provider.dart';
import 'package:provider/provider.dart';
import '../models/article.dart';
import '../screens/article_detail_screen.dart';
import '../service/api_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NY Times Most Popular"),
        actions: [
          Icon(Icons.search),
          PopupMenuButton(itemBuilder: (context) {
            return [PopupMenuItem()];
          }),
        ],
      ),
      drawer: Drawer(),
      body: Center(
        child: Consumer<ArticleProvider>(
          builder: (context, value, child) {
            if (value.data == null) {
              value.getArticles();
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: value.data.results.length,
                  itemBuilder: (context, index) {
                    return buildListItem(context, value.data.results[index]);
                  });
            }
          },
        ),
      ),
    );
  }

  ListTile buildListItem(BuildContext context, Article article) {
    return ListTile(
      onTap: () {
        //Navigate to Details Screen.
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetailScreen(article)));
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
      ),
      title: Text(
        "${article.title}",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
      contentPadding: EdgeInsets.all(16),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${article.byLine}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${article.source}",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Expanded(
                child: SizedBox(
                  width: 10,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${article.publishedDate}",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              )
            ],
          )
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
