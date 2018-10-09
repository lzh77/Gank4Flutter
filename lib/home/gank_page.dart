import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:gank4flutter/adapter/gank_data_adapter.dart';
import 'package:gank4flutter/adapter/meizi_adapter.dart';
import 'package:gank4flutter/data_model.dart';
import 'package:gank4flutter/adapter/gank_stores.dart';

class GankPage extends StatefulWidget {
  String type;

  GankPage(this.type);

  @override
  GankPageState createState() {
    return GankPageState();
  }
}

class GankPageState extends State<GankPage> {
  @override
  Widget build(BuildContext context) {
    return GankList(type: widget.type);
  }
}

class GankList extends StoreWatcher {
  String type;
  StoreToken gankStoreToken;
  bool finish = false;

  GankList({Key k, this.type}) : super(key: k);

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    GankStore store = stores[gankStoreToken];
    if (store != null) {
      this.finish = store.finish;
    }
    if (!finish) {
      return Center(child: CircularProgressIndicator());
    } else {
      Gank gank = store.gank;
      if (gank == null || gank.results.isEmpty) {
        return Center(
          child: Text(
            '暂无数据',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      } else {
        if (this.type == "福利") {
          var widgets = gank.results.map((GankInfo info) {
            return MeiziAdapter().convert(context, info);
          });
          widgets = ListTile.divideTiles(context: context, tiles: widgets);

          return GridView.count(
            crossAxisCount: 2,
            primary: false,
            padding: const EdgeInsets.all(8.0),
            crossAxisSpacing: 8.0,
            children: widgets.toList(),
          );
        } else {
          var widgets = gank.results.map((GankInfo info) {
            if (info.type == '福利') {
              return MeiziAdapter().convert(context, info);
            } else {
              return GankDataAdapter().convert(context, info);
            }
          });
          widgets = ListTile.divideTiles(context: context, tiles: widgets);

          return ListView(children: widgets.toList());
        }
      }
    }
  }

  @override
  void initStores(ListenToStore listenToStore) {
    //todo 使用构造函数里面的type 导致重复请求
    gankStoreToken = StoreToken(GankStore(this.type));
    listenToStore(gankStoreToken);
    gankAction.call();
  }
}
