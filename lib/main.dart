import 'package:flutter/material.dart';
import 'package:ny_times_app/models/article.dart';
import 'package:ny_times_app/service/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NY Times Most Popular',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService apiService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService = ApiService();
    apiService.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NY Times Most Popular"),
      ),
      drawer: Drawer(),
      body: Center(
        child: FutureBuilder(
          future: apiService.getArticles(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              //print(snapShot.data.results[index]);
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return buildListItem(snapShot.data.results[index]);
                  });
            }
          },
        ),
      ),
    );
  }

  ListTile buildListItem(article) {
    return ListTile(
      onTap: (){
        //Navigate to Details Screen.
      },
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
      ),
      title: Text(
        "${article['title']}",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
      contentPadding: EdgeInsets.all(16),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${article['byline']}",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${article['source']}",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${article['published_date']}",
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
