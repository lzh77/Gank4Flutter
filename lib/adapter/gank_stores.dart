import 'dart:async';

import 'package:flutter_flux/flutter_flux.dart';
import 'package:gank4flutter/data_model.dart';
import 'package:gank4flutter/http/api_service.dart';

class GankStore extends Store {
  Gank gank;
  String type;
  bool finish;

  GankStore(String type) {
    this.type = type;
    this.finish = false;
    triggerOnAction(gankAction, (dynamic) {
      this.finish = false;
      _loadData();
    });
  }

  void _loadData() {
    String url = '/api/data/' + type + '/30/1';
    Future<Gank> gankFuture = ApiService().doGet(url);
    gankFuture.then((gank) {
      this.finish = true;
      this.gank = gank;
      trigger();
    });
  }
}

final Action<Gank> gankAction = Action();
