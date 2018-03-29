import 'package:flutter/material.dart';
import 'package:gank4flutter/adapter/base_adapter.dart';
import 'package:gank4flutter/adapter/gank_data_adapter.dart';
import 'package:gank4flutter/adapter/meizi_adapter.dart';
import 'package:gank4flutter/http/api_service.dart';

final List<String> items = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J'];

class GankPage extends StatelessWidget {
  String type;

  GankPage(this.type);

  @override
  Widget build(BuildContext context) {
    return new GankList(type: type);
  }
}

class GankList extends StatefulWidget {
  String type;

  GankList({Key k, this.type}) : super(key: k);

  @override
  State<StatefulWidget> createState() {
    return new GankListState();
  }
}

class GankListState extends State<GankList> {
  List<Map<String, dynamic>> datas = new List();
  bool complete = false;
  Text nodata;
  BaseAdapter adapter;

  @override
  void initState() {
    nodata = new Text(
      '暂无数据',
      style: new TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    );
    loadData();
  }

  loadData() {
    var apiservice = new ApiService();
    String url = apiservice.apiHost + '/api/data/' + widget.type + '/30/1';
    apiservice.doGet(url).then((gank) {
      if (gank != null && gank.results.length > 0) {
        setData(gank.results);
        complete = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build gank list state:${widget.type}');

    return getBody();
  }

  showLoading() {
    if (!complete) {
      return true;
    }
    return false;
  }

  getBody() {
    if (showLoading()) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      if (datas.isEmpty) {
        return new Center(
          child: nodata,
        );
      }
      if (widget.type == '福利') {
        adapter = new MeiziAdapter();
        var widgets = datas.map((Map<String, dynamic> info) {
          return adapter.convert(context, info);
        });
        widgets = ListTile.divideTiles(context: context, tiles: widgets);

        return new GridView.count(
          crossAxisCount: 2,
          primary: false,
          padding: const EdgeInsets.all(8.0),
          crossAxisSpacing: 8.0,
          children: widgets.toList(),
        );
      } else {
        adapter = new GankDataAdapter();
        var widgets = datas.map((Map<String, dynamic> info) {
          return adapter.convert(context, info);
        });
        widgets = ListTile.divideTiles(context: context, tiles: widgets);

        return new ListView(children: widgets.toList());
      }
    }
  }

  buildAdapter(BuildContext context, Map<String, dynamic> info) {}

  setData(List<Map<String, dynamic>> results) {
    setState(() {
      this.datas = results;
    });
  }
}
