import 'package:flutter/material.dart';
import 'package:gank4flutter/detail/detail_page.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('关于')),
      body: SizedBox(
        height: 210.0,
        child: Column(
          children: <Widget>[
            ListTile(
                title: Text('Gank4Flutter',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle:
                    Text('A demo of gank.io mobile client using flutter.'),
                leading: Icon(Icons.home, color: Colors.blue)),
            Divider(),
            ListTile(
                title: Text('lzh77',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(Icons.insert_emoticon, color: Colors.blue)),
            ListTile(
                title: Text('https://github.com/lzh77',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(Icons.language, color: Colors.blue),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return DetailPage(
                        url: 'https://github.com/lzh77', title: 'Github');
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
