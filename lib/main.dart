import 'package:flutter/material.dart';
import 'package:gank4flutter/home/home_page.dart';
import 'package:gank4flutter/about/about_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gank4Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Gank.io'),
      routes: <String, WidgetBuilder>{
        '/about': (BuildContext context) => new AboutPage(),
      },
    );
  }
}
