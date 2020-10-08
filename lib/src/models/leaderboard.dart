// To parse this JSON data, do
//
//     final leaderboard = leaderboardFromJson(jsonString);
// Note:
//   No parsed `values, runs`

import 'dart:convert';

import 'common/link.dart';

Leaderboard leaderboardFromJson(Map<String, dynamic> json) => Leaderboard.fromJson(json);

String leaderboardToJson(Leaderboard data) => json.encode(data.toJson());

class Leaderboard {
  Leaderboard({
      this.weblink,
      this.game,
      this.category,
      this.level,
      this.platform,
      this.region,
      this.emulators,
      this.videoOnly,
      this.timing,
      this.values,
      this.runs,
      this.links,
  });

  String weblink;
  String game;
  String category;
  dynamic level;
  dynamic platform;
  dynamic region;
  dynamic emulators;
  bool videoOnly;
  String timing;
  dynamic values;
  List runs;
  List<Link> links;

  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
      weblink: json['weblink'],
      game: json['game'],
      category: json['category'],
      level: json['level'],
      platform: json['platform'],
      region: json['region'],
      emulators: json['emulators'],
      videoOnly: json['video-only'],
      timing: json['timing'],
      values: json['values'],
      runs: json['runs'],
      links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      'weblink': weblink,
      'game': game,
      'category': category,
      'level': level,
      'platform': platform,
      'region': region,
      'emulators': emulators,
      'video-only': videoOnly,
      'timing': timing,
      'values': values,
      'runs': runs,
      'links': List<dynamic>.from(links.map((x) => x.toJson())),
  };
}
