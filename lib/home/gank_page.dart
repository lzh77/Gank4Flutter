import 'package:flutter/material.dart';
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
  bool isActived = false;
  Text nodata;

  @override
  void initState() {
    isActived = true;
    nodata = new Text(
      '暂无数据',
      style: new TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    );
    loadData();
  }

  @override
  void dispose() {
    isActived = false;
    print('dipose:${widget.type}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build gank list state:${widget.type}');
    return getBody();
  }

  loadData() {
    var apiservice = new ApiService();
    String url = '/api/data/' + widget.type + '/30/1';
    apiservice.doGet(url).then((gank) {
      if (gank != null && gank.results.length > 0) {
        setData(gank.results);
        complete = true;
      }
    });
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
      var gankAdapter = new GankDataAdapter();
      var meiziAdapter = new MeiziAdapter();
      if (datas.isEmpty) {
        return new Center(
          child: nodata,
        );
      }
      if (widget.type == '福利') {
        var widgets = datas.map((Map<String, dynamic> info) {
          return meiziAdapter.convert(context, info);
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
        var widgets = datas.map((Map<String, dynamic> info) {
          if (info['type'] == '福利') {
            return meiziAdapter.convert(context, info);
          } else {
            return gankAdapter.convert(context, info);
          }
        });
        widgets = ListTile.divideTiles(context: context, tiles: widgets);

        return new ListView(children: widgets.toList());
      }
    }
  }

  buildAdapter(BuildContext context, Map<String, dynamic> info) {}

  setData(List<Map<String, dynamic>> results) {
    if (this.isActived) {
      setState(() {
        this.datas = results;
      });
    }
  }
}
