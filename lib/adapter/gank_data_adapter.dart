import 'package:flutter/material.dart';
import 'package:gank4flutter/adapter/base_adapter.dart';
import 'package:gank4flutter/detail/detail_page.dart';

class GankDataAdapter extends BaseAdapter {
  @override
  Widget convert(BuildContext context, Map<String, dynamic> item) {
    return new ListTile(
      isThreeLine: false,
      dense: false,
      leading: null,
      title: new Text('${item['desc']}'),
      subtitle: new Text('${item['who']}'),
      onTap: () {
        print('click:${item['desc']}');
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new DetailPage(
            url: '${item['url']}',
            title: '${item['desc']}',
          );
        }));
      },
    );
  }
}
