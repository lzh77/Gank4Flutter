import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DetailPage extends StatefulWidget {
  final String url;

  DetailPage(this.url);

  @override
  State<StatefulWidget> createState() {
    return new DetailState();
  }
}

class DetailState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: widget.url,
      appBar: new AppBar(),
    );
  }
}
