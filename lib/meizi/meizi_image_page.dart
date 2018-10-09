import 'package:flutter/material.dart';

class MeiziImagePage extends StatefulWidget {
  String title;
  String url;

  MeiziImagePage({Key key, this.title, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MeiziImagePageState();
  }
}

class MeiziImagePageState extends State<MeiziImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Image.network('${widget.url}'),
      ),
    );
  }
}
