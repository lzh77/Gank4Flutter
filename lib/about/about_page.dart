import 'package:flutter/material.dart';
import 'package:gank4flutter/detail/detail_page.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('关于')),
      body: new SizedBox(
        height: 210.0,
        child: new Column(
          children: <Widget>[
            new ListTile(
                title: new Text('Gank4Flutter',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                subtitle:
                    new Text('A demo of gank.io mobile client using flutter.'),
                leading: new Icon(Icons.home, color: Colors.blue)),
            new Divider(),
            new ListTile(
                title: new Text('lzh77',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                leading: new Icon(Icons.insert_emoticon, color: Colors.blue)),
            new ListTile(
                title: new Text('https://github.com/lzh77',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                leading: new Icon(Icons.language, color: Colors.blue),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new DetailPage(
                        url: 'https://github.com/lzh77', title: 'Github');
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
