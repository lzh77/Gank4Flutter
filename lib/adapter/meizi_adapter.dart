import 'package:flutter/material.dart';
import 'package:gank4flutter/adapter/base_adapter.dart';

class MeiziAdapter extends BaseAdapter {
  @override
  Widget convert(BuildContext context, Map<String, dynamic> item) {
    return new Card(
      child: new Center(
        child: new Image.network('${item['url']}'),
      ),
    );
  }
}
