import 'package:flutter/material.dart';
import 'package:gank4flutter/adapter/base_adapter.dart';
import 'package:gank4flutter/detail/detail_page.dart';

class GankDataAdapter<GankInfo> extends BaseAdapter {
  @override
  Widget convert(BuildContext context, item) {
    return ListTile(
      isThreeLine: false,
      dense: false,
      leading: null,
      title: Text(item.desc),
      subtitle: Text(item.who),
      onTap: () {
        print('click:${item.desc}');
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return DetailPage(
            url: item.url,
            title: item.desc,
          );
        }));
      },
    );
  }
}
