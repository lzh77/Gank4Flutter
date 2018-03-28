import 'package:flutter/material.dart';
import 'package:gank4flutter/home/home_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  String url;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gank4Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Gank.io'),
    );
  }
}
