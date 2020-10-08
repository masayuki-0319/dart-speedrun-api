// To parse this JSON data, do
//
//     final run = runFromJson(jsonString);
//
// Note:
//   No parsed `values`
import 'dart:convert';

import 'common/link.dart';

Run runFromJson(Map<String, dynamic> json) => Run.fromJson(json);

String runToJson(Run data) => json.encode(data.toJson());

class Run {
  Run({
      this.id,
      this.weblink,
      this.game,
      this.level,
      this.category,
      this.videos,
      this.comment,
      this.status,
      this.players,
      this.date,
      this.submitted,
      this.times,
      this.system,
      this.splits,
      this.values,
      this.links,
  });

  String id;
  String weblink;
  String game;
  dynamic level;
  String category;
  Videos videos;
  String comment;
  Status status;
  List<Player> players;
  DateTime date;
  dynamic submitted;
  Times times;
  System system;
  Splits splits;
  Map values;
  List<Splits> links;

  factory Run.fromJson(Map<String, dynamic> json) => Run(
      id: json['id'],
      weblink: json['weblink'],
      game: json['game'],
      level: json['level'],
      category: json['category'],
      videos: Videos.fromJson(json['videos']),
      comment: json['comment'],
      status: Status.fromJson(json['status']),
      players: List<Player>.from(json['players'].map((x) => Player.fromJson(x))),
      date: DateTime.parse(json['date']),
      submitted: json['submitted'],
      times: Times.fromJson(json['times']),
      system: System.fromJson(json['system']),
      splits: Splits.fromJson(json['splits']),
      values: json['values'],
      links: List<Splits>.from(json['links'].map((x) => Splits.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      'id': id,
      'weblink': weblink,
      'game': game,
      'level': level,
      'category': category,
      'videos': videos.toJson(),
      'comment': comment,
      'status': status.toJson(),
      'players': List<dynamic>.from(players.map((x) => x.toJson())),
      'date': '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
      'submitted': submitted,
      'times': times.toJson(),
      'system': system.toJson(),
      'splits': splits.toJson(),
      'values': values,
      'links': List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class Splits {
  Splits({
      this.rel,
      this.uri,
  });

  String rel;
  String uri;

  factory Splits.fromJson(Map<String, dynamic> json) => Splits(
      rel: json['rel'],
      uri: json['uri'],
  );

  Map<String, dynamic> toJson() => {
      'rel': rel,
      'uri': uri,
  };
}

class Player {
  Player({
      this.rel,
      this.id,
      this.uri,
      this.name,
  });

  String rel;
  String id;
  String uri;
  String name;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
      rel: json['rel'],
      id: json['id'],
      uri: json['uri'],
      name: json['name'],
  );

  Map<String, dynamic> toJson() => {
      'rel': rel,
      'id': id,
      'uri': uri,
      'name': name,
  };
}

class Status {
  Status({
      this.status,
      this.examiner,
      this.verifyDate,
  });

  String status;
  String examiner;
  DateTime verifyDate;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
      status: json['status'],
      examiner: json['examiner'],
      verifyDate: DateTime.parse(json['verify-date']),
  );

  Map<String, dynamic> toJson() => {
      'status': status,
      'examiner': examiner,
      'verify-date': verifyDate.toIso8601String(),
  };
}

class System {
  System({
      this.platform,
      this.emulated,
      this.region,
  });

  String platform;
  bool emulated;
  dynamic region;

  factory System.fromJson(Map<String, dynamic> json) => System(
      platform: json['platform'],
      emulated: json['emulated'],
      region: json['region'],
  );

  Map<String, dynamic> toJson() => {
      'platform': platform,
      'emulated': emulated,
      'region': region,
  };
}

class Times {
  Times({
      this.primary,
      this.primaryT,
      this.realtime,
      this.realtimeT,
      this.realtimeNoloads,
      this.realtimeNoloadsT,
      this.ingame,
      this.ingameT,
  });

  String primary;
  int primaryT;
  String realtime;
  int realtimeT;
  String realtimeNoloads;
  int realtimeNoloadsT;
  dynamic ingame;
  int ingameT;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
      primary: json['primary'],
      primaryT: json['primary_t'],
      realtime: json['realtime'],
      realtimeT: json['realtime_t'],
      realtimeNoloads: json['realtime_noloads'],
      realtimeNoloadsT: json['realtime_noloads_t'],
      ingame: json['ingame'],
      ingameT: json['ingame_t'],
  );

  Map<String, dynamic> toJson() => {
      'primary': primary,
      'primary_t': primaryT,
      'realtime': realtime,
      'realtime_t': realtimeT,
      'realtime_noloads': realtimeNoloads,
      'realtime_noloads_t': realtimeNoloadsT,
      'ingame': ingame,
      'ingame_t': ingameT,
  };
}

class Videos {
  Videos({
      this.text,
      this.links,
  });

  String text;
  List<Link> links;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
      text: json['text'],
      links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      'text': text,
      'links': List<dynamic>.from(links.map((x) => x.toJson())),
  };
}
