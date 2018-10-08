import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class Gank {
  @JsonKey()
  final bool error;
  @JsonKey()
  List<GankInfo> results;

  Gank(this.error, this.results);

  factory Gank.fromJson(Map<String, dynamic> json) => _$GankFromJson(json);

  Map<String, dynamic> toJson() => _$GankToJson(this);
}

@JsonSerializable()
class GankInfo {
  @JsonKey(name: "_id")
  final String mid;
  @JsonKey()
  final String createdAt;
  @JsonKey()
  final String desc;
  @JsonKey()
  final String publishedAt;
  @JsonKey()
  final String source;
  @JsonKey()
  final String type;
  @JsonKey()
  final String url;
  @JsonKey()
  final bool used;
  @JsonKey()
  final String who;

  GankInfo(this.mid, this.createdAt, this.desc, this.publishedAt, this.source,
      this.type, this.url, this.used, this.who);

  factory GankInfo.fromJson(Map<String, dynamic> json) =>
      _$GankInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GankInfoToJson(this);
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
