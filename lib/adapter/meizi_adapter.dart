import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gank4flutter/adapter/base_adapter.dart';
import 'package:gank4flutter/meizi/meizi_image_page.dart';

class MeiziAdapter<GankInfo> extends BaseAdapter {
  @override
  Widget convert(BuildContext context, item) {
    return new Card(
      child: new GestureDetector(
        child: new Container(
          child: new Image(image: new CachedNetworkImageProvider(item.url)),
        ),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext context) {
            return new MeiziImagePage(
              title: item.desc,
              url: item.url,
            );
          }));
        },
      ),
    );
  }
}
