import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NY Times Most Popular"),
      ),
      drawer: Drawer(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return buildListItem();
          }),
    );
  }

  ListTile buildListItem() {
    return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            title: Text(
              "Billions (Yes, Billions) of Cicadas Soon to Emerge From Underground",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),
            contentPadding: EdgeInsets.all( 16),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "By HASSAN SOBHY",
                  style: TextStyle(fontSize: 12, color: Colors.grey,),
                  textAlign:TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "THOMPSON",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(width: 4,),
                        Text(
                          "31-3-2021",
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
