import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gank4flutter/data_model.dart';

class ApiService {
  Dio dio;

  ApiService() {
    dio = new Dio();
    dio.options.baseUrl = "http://gank.io";
    //option.responsetype
    //默认json 省去了json.decode步骤
  }

  Future<Gank> doGet(String url) async {
    Gank gank;
    try {
      Response response = await dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        gank = new Gank.fromJson(response.data);
      } else {
        print('Error get:\nHttp status ${response.statusCode}');
      }
    } on DioError catch (e) {
      print('dio request error, exception:$e');
    }
    return gank;
  }
}
