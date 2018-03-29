import 'package:flutter/material.dart';

class MeiziImagePage extends StatefulWidget {
  String title;
  String url;

  MeiziImagePage({Key key, this.title, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MeiziImagePageState();
  }
}

class MeiziImagePageState extends State<MeiziImagePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Image.network('${widget.url}'),
      ),
    );
  }
}
