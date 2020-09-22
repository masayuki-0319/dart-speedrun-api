// ref: https://github.com/speedruncomorg/api/blob/master/version1/series.md#get-series
// To parse this JSON data, do
//
//   final series = seriesFromJson(jsonString);
//
// Note:
//   Deleted `moderators` column

import 'dart:convert';

import 'common/asset.dart';
import 'common/link.dart';
import 'common/names.dart';

Series seriesFromJson(Map<String, dynamic> json) => Series.fromJson(json);

String seriesToJson(Series data) => json.encode(data.toJson());

class Series {
  Series({
    this.id,
    this.names,
    this.abbreviation,
    this.weblink,
    this.created,
    this.assets,
    this.links,
  });

  String id;
  Names names;
  String abbreviation;
  String weblink;
  dynamic created;
  Map<String, Asset> assets;
  List<Link> links;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
    id: json['id'],
    names: Names.fromJson(json['names']),
    abbreviation: json['abbreviation'],
    weblink: json['weblink'],
    created: json['created'] != null ? DateTime.parse(json['created']) : null,
    assets: Map.from(json['assets']).map((k, v) => MapEntry<String, Asset>(k, v == null ? null : Asset.fromJson(v))),
    links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'names': names.toJson(),
    'abbreviation': abbreviation,
    'weblink': weblink,
    'created': created.toIso8601String(),
    'assets': Map.from(assets).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v.toJson())),
    'links': List<dynamic>.from(links.map((x) => x.toJson())),
  };
}
