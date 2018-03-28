import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:gank4flutter/data_model.dart';

class ApiService {
  final String apiHost = 'http://gank.io';
  var httpClient = new HttpClient();

  Future<Gank> doGet(String url) async {
    Gank gank;
    try {
      print('get url:$url');
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        //print('raw json:$json');
        Map dataMap = JSON.decode(json);
        gank = new Gank.fromJson(dataMap);
      } else {
        print('Error get:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting IP address,exception:$exception');
    }

    return gank;
  }
}
