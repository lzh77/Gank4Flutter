import 'package:flutter/material.dart';
import 'package:gank4flutter/detail/detail_page.dart';
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

  @override
  void initState() {
    var apiservice = new ApiService();
    String url = apiservice.apiHost + '/api/data/' + widget.type + '/30/1';
    apiservice.doGet(url).then((gank) {
      if (gank != null) {
        setData(gank.results);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build gank list state:$widget.type');
    Iterable<Widget> widgets = datas.map((Map<String, dynamic> info) {
      return buildAdapter(context, info);
    });
    widgets = ListTile.divideTiles(context: context, tiles: widgets);

    return new Scrollbar(
      child: new ListView(children: widgets.toList()),
    );
  }

  Widget buildAdapter(BuildContext context, Map<String, dynamic> info) {
    return new ListTile(
      isThreeLine: false,
      dense: false,
      leading: null,
      title: new Text('${info['desc']}'),
      subtitle: new Text('${info['who']}'),
      onTap: () {
        print('click:${info['desc']}');
        Navigator.of(context).push(
            new PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return new DetailPage('${info['url']}');
            }));
      },
    );
  }

  void setData(List<Map<String, dynamic>> results) {
    setState(() {
      this.datas = results;
    });
  }
}
