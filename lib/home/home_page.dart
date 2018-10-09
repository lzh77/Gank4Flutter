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
  GankPage('all'),
  GankPage('Android'),
  GankPage('iOS'),
  GankPage('App'),
  GankPage('前端'),
  GankPage('拓展资源'),
  GankPage('休息视频'),
  GankPage('瞎推荐'),
  GankPage('福利'),
];

class HomePage extends StatefulWidget {
  String title;

  HomePage({Key k, this.title}) : super(key: k);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int count = 0;
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (int i) {
                setState(() => onMenuItemSelected(i));
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                    PopupMenuItem(
                      child: const Text('分享'),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: const Text('关于'),
                      value: 1,
                    ),
                  ],
            ),
          ],
          bottom: TabBar(
            tabs: tabList,
            controller: controller,
            isScrollable: true,
          )),
      body: TabBarView(
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
