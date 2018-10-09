import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';

class DetailPage extends StatefulWidget {
  final String url;
  final String title;

  DetailPage({Key key, this.url, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<DetailPage> {
  final webviewPlugin = FlutterWebviewPlugin();
  AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: this.appBar,
    );
  }

  @override
  void initState() {
    super.initState();
    appBar = AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        FlatButton(
          child: Icon(Icons.share, color: Colors.white),
          onPressed: widget.url.isNotEmpty
              ? () {
                  Share.share('来自「Gank4Flutter」的分享:${widget.url}');
                  print('share complete');
                }
              : null,
        )
      ],
    );
  }

  @override
  void dispose() {
    webviewPlugin.dispose();
    super.dispose();
  }
}
