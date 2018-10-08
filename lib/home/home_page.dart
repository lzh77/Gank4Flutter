import 'package:flutter/material.dart';
import 'package:gank4flutter/home/gank_page.dart';
import 'package:share/share.dart';

final List<Tab> tabList = [
  const Tab(text: 'all'),
  const Tab(text: 'Android'),
  const Tab(text: 'iOS'),
  const Tab(text: 'App'),
  const Tab(text: '前端'),
  const Tab(text: '拓展资源'),
  const Tab(text: '休息视频'),
  const Tab(text: '瞎推荐'),
  const Tab(text: '福利'),
];

List<GankPage> pages = [
  new GankPage('all'),
  new GankPage('Android'),
  new GankPage('iOS'),
  new GankPage('App'),
  new GankPage('前端'),
  new GankPage('拓展资源'),
  new GankPage('休息视频'),
  new GankPage('瞎推荐'),
  new GankPage('福利'),
];

class HomePage extends StatefulWidget {
  String title;

  HomePage({Key k, this.title}) : super(key: k);

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int count = 0;
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(widget.title),
          actions: <Widget>[
            new PopupMenuButton<int>(
              onSelected: (int i) {
                setState(() => onMenuItemSelected(i));
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                    new PopupMenuItem(
                      child: const Text('分享'),
                      value: 0,
                    ),
                    new PopupMenuItem(
                      child: const Text('关于'),
                      value: 1,
                    ),
                  ],
            ),
          ],
          bottom: new TabBar(
            tabs: tabList,
            controller: controller,
            isScrollable: true,
          )),
      body: new TabBarView(
        children: pages,
        controller: controller,
      ),
    );
  }

  void onMenuItemSelected(int i) {
    if (i == 0) {
      Share.share('分享应用「Gank4Flutter」-https://github.com/lzh77/Gank4Flutter');
    }
    if (i == 1) {
      Navigator.pushNamed(context, '/about');
    }
  }
}
