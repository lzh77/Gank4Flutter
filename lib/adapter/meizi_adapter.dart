import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gank4flutter/adapter/base_adapter.dart';
import 'package:gank4flutter/meizi/meizi_image_page.dart';

class MeiziAdapter<GankInfo> extends BaseAdapter {
  @override
  Widget convert(BuildContext context, item) {
    return Card(
      child: GestureDetector(
        child: Container(
          child: Image(image: CachedNetworkImageProvider(item.url)),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return MeiziImagePage(
              title: item.desc,
              url: item.url,
            );
          }));
        },
      ),
    );
  }
}
