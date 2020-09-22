// To parse this JSON data, do
//
//   final game = gameFromJson(jsonString);
//
// Note:
//   Deleted `moderators` column

import 'dart:convert';

import 'common/asset.dart';
import 'common/link.dart';
import 'common/names.dart';
import 'common/ruleset.dart';

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
