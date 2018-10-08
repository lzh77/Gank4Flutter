import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';

@JsonSerializable()
class Gank {
  @JsonKey()
  final bool error;
  @JsonKey()
  final List<Map<String, dynamic>> results;

  Gank(this.error, this.results);

  factory Gank.fromJson(Map<String, dynamic> json) =>_$GankFromJson(json);

  Map<String, dynamic> toJson() => _$GankToJson(this);
}

class GankInfo {
  Map<String, dynamic> infoMap;
  String _id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;

  GankInfo(this._id, this.createdAt, this.desc, this.publishedAt, this.source,
      this.type, this.url, this.used, this.who);

  GankInfo.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        createdAt = json['createdAt'],
        desc = json['desc'],
        publishedAt = json['publishedAt'],
        source = json['source'],
        type = json['type'],
        url = json['url'],
        used = json['used'],
        who = json['who'];

  Map<String, dynamic> toJson() =>
      {
        '_id': _id,
        'createdAt': createdAt,
        'desc': desc,
        'publishedAt': publishedAt,
        'source': source,
        'type': type,
        'url': url,
        'used': used,
        'who': who,
      };
}

class GankDayInfo {
  GankResult results;
}

class GankResult {
  List<GankInfo> Android;
  List<GankInfo> iOS;
  List<GankInfo> rest;
  List<GankInfo> ext;
  List<GankInfo> unknown;
  List<GankInfo> pic;
}
