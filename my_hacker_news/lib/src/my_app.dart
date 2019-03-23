import 'package:flutter/material.dart';
import 'screens/news_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MyHackerNewsApp",
      home: new NewsList(),
    );
  }
}
