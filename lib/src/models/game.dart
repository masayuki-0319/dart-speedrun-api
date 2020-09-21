// To parse this JSON data, do
//
//   final game = gameFromJson(jsonString);

import 'dart:convert';

Game gameFromJson(Map<String, dynamic> json) => Game.fromJson(json);

String gameToJson(Game data) => json.encode(data.toJson());

class Game {
  Game({
    this.id,
    this.names,
    this.abbreviation,
    this.weblink,
    this.released,
    this.releaseDate,
    this.ruleset,
    this.romhack,
    this.gametypes,
    this.platforms,
    this.regions,
    this.genres,
    this.engines,
    this.developers,
    this.publishers,
    this.created,
    this.assets,
    this.links,
  });

  String id;
  Names names;
  String abbreviation;
  String weblink;
  int released;
  DateTime releaseDate;
  Ruleset ruleset;
  bool romhack;
  List<dynamic> gametypes;
  List<String> platforms;
  List<String> regions;
  List<String> genres;
  List<dynamic> engines;
  List<String> developers;
  List<String> publishers;
  DateTime created;
  Map<String, Asset> assets;
  List<Link> links;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    id: json['id'],
    names: Names.fromJson(json['names']),
    abbreviation: json['abbreviation'],
    weblink: json['weblink'],
    released: json['released'],
    releaseDate: DateTime.parse(json['release-date']),
    ruleset: Ruleset.fromJson(json['ruleset']),
    romhack: json['romhack'],
    gametypes: List<dynamic>.from(json['gametypes'].map((x) => x)),
    platforms: List<String>.from(json['platforms'].map((x) => x)),
    regions: List<String>.from(json['regions'].map((x) => x)),
    genres: List<String>.from(json['genres'].map((x) => x)),
    engines: List<dynamic>.from(json['engines'].map((x) => x)),
    developers: List<String>.from(json['developers'].map((x) => x)),
    publishers: List<String>.from(json['publishers'].map((x) => x)),
    created: DateTime.parse(json['created']),
    assets: Map.from(json['assets']).map((k, v) => MapEntry<String, Asset>(k, v == null ? null : Asset.fromJson(v))),
    links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'names': names.toJson(),
    'abbreviation': abbreviation,
    'weblink': weblink,
    'released': released,
    'release-date': '${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}',
    'ruleset': ruleset.toJson(),
    'romhack': romhack,
    'gametypes': List<dynamic>.from(gametypes.map((x) => x)),
    'platforms': List<dynamic>.from(platforms.map((x) => x)),
    'regions': List<dynamic>.from(regions.map((x) => x)),
    'genres': List<dynamic>.from(genres.map((x) => x)),
    'engines': List<dynamic>.from(engines.map((x) => x)),
    'developers': List<dynamic>.from(developers.map((x) => x)),
    'publishers': List<dynamic>.from(publishers.map((x) => x)),
    'created': created.toIso8601String(),
    'assets': Map.from(assets).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v.toJson())),
    'links': List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class Asset {
  Asset({
    this.uri,
    this.width,
    this.height,
  });

  String uri;
  int width;
  int height;

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
    uri: json['uri'],
    width: json['width'],
    height: json['height'],
  );

  Map<String, dynamic> toJson() => {
    'uri': uri,
    'width': width,
    'height': height,
  };
}

class Link {
  Link({
    this.rel,
    this.uri,
  });

  String rel;
  String uri;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    rel: json['rel'],
    uri: json['uri'],
  );

  Map<String, dynamic> toJson() => {
    'rel': rel,
    'uri': uri,
  };
}

class Names {
  Names({
    this.international,
    this.japanese,
    this.twitch,
  });

  String international;
  String japanese;
  String twitch;

  factory Names.fromJson(Map<String, dynamic> json) => Names(
    international: json['international'],
    japanese: json['japanese'],
    twitch: json['twitch'],
  );

  Map<String, dynamic> toJson() => {
    'international': international,
    'japanese': japanese,
    'twitch': twitch,
  };
}

class Ruleset {
  Ruleset({
    this.showMilliseconds,
    this.requireVerification,
    this.requireVideo,
    this.runTimes,
    this.defaultTime,
    this.emulatorsAllowed,
  });

  bool showMilliseconds;
  bool requireVerification;
  bool requireVideo;
  List<String> runTimes;
  String defaultTime;
  bool emulatorsAllowed;

  factory Ruleset.fromJson(Map<String, dynamic> json) => Ruleset(
    showMilliseconds: json['show-milliseconds'],
    requireVerification: json['require-verification'],
    requireVideo: json['require-video'],
    runTimes: List<String>.from(json['run-times'].map((x) => x)),
    defaultTime: json['default-time'],
    emulatorsAllowed: json['emulators-allowed'],
  );

  Map<String, dynamic> toJson() => {
    'show-milliseconds': showMilliseconds,
    'require-verification': requireVerification,
    'require-video': requireVideo,
    'run-times': List<dynamic>.from(runTimes.map((x) => x)),
    'default-time': defaultTime,
    'emulators-allowed': emulatorsAllowed,
  };
}
