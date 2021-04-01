import 'package:flutter/material.dart';
import 'package:ny_times_app/providers/article_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'service/api_service.dart';
import 'screens/article_detail_screen.dart';

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
      home: ChangeNotifierProvider<ArticleProvider>(
        create: (_) => ArticleProvider(),
        child: HomeScreen(),
      ),
    );
  }
}
