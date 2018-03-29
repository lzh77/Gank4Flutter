import 'package:flutter/material.dart';
import 'package:gank4flutter/adapter/base_adapter.dart';
import 'package:gank4flutter/meizi/meizi_image_page.dart';

class MeiziAdapter extends BaseAdapter {
  @override
  Widget convert(BuildContext context, Map<String, dynamic> item) {
    return new Card(
      child: new GestureDetector(
        child: new Container(
          child: new Image.network('${item['url']}'),
        ),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext context) {
            return new MeiziImagePage(item['url']);
          }));
        },
      ),
//      child: new Center(
//        child: new Image.network('${item['url']}'),
//      ),
    );
  }
}
