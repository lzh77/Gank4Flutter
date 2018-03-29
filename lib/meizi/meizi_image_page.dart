import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MeiziImagePage extends StatefulWidget {
  String url;

  MeiziImagePage(this.url);

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
        actions: <Widget>[
          new FlatButton(
            child: new Icon(Icons.file_download, color: Colors.white),
            onPressed: download(widget.url),
          )
        ],
      ),
      body: new Center(
        child: new Image.network('${widget.url}'),
      ),
    );
    // TODO: implement build
  }

  download(String url) async {
    var httpClient = new HttpClient();
    final dir = await getApplicationDocumentsDirectory();
    try {
      print('download url:$url');
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
      } else {
        print('Error get:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting IP address,exception:$exception');
    }
  }
}
